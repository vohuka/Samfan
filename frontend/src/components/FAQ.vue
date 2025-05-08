<template>
  <div class="faq-banner">
    <div class="faq-banner-content">
      <div class="faq-banner-subtitle">We're always here to help</div>
      <h1 class="faq-banner-title">
        Welcome to Online Store Support
      </h1>
      <div class="faq-banner-search">
        <input
          type="text"
          placeholder="What would you like to know?"
          v-model="search"
        />
        <span class="faq-banner-search-icon">
          <svg width="24" height="24" fill="none" stroke="#666" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="11" cy="11" r="8"/>
            <line x1="21" y1="21" x2="16.65" y2="16.65"/>
          </svg>
        </span>
        <button 
          v-if="search" 
          class="faq-banner-search-clear" 
          @click="search = ''"
        >
          ×
        </button>
      </div>
      <div class="faq-banner-tags">
        <button v-for="tag in tags" :key="tag" class="faq-banner-tag" @click="search = tag">{{ tag }}</button>
      </div>
    </div>
    <!-- Decorative icons (optional, can add more for effect) -->
    <div class="faq-banner-icons">
      <span class="icon chat"></span>
      <span class="icon truck"></span>
      <span class="icon gift"></span>
      <span class="icon cart"></span>
      <span class="icon box"></span>
      <span class="icon lock"></span>
      <span class="icon ticket"></span>
      <span class="icon clock"></span>
    </div>
  </div>
  <div class="faq-page">
    <h1>Frequently Asked Questions</h1>
    <div
      class="faq-list"
      :class="{ 'fade-in': faqFade }"
      :key="currentPage + search"
    >
      <div v-if="filteredFaqs.length === 0" class="no-results">
        <p>No FAQs found matching "{{ search }}". Please try a different search term.</p>
      </div>
      <div class="faq-item" v-else v-for="(faq, idx) in paginatedFaqs" :key="(currentPage-1)*pageSize + idx">
        <div class="faq-question" @click="toggle(idx)">
          <span>{{ faq.question }}</span>
          <span>{{ activeIndexes.includes(idx) ? '-' : '+' }}</span>
        </div>
        <transition name="faq-slide">
          <div class="faq-answer" v-if="activeIndexes.includes(idx)">
            {{ faq.answer }}
          </div>
        </transition>
      </div>
    </div>
    <div class="faq-pagination" v-if="totalPages > 1">
      <button
        @click="goToPage(currentPage - 1)"
        :disabled="currentPage === 1"
      >Prev</button>
      <button
        v-for="page in totalPages"
        :key="page"
        @click="goToPage(page)"
        :class="{ active: currentPage === page }"
      >{{ page }}</button>
      <button
        @click="goToPage(currentPage + 1)"
        :disabled="currentPage === totalPages"
      >Next</button>
    </div>
  </div>
  <div class="faq-bottom-banner">
    <div class="banner-image">
      <img src="../assets/faq_bottom_banner.png" alt="Help Support" />
    </div>
    <div class="banner-content">
      <h2 class="banner-title">Helpful online store support</h2>
      <p class="banner-text">
        Need help choosing a new device?<br/>
        Let Samsung's experts answer your questions.
      </p>
      <button class="contact-btn" @click="$router.push('/contact')">
        Contact Us
      </button>
    </div>
  </div>
  <div class="help-banner">
    <div class="help-banner-content">
      <h2 class="help-banner-title">
        Helpful online store support
      </h2>
      <p class="help-banner-text">
        Need help choosing a new device?<br/>
        Let Samsung's experts answer your questions.
      </p>
    </div>
  </div>
</template>

<script>
// import axios from 'axios';
import { fetchFAQs } from '../api/api';

