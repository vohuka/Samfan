<!-- src/components/Header.vue -->
 
<template>
  <header class="samfan-header">
    <div class="header-container">
      <div class="logo">
        <router-link to="/">
          <img src="../assets/logo.png" alt="Samsung Logo">
        </router-link>
      </div>
      <nav class="main-navigation" :class="{ 'active': isMenuOpen }">
        <button @click="toggleMenu" class="close-menu-btn">×</button>
        <ul>
          <li><router-link to="/">Home</router-link></li>
          <li><router-link to="/about">About</router-link></li> 
          <li class="dropdown">
            <router-link to="/product">Product</router-link>
            <div class="dropdown-content">
              <router-link to="/mobile" class="dropdown-item">Mobile</router-link>
              <router-link to="/tvav" class="dropdown-item">TV & Speaker</router-link>
              <router-link to="/application" class="dropdown-item">Application</router-link>
            </div>
          </li>
          <li><router-link to="/contact">Contact</router-link></li>
          <li><router-link to="/faq">FAQ</router-link></li> <!-- Thêm dòng này -->
        </ul>
      </nav>
      <div class="header-actions">
        <div class="search-container">
          <button @click="toggleSearch" class="icon-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="11" cy="11" r="8"></circle>
              <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            
          </button>
        </div>
        <div class="cart-container">
          <button class="icon-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="9" cy="21" r="1"></circle>
              <circle cx="20" cy="21" r="1"></circle>
              <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
            </svg>
          </button>
        </div>
        <div class="login-container">
          <button class="icon-btn" @click="toggleLogin">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
              <circle cx="12" cy="7" r="4"></circle>
            </svg>
          </button>
        </div>

        <!-- Menu Button (Mobile) -->
        <div class="phone-menu">
          <button @click="toggleMenu" class="icon-btn menu-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <line x1="3" y1="12" x2="21" y2="12"></line>
              <line x1="3" y1="6" x2="21" y2="6"></line>
              <line x1="3" y1="18" x2="21" y2="18"></line>
            </svg>
          </button>
        </div>

      </div>
    </div>

    <!-- Search Overlay -->
    <div v-if="isSearchOpen" class="search-overlay" :class="{ 'mobile-search': isMobile }">
      <div class="search-modal">
        <div class="search-input-container">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="search-icon">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
          </svg>
          <input 
            type="text" 
            placeholder="Tìm kiếm" 
            v-model="searchQuery" 
            @input="performSearch"
            class="search-input"
          >
          <button @click="closeSearch" class="close-search">×</button>
        </div>

        <div class="search-suggestions">
          <div class="suggestion-section">
            <h3>TRENDING</h3>
            <ul>
              <li>A56</li>
              <li>Galaxy S24 Ultra</li>
              <li>A55</li>
              <li>Galaxy Flip6</li>
            </ul>
          </div>
          <div class="suggestion-section">
            <h3>SUGGESTIONS</h3>
            <div class="suggested-products">
              <div class="product-card" v-for="product in suggestedProducts" :key="product.id">
                <img :src="product.image" :alt="product.name">
                <div class="product-details">
                  <span class="product-name">{{ product.name }}</span>
                  <span class="product-price">{{ product.price }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Login/Signup Overlay -->
    <div v-if="isLoginOpen" class="login-overlay" :class="{ 'mobile-login': isMobile }">
      <div class="login-modal">
        <div class="login-header">
          <h2>{{ isLoginForm ? 'Login' : 'Sign Up' }}</h2>
          <button @click="toggleLogin" class="close-login">×</button>
        </div>

        <!-- Login Form -->
        <form v-if="isLoginForm" class="login-form" @submit.prevent="handleLogin('user')">
          <div class="form-group">
            <label for="username">Username</label>
            <input 
              type="text" 
              id="username"
              v-model="loginForm.username"
              placeholder="Enter username"
              required
            >
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input 
              type="password"
              id="password" 
              v-model="loginForm.password"
              placeholder="Enter password"
              required
            >
          </div>

          <div v-if="loginError" class="login-error">
            {{ loginError }}
          </div>

          <div class="login-buttons">
            <button type="submit" class="btn-filled-dark">Login</button>
            <button type="button" class="btn-outline-dark" @click="handleLogin('admin')">
              Login as Admin
            </button>
          </div>

          <div class="form-switch">
            Don't have an account? 
            <button type="button" class="switch-btn" @click="toggleForm">Sign Up</button>
          </div>
        </form>

        <!-- Signup Form -->
        <form v-else class="login-form" @submit.prevent="handleSignup">
          <div class="form-group">
            <label for="signup-username">Username</label>
            <input 
              type="text" 
              id="signup-username"
              v-model="signupForm.username"
              placeholder="Choose username"
              required
            >
          </div>

          <div class="form-group">
            <label for="signup-fullname">Full Name</label>
            <input 
              type="text"
              id="signup-fullname"
              v-model="signupForm.fullName"
              placeholder="Enter your full name"
              required
            >
          </div>

          <div class="form-group">
            <label for="signup-email">Email</label>
            <input 
              type="email"
              id="signup-email"
              v-model="signupForm.email"
              placeholder="Enter email"
              required
            >
          </div>

          <div class="form-group">
            <label for="signup-phone">Phone</label>
            <input 
              type="text"
              id="signup-phone"
              v-model="signupForm.phone"
              placeholder="Enter phone number"
              required
            >
          </div>

          <div class="form-group">
            <label for="signup-address">Address</label>
            <input 
              type="text"
              id="signup-address"
              v-model="signupForm.address"
              placeholder="Enter address"
              required
            >
          </div>

          <div class="form-group">
            <label for="signup-password">Password</label>
            <input 
              type="password"
              id="signup-password"
              v-model="signupForm.password"
              placeholder="Create password"
              required
            >
          </div>

          <div class="form-group">
            <label for="signup-confirm">Confirm Password</label>
            <input 
              type="password"
              id="signup-confirm"
              v-model="signupForm.confirmPassword"
              placeholder="Confirm password"
              required
            >
          </div>

          <div class="login-buttons">
            <button type="submit" class="btn-filled-dark">Sign Up</button>
          </div>

          <div class="form-switch">
            Already have an account? 
            <button type="button" class="switch-btn" @click="toggleForm">Login</button>
          </div>
        </form>
      </div>
    </div>

    <!-- Profile Dropdown -->
    <div v-if="isProfileOpen" class="profile-dropdown" @click.stop>
      <div class="profile-info" v-if="user">
        <p><strong>Username:</strong> {{ user.username }}</p>
        <p><strong>Full Name:</strong> {{ user.full_name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Phone:</strong> {{ user.phone }}</p>
        <p><strong>Address:</strong> {{ user.address }}</p>
        <div class="login-buttons">
          <button class="btn-filled-dark" @click="handleLogout">Logout</button>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
import toastr from 'toastr'
import 'toastr/build/toastr.min.css'
import galaxyA56 from '../assets/galaxy-a56.webp'
import galaxyA36 from '../assets/galaxy-a36.avif'
import galaxyA06 from '../assets/galaxy-a06.avif'
import galaxyA16 from '../assets/galaxy-a16.avif'
import { signup, login, logout, checkSession } from '../api/api';

export default {
  name: 'SamfanHeader',
  data() {
    return {
      isSearchOpen: false,
      isMenuOpen: false,
      isLoginOpen: false,
      windowWidth: window.innerWidth,
      searchQuery: '',
      loginForm: {
        username: '',
        password: ''
      },
      loginError: '',
      isLoginForm: true, // true for login, false for signup
      signupForm: {
        username: '',
        fullName: '',
        email: '',
        phone: '',
        address: '',
        password: '',
        confirmPassword: ''
      },
      suggestedProducts: [
        {
          id: 1,
          name: 'Galaxy A56 5G',
          price: '9.490.000 VND',
          image: galaxyA56
        },
        {
          id: 2,
          name: 'Galaxy A36 5G',
          price: '7.990.000 VND',
          image: galaxyA36
        },
        {
          id: 3,
          name: 'Galaxy A06',
          price: '3.489.500 VND',
          image: galaxyA06
        },
        {
          id: 4,
          name: 'Galaxy A16 5G',
          price: '5.889.600 VND',
          image: galaxyA16
        }
      ],
      user: null, // Thêm biến user
      isProfileOpen: false, // Thêm biến trạng thái overlay profile
    }
  },
  methods: {
    toggleSearch() {
      this.isSearchOpen = true;
      // Close menu if it's open
      if (this.isMenuOpen) {
        this.isMenuOpen = false;
      }
    },
    toggleLogin() {
      if (this.user) {
        // Nếu đã login, mở overlay profile
        this.isProfileOpen = !this.isProfileOpen;
      } else {
        // Nếu chưa login, mở overlay login
        this.isLoginOpen = !this.isLoginOpen;
        if (!this.isLoginOpen) {
          this.clearLoginForm();
        }
        if (this.isSearchOpen) {
          this.isSearchOpen = false;
        }
      }
    },
    closeSearch() {
      this.isSearchOpen = false;
      this.searchQuery = '';
    },
    performSearch() {
      // Implement search logic here
      console.log('Searching for:', this.searchQuery);
    },
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
      // Close search if it's open
      if (this.isSearchOpen) {
        this.isSearchOpen = false;
      }
    },
    checkScreen() {
      this.windowWidth = window.innerWidth;
      this.isMobile = this.windowWidth < 768;
    },
    async handleLogin(type) {
      if (type === 'admin') {
        if (this.loginForm.username === 'admin' && this.loginForm.password === 'password') {
          localStorage.setItem('isAdmin', 'true')
          // Sử dụng window.location để direct đến file HTML
          window.location.href = '/admin/index.html'
          this.toggleLogin()
        } else {
          this.loginError = 'Invalid admin credentials'
          toastr.error('Wrong credentials');
        }
      } else {
        try {
          const res = await login(this.loginForm);
          if (res.success) {
            // alert('Login successful!');
            toastr.success('Login successful!');
            this.user = res.user; // Lưu thông tin user
            this.isLoginOpen = false; // Đóng khung login sau khi đăng nhập thành công
            // Optionally save user info to state or localStorage
          } else {
            this.loginError = res.message || 'Login failed';
            toastr.error('Wrong credentials');
          }
        } catch (err) {
          this.loginError = 'Login error';
          toastr.error('Wrong credentials');
        }
      }
    },
    clearLoginForm() {
      this.loginForm.username = '';
      this.loginForm.password = '';
      this.loginError = '';
    },
    toggleForm() {
      this.isLoginForm = !this.isLoginForm;
      this.loginError = '';
    },
    async handleSignup() {
      try {
        const res = await signup(this.signupForm);
        if (res.success) {
          alert('Signup successful! Please login.');
          this.toggleForm();
        } else {
          alert(res.message || 'Signup failed');
        }
      } catch (err) {
        alert('Signup error');
      }
    },
    async handleLogout() {
      await logout();
      this.user = null;
      this.isProfileOpen = false;
      toastr.success('Successfully logged out!');
    },
    handleClickOutsideProfile(e) {
      // Đóng dropdown nếu click ngoài
      if (this.isProfileOpen) {
        const dropdown = document.querySelector('.profile-dropdown');
        const iconBtn = document.querySelector('.login-container .icon-btn');
        if (
          dropdown && !dropdown.contains(e.target) &&
          iconBtn && !iconBtn.contains(e.target)
        ) {
          this.isProfileOpen = false;
        }
      }
    }
  },
  async mounted() {
    this.checkScreen();
    window.addEventListener('resize', this.checkScreen);
    document.addEventListener('click', this.handleClickOutsideProfile);

    // Kiểm tra trạng thái đăng nhập khi load trang
    try {
      const res = await checkSession();
      if (res.loggedIn) {
        this.user = res.user;
      }
    } catch (e) {
      // Không cần xử lý gì thêm
    }
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.checkScreen);
    document.removeEventListener('click', this.handleClickOutsideProfile);
  }
}
</script>

<style scoped>
.samfan-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 40px;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  font-family: 'Samsung Sharp Sans';
  font-weight: 500;
  position: relative;
}
.header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}
.logo img {
  height: 40px;
}
.main-navigation ul {
  display: flex;
  list-style: none;
  gap: 30px;
  
}
.main-navigation a {
  text-decoration: none;
  color: #000;
  font-weight: bold;
  padding: 10px;
  
}
.main-navigation a:hover {
  border-bottom: 2px solid black; 
}

