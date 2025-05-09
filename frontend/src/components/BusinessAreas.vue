<template>
  <div class="business-areas-container">
    
    <nav class="top-nav">
      <div class="nav-container">
        <div class="brand-text">Business Areas</div>
        <ul>
          <li><a href="#" @click.prevent="$router.push('/about')">Company Information</a></li>
          <li class="dropdown">
            <a href="#" @click.prevent.stop="toggleDropdown('business')">
              Business Areas
              <span
                class="nav-arrow"
                :class="{ 'arrow-up': isBusinessDropdownOpen }"
              >▼</span>
            </a>
            <transition name="fade-dropdown">
              <div class="dropdown-content" v-if="isBusinessDropdownOpen" @click.stop>
                <a href="#">Overview</a>
                <a href="#">Consumer Electronics</a>
                <a href="#">Mobile & Network</a>
                <a href="#">Device Solutions</a>
                <a href="#">Research & Development</a>
              </div>
            </transition>
          </li>
          <li class="dropdown">
            <a href="#" @click.prevent.stop="toggleDropdown('brand')">
              Brand Identity
              <span
                class="nav-arrow"
                :class="{ 'arrow-up': isBrandDropdownOpen }"
              >▼</span>
            </a>
            <transition name="fade-dropdown">
              <div class="dropdown-content" v-if="isBrandDropdownOpen" @click.stop>
                <a href="#">Overview</a>
                <a href="#">Brand Story</a>
                <a href="#">Heritage</a>
                <a href="#">Logo</a>
                <a href="#">Color & Print Identity</a>
                <a href="#">Sound</a>
              </div>
            </transition>
          </li>
          <li class="dropdown">
            <a href="#" @click.prevent.stop="toggleDropdown('careers')">
              Careers
              <span
                class="nav-arrow"
                :class="{ 'arrow-up': isCareersDropdownOpen }"
              >▼</span>
            </a>
            <transition name="fade-dropdown">
              <div class="dropdown-content" v-if="isCareersDropdownOpen" @click.stop>
                <a href="#">Overview</a>
                <a href="#">Working at Samfan</a>
                <a href="#">Job Categories</a>
              </div>
            </transition>
          </li>
          <li>
            <a href="#">Investor Relations</a>
            <span class="nav-arrow">→</span>
          </li>
          <li>
            <a href="#">Newsroom</a>
            <span class="nav-arrow">→</span>
          </li>
          <li><a href="#">Ethics</a></li>
        </ul>
      </div>
    </nav>

    
    <section class="banner business-banner">
      <div class="banner-content">
        <h2 class="section-title">Business Areas</h2>
        <h1 class="banner-title">Leading Technology Innovation</h1>
        <p class="banner-text">
          Pioneering the future with breakthrough technologies across multiple industries.
        </p>
      </div>
      <div class="banner-image"></div>
    </section>

    
    <section class="business-desc">
      <p>
        Samfan Electronics continuously reinvents the future. We explore the unknown to bring technology that helps people all over the world live happier, healthier lives.
      </p>
    </section>

    
    <section class="business-highlight-banner">
      <div class="highlight-content">
        <h2 class="highlight-title">Creating What's Next</h2>
        <div class="highlight-text">
          <p>Our innovation-led approach delivers breakthrough products and experiences that enrich people's lives.</p>
          <a href="#" class="learn-more-btn">Discover our products</a>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'BusinessAreasPage',
  data() {
    return {
      isBusinessDropdownOpen: false,
      isBrandDropdownOpen: false,
      isCareersDropdownOpen: false
    }
  },
  methods: {
    toggleDropdown(type) {
      if (type === 'business') {
        this.isBusinessDropdownOpen = !this.isBusinessDropdownOpen;
        this.isBrandDropdownOpen = false;
        this.isCareersDropdownOpen = false;
      } else if (type === 'brand') {
        this.isBrandDropdownOpen = !this.isBrandDropdownOpen;
        this.isBusinessDropdownOpen = false;
        this.isCareersDropdownOpen = false;
      } else if (type === 'careers') {
        this.isCareersDropdownOpen = !this.isCareersDropdownOpen;
        this.isBusinessDropdownOpen = false;
        this.isBrandDropdownOpen = false;
      }
    },
    handleClickOutside(event) {
      if (!this.$el.contains(event.target)) {
        this.isBusinessDropdownOpen = false;
        this.isBrandDropdownOpen = false;
        this.isCareersDropdownOpen = false;
      }
    }
  },
  mounted() {
    document.addEventListener('click', this.handleClickOutside);
  },
  beforeUnmount() {
    document.removeEventListener('click', this.handleClickOutside);
  }
}
</script>

<style scoped>