export default {
  name: 'FAQ',
  data() {
    return {
      search: '',
      tags: ['payment', 'shipping', 'Samfan', 'cancellation', 'transaction', 'warranty'],
      activeIndexes: [], // Change from activeIndex: null
      faqs: [],
      currentPage: 1,
      pageSize: 10,
      faqFade: false
    }
  },
  computed: {
    filteredFaqs() {
      if (!this.search.trim()) {
        return this.faqs;
      }
      
      const searchTerm = this.search.toLowerCase().trim();
      return this.faqs.filter(faq => 
        faq.question.toLowerCase().includes(searchTerm) || 
        faq.answer.toLowerCase().includes(searchTerm)
      );
    },
    paginatedFaqs() {
      const start = (this.currentPage - 1) * this.pageSize;
      // Change to use filteredFaqs instead of faqs
      return this.filteredFaqs.slice(start, start + this.pageSize);
    },
    totalPages() {
      // Change to use filteredFaqs instead of faqs
      return Math.ceil(this.filteredFaqs.length / this.pageSize);
    }
  },
  async mounted() {
    // Fetch FAQ từ backend bằng fetchFAQs
    try {
      this.faqs = await fetchFAQs();
      this.triggerFade();
    } catch (err) {
      console.error('Error fetching FAQ:', err);
    }

    // ...existing IntersectionObserver code...
    const bottomBanner = document.querySelector('.faq-bottom-banner');
    const helpBanner = document.querySelector('.help-banner');
    const observerOptions = { threshold: 0.2 };
    const bottomObserver = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting) {
          bottomBanner.classList.add('fade-in');
          bottomObserver.disconnect();
        }
      },
      observerOptions
    );
    const helpObserver = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting) {
          helpBanner.classList.add('fade-in');
          helpObserver.disconnect();
        }
      },
      observerOptions
    );
    bottomObserver.observe(bottomBanner);
    helpObserver.observe(helpBanner);
  },
  methods: {
    toggle(idx) {
      const i = this.activeIndexes.indexOf(idx);
      if (i === -1) {
        this.activeIndexes.push(idx);
      } else {
        this.activeIndexes.splice(i, 1);
      }
    },
    goToPage(page) {
      if (page >= 1 && page <= this.totalPages) {
        this.currentPage = page;
        this.activeIndexes = []; // Reset all expanded on page change
        this.triggerFade();
      }
    },
    triggerFade() {
      this.faqFade = false;
      this.$nextTick(() => {
        setTimeout(() => {
          this.faqFade = true;
        }, 10);
      });
    }
  },
  watch: {
    // Reset to first page when search term changes
    search() {
      this.currentPage = 1;
      this.activeIndexes = [];
      this.triggerFade();
    }
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Rubik:400,500,700&display=swap');

.faq-banner {
  position: relative;
  width: 100%;
  min-height: 420px;
  background: url('../assets/faq_home.jpg') center/cover no-repeat;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  margin-bottom: 40px;
}
.faq-banner-content {
  position: relative;
  z-index: 2;
  text-align: center;
  width: 100%;
  max-width: 700px; 
  margin: 0 auto;
  padding: 24px 10px;
}
.faq-banner-subtitle {
  font-size: 18px; 
  margin-bottom: 8px;
  font-weight: 500;
  opacity: 0.9;
}
.faq-banner-title {
  font-size: 36px; 
  font-weight: bold;
  margin-bottom: 24px;
  line-height: 1.1;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}
.faq-banner-search {
  position: relative;
  width: 90%;
  max-width: 500px; 
  margin: 0 auto 14px auto;
  box-sizing: border-box;
  left: 0; 
  right: 0; 
}
.faq-banner-search input {
  width: 100%;
  padding: 12px 40px; 
  border-radius: 40px;
  border: none;
  font-size: 15px; 
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  color: #222;
  background: #fff;
  outline: none;
  box-shadow: 0 2px 16px 0 rgba(0,0,0,0.07);
  box-sizing: border-box; 
}
.faq-banner-search-icon {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  pointer-events: none;
}
.faq-banner-search-clear {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  font-size: 22px;
  color: #999;
  cursor: pointer;
  padding: 5px;
  line-height: 1;
}

.faq-banner-search-clear:hover {
  color: #2d2eaa;
}
.faq-banner-tags {
  margin-top: 8px;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 10px;
}
.faq-banner-tag {
  background: rgba(255,255,255,0.12);
  border: 1px solid #fff;
  color: #fff;
  border-radius: 22px;
  padding: 6px 18px;
  font-size: 14px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  cursor: pointer;
  transition: background 0.2s, color 0.2s;
}
.faq-banner-tag:hover {
  background: #fff;
  color: #2d2eaa;
}
.faq-banner-icons {
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 1;
}
.icon {
  position: absolute;
  opacity: 0.5;
  font-size: 32px;
}
.icon.chat { left: 10%; top: 70%; }
.icon.truck { left: 85%; top: 80%; }
.icon.gift { left: 12%; top: 85%; }
.icon.cart { left: 60%; top: 90%; }
.icon.box { left: 80%; top: 20%; }
.icon.lock { left: 90%; top: 40%; }
.icon.ticket { left: 30%; top: 10%; }
.icon.clock { left: 60%; top: 12%; }


.faq-page {
  max-width: 700px;
  margin: 0 auto 40px auto;
  padding: 20px;
  background: #fff;
  border-radius: 10px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}
.faq-list {
  margin-top: 30px;
  transition: opacity 0.6s cubic-bezier(0.4,0,0.2,1), transform 0.6s cubic-bezier(0.4,0,0.2,1);
  opacity: 0;
  transform: translateY(24px);
}
.faq-list.fade-in {
  opacity: 1;
  transform: translateY(0);
}
.faq-item {
  border-bottom: 1px solid #eee;
  padding: 15px 0;
}
.faq-question {
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
  display: flex;
  justify-content: space-between;
  align-items: center;
  
  font-family: 'Rubik', Arial, sans-serif;
}
.faq-answer {
  margin-top: 20px;
  font-size: 18px;
  color: #333;
  
  font-family: 'Rubik', Arial, sans-serif;
}

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.pagination button {
  background: transparent;
  border: 1px solid #2d2eaa;
  color: #2d2eaa;
  padding: 10px 20px;
  margin: 0 5px;
  border-radius: 20px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.pagination button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.pagination button:hover:not(:disabled) {
  background: #2d2eaa;
  color: #fff;
}

.faq-pagination {
  display: flex;
  justify-content: center;
  gap: 8px;
  margin: 24px 0;
}
.faq-pagination button {
  padding: 10px 20px;
  border: 1px solid #2d2eaa;
  background: #fff;
  color: #2d2eaa;
  border-radius: 20px;
  cursor: pointer;
  font-weight: 500;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 16px;
  transition: background 0.2s, color 0.2s;
}
.faq-pagination button.active,
.faq-pagination button:hover {
  background: #2d2eaa;
  color: #fff;
}
.faq-pagination button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
.circle-btn {
  font-family: 'Roboto', Arial, sans-serif;
  width: 38px;
  height: 38px;
  border-radius: 50%;
  border: 1.5px solid #2d2eaa;
  background: #fff;
  color: #2d2eaa;
  cursor: pointer;
  font-weight: 500;
  font-size: 16px;
  outline: none;
  transition: background 0.2s, color 0.2s, border 0.2s;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 2px;
  padding: 0;
}
.circle-btn.active,
.circle-btn:hover {
  background: #2d2eaa;
  color: #fff;
  border: 1.5px solid #2d2eaa;
}
.circle-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.faq-bottom-banner {
  position: relative;
  width: 90%;
  height: 500px;
  border-radius: 24px;
  margin: 40px auto;
  background: #fff;
  display: flex;
  align-items: center;
  overflow: hidden;
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 0.8s cubic-bezier(0.4,0,0.2,1), transform 0.8s cubic-bezier(0.4,0,0.2,1);
}

.faq-bottom-banner.fade-in {
  opacity: 1;
  transform: translateY(0);
}

.banner-image {
  flex: 1;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px;
}

.banner-image img {
  max-width: 100%;
  height: 100%;
  object-fit: contain;
}

.banner-content {
  flex: 1;
  position: relative;
  z-index: 2;
  padding: 60px 80px;
  text-align: left;
}

.banner-title {
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 42px;
  font-weight: bold;
  margin-bottom: 30px;
  color: #000;
}

.banner-text {
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 20px;
  line-height: 1.6;
  margin-bottom: 40px;
  color: #666;
}

.contact-btn {
  background: transparent;
  color: #2d2eaa;
  border: 2px solid #2d2eaa;
  padding: 15px 40px;
  border-radius: 30px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.contact-btn:hover {
  background: #2d2eaa;
  color: #fff;
}

@media (max-width: 768px) {
  .faq-bottom-banner {
    flex-direction: column;
    height: auto;
  }
  
  .banner-image {
    width: 100%;
    height: 300px;
  }
  
  .banner-content {
    padding: 40px 20px;
  }
  
  .banner-title {
    font-size: 32px;
  }
  
  .banner-text {
    font-size: 16px;
  }
}

.help-banner {
  position: relative;
  width: 90%;
  height: 500px;
  border-radius: 24px;
  margin: 40px auto;
  background: url('../assets/faq_help_banner.png') center/cover no-repeat;
  display: flex;
  align-items: center;
  overflow: hidden;
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 0.8s cubic-bezier(0.4,0,0.2,1), transform 0.8s cubic-bezier(0.4,0,0.2,1);
}

.help-banner.fade-in {
  opacity: 1;
  transform: translateY(0);
}

.help-banner-content {
  flex: 1;
  position: relative;
  z-index: 2;
  padding: 60px 80px;
  text-align: right;
  color: #fff;
  margin-left: auto;
  max-width: 600px;
}

.help-banner-title {
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 42px;
  font-weight: bold;
  margin-bottom: 30px;
  margin-top: 0;
  line-height: 1.2;
}

.help-banner-text {
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 20px;
  line-height: 1.6;
  margin-bottom: 0;
  opacity: 0.9;
  br {
    margin-bottom: 8px;
  }
}

@media (max-width: 768px) {
  .help-banner-content {
    padding: 40px 20px;
    text-align: center;
    margin: 0 auto;
  }
  
  .help-banner-title {
    font-size: 32px;
    margin-bottom: 20px;
  }
  
  .help-banner-text {
    font-size: 16px;
  }
}

.faq-slide-enter-active,
.faq-slide-leave-active {
  transition: max-height 0.35s cubic-bezier(0.4,0,0.2,1), opacity 0.35s cubic-bezier(0.4,0,0.2,1);
  overflow: hidden;
}
.faq-slide-enter-from,
.faq-slide-leave-to {
  max-height: 0;
  opacity: 0;
}
.faq-slide-enter-to,
.faq-slide-leave-from {
  max-height: 200px; 
  opacity: 1;
}

.no-results {
  text-align: center;
  padding: 30px 0;
  color: #666;
  font-size: 18px;
}




.faq-banner-search {
  position: relative;
  width: 90%;
  max-width: 500px;
  margin: 0 auto 14px;
  box-sizing: border-box;
}


@media (max-width: 768px) {
  .faq-banner-search {
    width: 90%;
    max-width: none;
    margin-left: auto;
    margin-right: auto;
  }
  
  .faq-banner-search input {
    padding: 10px 40px 10px 40px; 
    font-size: 14px;
    width: 100%;
    box-sizing: border-box;
  }
  
  .faq-banner-search-icon {
    left: 12px; 
  }
  
  .faq-banner-search-clear {
    right: 12px; 
  }
}


@media (max-width: 480px) {
  .faq-banner-content {
    padding: 20px 10px;
    width: 100%;
    box-sizing: border-box;
  }
  
  .faq-banner-search {
    width: 94%;
    padding: 0;
    margin: 0 auto 14px;
  }
  
  .faq-banner-search input {
    padding: 8px 36px 8px 36px; 
    font-size: 13px;
  }
  
  .faq-banner-search-icon {
    left: 12px;
  }
  
  .faq-banner-search-clear {
    right: 12px;
  }
}


@media (max-width: 360px) {
  .faq-banner-search {
    width: 90%;
  }
  
  .faq-banner-search input {
    padding: 7px 32px 7px 32px; 
    font-size: 12px;
  }
}
</style>