/* Dropdown styles */
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #fff;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  border-radius: 4px;
  top: 100%;
  left: 0;
  margin-top: 5px;
}

.dropdown:hover .dropdown-content {
  display: flex;
  flex-direction: column;
}

.dropdown-item {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
  border-bottom: 1px solid #f1f1f1;
}

.dropdown-item:last-child {
  border-bottom: none;
}

.dropdown-item:hover {
  background-color: #f9f9f9;
  color: #1428a0;
  border-bottom: 1px solid #f1f1f1 !important;
}

.dropdown-item:hover:last-child {
  border-bottom: none !important;
}

.header-actions {
  display: flex;
  gap: 15px;
  align-items: center;
}

.icon-btn {
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px;
}

.icon-btn svg {
  stroke: black;
  width: 24px;
  height: 24px;
}

.phone-menu {
  display: none;
}
.close-menu-btn {
  display: none;
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  position: absolute;
  top: 10px;
  right: 10px;
  color: #000;
}

.search-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: flex-start;
  z-index: 1000;
  padding-top: 100px;
}

.search-modal {
  background: white;
  width: 80%;
  /* max-width: 1200px; */
  border-radius: 10px;
  padding: 20px;
}

.search-input-container {
  display: flex;
  align-items: center;
  border-bottom: 1px solid #ddd;
  padding-bottom: 10px;
  position: relative;
  
}