.business-areas-container {
  width: 100%;
}


.top-nav {
  width: 100%;
  background: white;
  padding: 15px 0;
  border-bottom: 1px solid #e6e6e6;
}

.nav-container {
  max-width: 1920px;
  margin: 0 auto;
  padding: 0 40px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.brand-text {
  font-family: 'Samsung Sharp Sans';
  font-size: 22px;
  font-weight: bold;
  white-space: nowrap;
}

.top-nav ul {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  gap: 30px;
  align-items: center;
  height: 100%;
}

.top-nav li {
  position: relative;
  display: flex;
  align-items: center;
  height: 100%;
  padding: 15px 0;
}

.top-nav a {
  text-decoration: none;
  color: #000;
  font-family: 'Samsung Sharp Sans';
  font-size: 14px;
}

.nav-arrow {
  margin-left: 5px;
  font-size: 10px;
  color: #666;
  display: inline-block;
  transition: transform 0.2s;
}

.arrow-up {
  transform: rotate(180deg);
}


.banner {
  position: relative;
  width: 100%;
  height: 500px; 
  color: white;
  font-family: 'Samsung Sharp Sans';
}


.business-banner {
  background-image: url('../assets/AS.2_BusinessArea_img01.jpg');
  background-position: center top; 
  background-size: cover;
  background-repeat: no-repeat;
  overflow: hidden; 
}


.banner-content {
  position: absolute;
  left: 10%;
  top: 50%; 
  transform: translateY(-50%);
  max-width: 600px;
  padding: 20px;
  background-color: rgba(0, 0, 0, 0.059); 
  border-radius: 8px; 
  backdrop-filter: blur(3px); 
}


.section-title,
.banner-title,
.banner-text {
  margin-left: 0;
  margin-right: 0;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3); 
}

.section-title {
  font-size: 16px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 10px;
}


.banner-title {
  font-size: 54px; 
  font-weight: bold;
  margin: 20px 0;
  line-height: 1.2;
}

.banner-text {
  font-size: 18px;
  line-height: 1.6;
}


@media screen and (max-width: 768px) {
  .banner {
    height: 400px;
  }
  
  .banner-content {
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 15px;
    width: calc(100% - 40px); 
    max-width: 500px;
  }
  
  .section-title {
    font-size: 14px;
  }
  
  .banner-title {
    font-size: 32px;
    margin: 15px 0;
  }
  
  .banner-text {
    font-size: 16px;
  }
}

@media screen and (max-width: 480px) {
  .banner {
    height: 350px;
  }
  
  .banner-title {
    font-size: 28px;
  }
  
  .banner-text {
    font-size: 14px;
  }
}


.dropdown {
  position: relative;
  height: 100%;
}

.dropdown-content {
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #fff;
  min-width: 250px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  z-index: 1000;
  margin-top: 15px;
  border-radius: 8px;
  border: 1px solid #000;
}

.dropdown > a {
  padding: 0;
  height: 100%;
  display: flex;
  align-items: center;
}

.dropdown-content a {
  color: #000;
  padding: 15px 20px;
  text-decoration: none;
  display: block;
  font-size: 14px;
  font-family: 'Samsung Sharp Sans';
  border-bottom: 1px solid #f1f1f1;
  transition: all 0.3s ease;
}

.dropdown-content a:last-child {
  border-bottom: none;
}

.dropdown::after {
  content: '';
  position: absolute;
  top: calc(100% + 5px);
  left: 20px;
  border-width: 0 10px 10px 10px;
  border-style: solid;
  border-color: transparent transparent #fff transparent;
  display: none;
  z-index: 1001;
}

.dropdown:hover::after {
  display: block;
}


.business-desc {
  max-width: 1200px;
  margin: 60px auto 0 auto;
  padding: 50px 20px;
  text-align: center;
}

.business-desc p {
  font-size: 48px; 
  font-weight: bold; 
  line-height: 1.3;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}


.business-highlight-banner {
  width: 100%;
  height: 600px;
  background-image: url('../assets/AS.2_BusinessArea_img02.avif');
  background-size: cover;
  background-position: center;
  margin: 80px 0;
  position: relative;
  display: flex;
  align-items: center;
}

.business-highlight-banner::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  
}

.highlight-content {
  position: relative;
  z-index: 2;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 40px;
  padding-left: 120px;
  width: 100%;
  color: white;
}

.highlight-title {
  font-size: 52px;
  font-weight: bold;
  line-height: 1.2;
  margin-bottom: 30px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  max-width: 600px;
}

.highlight-text {
  max-width: 500px;
}

.highlight-text p {
  font-size: 20px;
  line-height: 1.5;
  margin-bottom: 30px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}

