<template>
  <div class="about-container">
    <!-- Top Navigation Bar -->
    <nav class="top-nav">
      <div class="nav-container">
        <div class="brand-text">About Us</div>
        <ul>
          <li><a href="#">Company Information</a></li>
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

    <!-- Banner Section -->
    <section class="banner">
      <div class="banner-content">
        <h2 class="section-title">Company Information</h2>
        <h1 class="banner-title">Mission & Values</h1>
        <p class="banner-text">
          Our commitment is to operate responsibly 
          as a leading global company.
        </p>
      </div>
      <div class="banner-image"></div>
    </section>

    <section class="about-desc">
      <p>
        Samfan is committed to complying with local laws and regulations as well as applying a strict global code of conduct to all employees. The company believes that ethical management is not only a tool for responding to the rapid changes in the global business environment, but also a means for building trust with various stakeholders including customers, shareholders, employees, business partners, and local communities. With the goal of becoming one of the world’s most ethical companies, Samfan continues to train its employees and operate monitoring systems, while practicing transparent and fair corporate management.
      </p>
    </section>



    <!-- Banner Section 2 -->
    <section
      class="banner banner-2"
      :class="{ 'fade-in': banner2Visible }"
      ref="banner2"
    >
      <div class="banner2-content">
        <h2 class="banner2-title">Mission & Approach</h2>
        <p class="banner2-text">
          Samfan follows a simple business philosophy: to devote its talent and technology to creating superior products and services that contribute to a better global society. To achieve this, Samfan highly values its people and technology.
        </p>
      </div>
      <div class="banner2-image"></div>
    </section>

    <!-- Banner Section 3 -->
    <section
      class="banner banner-3"
      :class="{ 'fade-in': banner3Visible }"
      ref="banner3"
    >
      <div class="banner3-content">
        <h2 class="banner3-title">Samfan’s Core Values</h2>
        <p class="banner3-text">
          Samfan believes that living by strong values is the key to good business. That’s why these core values, together with a strict code of conduct, are at the heart of every decision the company makes.
        </p>
      </div>
      <div class="banner3-image"></div>
    </section>

    <!-- Banner Section 4 -->
    <section
      class="banner banner-4"
      :class="{ 'fade-in': banner4Visible }"
      ref="banner4"
    >
      <div class="banner4-content">
        <h2 class="banner4-title">Samfan Business Principles</h2>
        <p class="banner4-text">
          To demonstrate its commitment to social responsibility as a leading global company, Samfan Electronics announced the 'Samfan Business Principles' in 2005. 
        </p>
      </div>
      <div class="banner4-image"></div>
    </section>
  </div>

  <!-- CEO Information Section -->
  <section class="ceo-info">
    <h2 class="ceo-title">Our CEO Information</h2>
    <div class="ceo-photo">
      <img src="@/assets/ceo.jpg" alt="Samfan CEO" />
    </div>
    <h3 class="ceo-name">Bob</h3>
    <ul class="ceo-details">
      <li>Vice Chairman and CEO [2025~Present]</li>
      <li>Head of Device Solutions (DS) & Memory Business & SAIT [2024~Present]</li>
      <li>Head of Future Business Division [2023~2024]</li>
      <li>Chairman of the Board, Samsung SDI Co., Ltd. [2022~2023]</li>
      <li>CEO, Samsung SDI Co., Ltd. [2017~2022]</li>
      <li>Head of Memory Business [2014~2017]</li>
    </ul>
  </section>
</template>

<script>
export default {
  name: 'AboutPage',
  data() {
    return {
      isBusinessDropdownOpen: false,
      isBrandDropdownOpen: false,
      isCareersDropdownOpen: false,
      banner2Visible: false,
      banner3Visible: false,
      banner4Visible: false
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
      // Kiểm tra nếu click ngoài dropdown thì đóng tất cả dropdown
      if (!this.$el.contains(event.target)) {
        this.isBusinessDropdownOpen = false;
        this.isBrandDropdownOpen = false;
        this.isCareersDropdownOpen = false;
      }
    },
    observeBanner2() {
      const banner2 = this.$refs.banner2;
      if (!banner2) return;
      const observer = new IntersectionObserver(
        (entries) => {
          if (entries[0].isIntersecting) {
            this.banner2Visible = true;
            observer.disconnect();
          }
        },
        { threshold: 0.2 }
      );
      observer.observe(banner2);
    },
    observeBanner3() {
      const banner3 = this.$refs.banner3;
      if (!banner3) return;
      const observer = new IntersectionObserver(
        (entries) => {
          if (entries[0].isIntersecting) {
            this.banner3Visible = true;
            observer.disconnect();
          }
        },
        { threshold: 0.2 }
      );
      observer.observe(banner3);
    },
    observeBanner4() {
      const banner4 = this.$refs.banner4;
      if (!banner4) return;
      const observer = new IntersectionObserver(
        (entries) => {
          if (entries[0].isIntersecting) {
            this.banner4Visible = true;
            observer.disconnect();
          }
        },
        { threshold: 0.2 }
      );
      observer.observe(banner4);
    }
  },
  mounted() {
    document.addEventListener('click', this.handleClickOutside);
    this.observeBanner2();
    this.observeBanner3();
    this.observeBanner4();
  },
  beforeUnmount() {
    document.removeEventListener('click', this.handleClickOutside);
  }
}
</script>

<style scoped>
.about-container {
  width: 100%;
}

/* Navigation Styles */
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

/* Banner Styles */
.banner {
  position: relative;
  width: 100%;
  height: 600px;
  background: url('../assets/samsung_building.jpg') center/cover;
  color: black;
}

.banner-content {
  position: absolute;
  left: 10%;
  top: 50%;
  transform: translateY(-50%);
  max-width: 600px;
}