.search-icon {
  /* margin-right: 10px; */
  align-items: center;
  align-content: center;
}

.search-input {
  flex-grow: 1;
  border: none;
  font-size: 18px;
  outline: none;
}

.close-search {
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
}

.search-suggestions {
  display: flex;
  margin-top: 20px;
}

.suggestion-section {
  flex: 1;
  padding: 0 10px;
}

.suggestion-section h3 {
  color: #666;
  margin-bottom: 10px;
}

.suggestion-section ul {
  list-style: none;
  padding: 0;
}

.suggestion-section ul li {
  padding: 5px 0;
  cursor: pointer;
}

.suggested-products {
  display: flex;
  gap: 15px;
  
}

.product-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.product-card img {
  max-width: 150px;
  height: auto;
}

.product-details {
  display: flex;
  flex-direction: column;
  margin-top: 10px;
}

.product-name {
  font-weight: bold;
}

.product-price {
  color: #666;
}

@media screen and (max-width: 1080px) {
  .samfan-header {
    padding: 15px 20px;
  }
  
  .main-navigation {
    position: fixed;
    top: 0;
    right: -100%;
    width: 250px;
    height: 100vh;
    background-color: white;
    z-index: 1001;
    transition: right 0.3s ease;
    box-shadow: -2px 0 5px rgba(0,0,0,0.1);
    padding: 50px 20px 20px;
  }
  
  .main-navigation.active {
    right: 0;
  }
  
  .main-navigation ul {
    flex-direction: column;
    gap: 15px;
  }
  
  .main-navigation a {
    display: block;
    padding: 10px 0;
    font-size: 20px;
  }
  
  /* Mobile dropdown */
  .dropdown-content {
    position: static;
    display: none;
    box-shadow: none;
    background-color: #f9f9f9;
    margin-top: 0;
    padding-left: 20px;
  }
  
  .dropdown.open .dropdown-content {
    display: block;
  }
  
  .dropdown-item {
    padding: 8px 16px;
  }
  
  .close-menu-btn {
    display: block;
  }
  
  .phone-menu {
    display: block;
  }
  
  /* Mobile search overlay */
  .search-overlay.mobile-search {
    padding-top: 0;
    justify-content: flex-end;
  }
  
  .search-overlay.mobile-search .search-modal {
    width: 85%;
    height: 100vh;
    border-radius: 0;
    margin-right: 0;
    overflow-y: auto;
    animation: slideIn 0.3s forwards;
  }
  
  .search-suggestions {
    flex-direction: column;
  }
  
  .suggested-products {
    justify-content: space-between;
  }
  
  .product-card {
    width: calc(50% - 10px); /* 2 phones per row with gap */
  }
  
  .product-card img {
    max-width: 100%;
  }
}
/* Tablet responsive */