.learn-more-btn {
  display: inline-block;
  background-color: white;
  color: black;
  padding: 15px 30px;
  text-decoration: none;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-weight: 500;
  border-radius: 30px;
  font-size: 16px;
  transition: transform 0.3s ease, background-color 0.3s ease;
}

.learn-more-btn:hover {
  background-color: #f2f2f2;
  transform: translateY(-3px);
}


@media screen and (max-width: 768px) {
  .business-highlight-banner {
    height: 500px;
  }
  
  .highlight-title {
    font-size: 36px;
  }
  
  .highlight-text p {
    font-size: 18px;
  }
  
  .learn-more-btn {
    padding: 12px 25px;
    font-size: 14px;
  }
}

@media screen and (max-width: 480px) {
  .business-highlight-banner {
    height: 400px;
  }
  
  .highlight-title {
    font-size: 30px;
  }
  
  .highlight-text p {
    font-size: 16px;
  }
}


.fade-dropdown-enter-active, .fade-dropdown-leave-active {
  transition: opacity 0.25s;
}
.fade-dropdown-enter-from, .fade-dropdown-leave-to {
  opacity: 0;
}
.fade-dropdown-enter-to, .fade-dropdown-leave-from {
  opacity: 1;
}


@media screen and (max-width: 768px) {
  .nav-container {
    flex-direction: column;
    align-items: flex-start;
    padding: 0 10px;
  }

  .brand-text {
    font-size: 18px;
    margin-bottom: 10px;
  }

  .top-nav ul {
    flex-direction: column;
    gap: 0;
    width: 100%;
  }

  .top-nav li {
    width: 100%;
    padding: 10px 0;
    justify-content: flex-start;
  }

  .top-nav a {
    font-size: 16px;
    padding: 10px 0;
    width: 100%;
    display: block;
  }

  .dropdown-content {
    width: 100%;
    position: static;
    box-shadow: none;
    margin-top: 0;
    border: none;
  }
  
  .dropdown::after {
    display: none;
  }

  .dropdown-content a {
    padding: 12px 16px;
    font-size: 15px;
  }
}




.highlight-content {
  position: relative;
  z-index: 2;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 40px;
  padding-left: 120px; 
  width: 100%;
  color: white;
}




@media screen and (max-width: 1199px) {
  .highlight-content {
    padding-left: 80px; 
  }
  
  .business-desc p {
    font-size: 40px; 
    padding: 0 20px;
  }
}


@media screen and (max-width: 991px) {
  .highlight-content {
    padding-left: 60px;
  }
  
  .business-desc p {
    font-size: 32px;
    padding: 0 30px;
  }
  
  .business-highlight-banner {
    height: 500px;
  }
  
  .banner {
    height: 450px;
  }
}


@media screen and (max-width: 767px) {
  .highlight-content {
    padding: 0 30px;
    padding-left: 40px; 
  }
  
  .business-desc {
    padding: 40px 15px;
    margin: 40px auto 0 auto;
  }
  
  .business-desc p {
    font-size: 24px;
    line-height: 1.4;
  }
  
  .highlight-title {
    font-size: 32px;
    margin-bottom: 20px;
  }
  
  .highlight-text {
    max-width: 450px;
  }
  
  .highlight-text p {
    font-size: 16px;
    margin-bottom: 20px;
  }
  
  .learn-more-btn {
    padding: 12px 20px;
    font-size: 14px;
  }
  
  .banner-title {
    font-size: 28px;
  }
}


@media screen and (max-width: 575px) {
  .highlight-content {
    padding: 0 20px; 
    text-align: center; 
  }
  
  .highlight-title {
    font-size: 28px;
    max-width: 100%; 
  }
  
  .highlight-text {
    max-width: 100%; 
  }
  
  .business-desc p {
    font-size: 20px; 
  }
  
  .business-highlight-banner {
    height: 400px;
    margin: 40px 0;
  }
  
  .banner {
    height: 300px;
  }
  
  .banner-content {
    width: 90%;
    padding: 10px;
  }
  
  .banner-title {
    font-size: 24px;
    margin: 10px 0;
  }
  
  .banner-text {
    font-size: 13px;
  }
  
  .section-title {
    font-size: 12px;
  }
  
  
  .nav-container {
    padding: 0 15px;
  }
}


@media screen and (max-width: 375px) {
  .highlight-content {
    padding: 0 15px;
  }
  
  .highlight-title {
    font-size: 24px;
  }
  
  .business-desc p {
    font-size: 18px;
  }
  
  .business-highlight-banner {
    height: 350px;
  }
  
  .learn-more-btn {
    padding: 10px 16px;
    font-size: 12px;
  }
  
  .banner-title {
    font-size: 20px;
  }
}
</style>