.section-title {
  font-family: 'Samsung Sharp Sans';
  font-size: 16px;
  margin-bottom: 20px;
}

.banner-title {
  font-family: 'Samsung Sharp Sans';
  font-size: 48px;
  margin: 20px 0;
  font-weight: bold;
}

.banner-text {
  font-family: 'Samsung Sharp Sans';
  font-size: 18px;
  line-height: 1.6;
}

.banner-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Banner 2, 3, 4 Styles chung */
.banner-2,
.banner-3,
.banner-4 {
  position: relative;
  width: 90%;
  height: 500px;
  border-radius: 24px;
  margin: 40px auto;
  overflow: hidden;
  display: flex;
  align-items: center;
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 0.8s cubic-bezier(0.4,0,0.2,1), transform 0.8s cubic-bezier(0.4,0,0.2,1);
}

.banner-2.fade-in,
.banner-3.fade-in,
.banner-4.fade-in {
  opacity: 1;
  transform: translateY(0);
}

/* Background images riêng */
.banner-2 {
  background: url('../assets/about_banner2.jpg') center/cover no-repeat;
}
.banner-3 {
  background: url('../assets/about_banner3.jpg') center/cover no-repeat;
}
.banner-4 {
  background: url('../assets/about_banner4.jpg') center/cover no-repeat;
}

/* Content chung cho 3 banner */
.banner2-content,
.banner3-content,
.banner4-content {
  position: relative;
  z-index: 2;
  color: #fff;
  padding: 0px 80px 60px 80px;
  max-width: 800px;
}

.banner2-title,
.banner3-title,
.banner4-title {
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 30px;
  font-weight: bold;
  margin-bottom: 30px;
  margin-top: 0;
}

.banner2-text,
.banner3-text,
.banner4-text {
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
  font-size: 20px;
  line-height: 1.5;
  margin-bottom: 0;
}

.banner2-image,
.banner3-image,
.banner4-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Responsive chung */
@media screen and (max-width: 900px) {
  .banner-2,
  .banner-3,
  .banner-4 {
    height: 350px;
  }
  .banner2-content,
  .banner3-content,
  .banner4-content {
    padding: 30px 20px;
    max-width: 100%;
  }
  .banner2-title,
  .banner3-title,
  .banner4-title {
    font-size: 32px;
  }
  .banner2-text,
  .banner3-text,
  .banner4-text {
    font-size: 18px;
  }
}

/* Add responsive styles */
@media screen and (max-width: 1200px) {
  .nav-container {
    padding: 0 20px;
  }
  
  .top-nav ul {
    gap: 20px;
  }
}

/* Dropdown Styles */
.dropdown {
  position: relative;
  height: 100%;
}

.dropdown-content {
  /* display: none; */
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

/* Add padding wrapper to keep dropdown visible when moving to content */
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
/* Modify the show dropdown behavior */
/* .dropdown:hover .dropdown-content {
  display: block;
} */

/* Update arrow position */
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

/* Responsive adjustments */
@media screen and (max-width: 768px) {
  .dropdown-content {
    width: 100%;
    position: static;
    box-shadow: none;
    margin-top: 0;
  }
  
  .dropdown::after {
    display: none;
  }
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
    position: static;
    min-width: 100%;
    box-shadow: none;
    margin-top: 0;
    border: none;
  }

  .dropdown-content a {
    padding: 12px 16px;
    font-size: 15px;
  }
}

/* Fade transition for dropdown */
.fade-dropdown-enter-active, .fade-dropdown-leave-active {
  transition: opacity 0.25s;
}
.fade-dropdown-enter-from, .fade-dropdown-leave-to {
  opacity: 0;
}
.fade-dropdown-enter-to, .fade-dropdown-leave-from {
  opacity: 1;
}

.about-desc {
  max-width: 1200px;
  margin: 60px auto 0 auto;
  padding: 50px 20px;
  text-align: center;
}

.about-desc p {
  font-size: 20px;
  line-height: 1.7;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}

.ceo-info {
  max-width: 1200px;
  margin: 60px auto;
  padding: 50px 20px;
  text-align: center;
}

.ceo-title {
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 20px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}

.ceo-photo img {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 20px;
}

.ceo-name {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}

.ceo-details {
  list-style: none;
  padding: 0;
  font-size: 18px;
  line-height: 1.6;
  font-family: 'Samsung Sharp Sans', Arial, sans-serif;
}

/* Hiệu ứng underline cho navbar và dropdown */
.top-nav a,
.dropdown-content a {
  position: relative;
  overflow: hidden;
}

/* Tạo underline động */
.top-nav a::after,
.dropdown-content a::after {
  content: '';
  position: absolute;
  left: 50%;
  bottom: 0;
  width: 0;
  height: 2px;
  background: #000;
  transition: width 0.3s cubic-bezier(.4,0,.2,1), left 0.3s cubic-bezier(.4,0,.2,1);
}

/* Khi hover: underline từ giữa ra hai bên */
.top-nav a:hover::after,
.dropdown-content a:hover::after {
  width: 100%;
  left: 0;
}

/* Khi không hover: underline thu lại vào giữa */
.top-nav a::after,
.dropdown-content a::after {
  width: 0;
  left: 50%;
}

@media screen and (max-width: 600px) {
  .banner-2,
  .banner-3,
  .banner-4 {
    height: 520px;
    max-height: 700px;
    min-height: 400px;
    border-radius: 16px;
    width: 100%;
  }
  .banner2-content,
  .banner3-content,
  .banner4-content {
    padding: 18px 18px 32px 24px;
  }
}

@media screen and (max-width: 600px) {
  .about-desc p {
    text-align: justify;
  }
}
</style>