/* Animation for search overlay sliding in */
@keyframes slideIn {
  from {
    transform: translateX(100%);
  }
  to {
    transform: translateX(0);
  }
}
/* Hide images on very small screens */

.login-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.login-modal {
  background: white;
  width: 90%;
  max-width: 400px;
  border-radius: 10px;
  padding: 30px;
}

.login-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 25px;
}

.login-header h2 {
  margin: 0;
  font-family: 'Samsung Sharp Sans';
  font-size: 24px;
}

.close-login {
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  color: #000;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
  max-height: 70vh;
  overflow-y: auto;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group label {
  font-weight: 500;
  color: #333;
}

.form-group input {
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
  font-family: 'Samsung Sharp Sans';
}

.form-group input:focus {
  outline: none;
  border-color: #1428a0;
}

.form-group input::placeholder {
  font-family: 'Samsung Sharp Sans';
  color: #666;
}

.login-buttons {
  display: flex;
  gap: 15px;
  margin-top: 10px;
}

.login-buttons button {
  flex: 1;
  padding: 12px;
  border-radius: 25px;
  cursor: pointer;
  font-family: 'Samsung Sharp Sans';
  font-size: 14px;
  font-weight: 500;
  transition: all 0.2s ease;
}

.login-error {
  color: #dc3545;
  font-size: 14px;
  margin-top: -10px;
  text-align: center;
  font-family: 'Samsung Sharp Sans';
}

.form-switch {
  text-align: center;
  margin-top: 15px;
  font-size: 14px;
  color: #666;
  font-family: 'Samsung Sharp Sans';
}

.switch-btn {
  background: none;
  border: none;
  color: #1428a0;
  cursor: pointer;
  font-weight: 500;
  padding: 0 5px;
  font-family: 'Samsung Sharp Sans';
  font-size: 14px;
}

/* Mobile responsive */
@media screen and (max-width: 1080px) {
  .login-overlay.mobile-login {
    align-items: flex-end;
  }
  
  .login-overlay.mobile-login .login-modal {
    width: 100%;
    max-width: none;
    border-radius: 10px 10px 0 0;
    animation: slideUp 0.3s forwards;
  }
}

@keyframes slideUp {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0);
  }
}

/* Thêm style cho các nút filled và outline */
.btn-filled-dark {
  background: #1428a0;
  color: white;
  border: none;
  font-family: 'Samsung Sharp Sans';
}

.btn-outline-dark {
  background: transparent;
  color: #1428a0;
  border: 1px solid #1428a0;
  font-family: 'Samsung Sharp Sans';
}

/* Thêm hover effects cho các nút */
.btn-filled-dark:hover {
  background: #0f1f7a;
}

.btn-outline-dark:hover {
  background: rgba(20, 40, 160, 0.1);
}

.profile-info p {
  margin: 8px 0;
  font-size: 15px;
  color: #222;
}

.profile-dropdown {
  position: absolute;
  top: 60px;
  right: 20px;
  background: white;
  border-radius: 10px;
  box-shadow: 0 4px 16px rgba(0,0,0,0.15);
  padding: 20px 24px 12px 24px;
  min-width: 240px;
  z-index: 2000;
  animation: fadeInProfile 0.2s;
}
@keyframes fadeInProfile {
  from { opacity: 0; transform: translateY(-10px);}
  to { opacity: 1; transform: translateY(0);}
}


</style>

<style>
/* Toastr custom font */
#toast-container > div,
#toast-container .toast {
  font-family: 'Rubik', Arial, sans-serif !important;
}
</style>