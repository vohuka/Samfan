<template>
  <div class="cart-page">
    <h2>Your cart</h2>
    <div v-if="user">
      <div v-if="cartItems.length" class="cart-items">
        <div v-for="item in cartItems" :key="item.id" class="cart-item">
          <img :src="`/images/${item.image}`" :alt="item.name" class="cart-item-image" />
          <div class="cart-item-info">
            <h3>{{ item.name }}</h3>
            <div class="cart-item-specs">
              <p><strong>Storage:</strong> {{ item.memory }}</p>
              <p><strong>Color:</strong> {{ item.color }}</p>
              <p><strong>RAM:</strong> {{ item.ram }}</p>
            </div>
            <p id="price_product">{{ formatPrice(item.price) }} VND</p>
          </div>
          <div class="cart-item-quantity">
            <button @click="decreaseQuantity(item.id)">-</button>
            <span>{{ item.quantity }}</span>
            <button @click="increaseQuantity(item.id)">+</button>
          </div>
          <div class="cart-item-actions">
            <button @click="removeItem(item.id)" class="remove-button">Delete</button>
          </div>
        </div>
        <div class="cart-footer">
          <p class="total-price" style="font-size: 16px; color: black;">TOTAL: <span style="margin-left: 10px; color: red; font-size: 30px;">{{ formatPrice(totalPrice) }}</span> VND</p>
          <button class="checkout-button" @click="showQRCode">Thanh toán</button>

          <div v-if="showQR" class="qr-overlay">
            <div class="qr-modal">
              <img src="../assets/qr-code.jpg" alt="QR Code" class="qr-image" />
              <button class="close-button" @click="showQR = false">X</button>
            </div>
          </div>
        </div>
      </div>
      <div v-else class="empty-cart">
        <img src="../assets/empty.png" alt="Empty">
        <p>Your cart is empty.</p>
        <router-link to="/product" class="continue-shopping">Continue to buy</router-link>
      </div>
    </div>
    <div v-else class="cart-login-prompt">
      <p>Please login to see a various discounts and continue to buy</p>
      <div class="login-buttons-container">
        <button @click="toggleLogin">Login</button>
        <button @click="goToProduct">Continue to buy</button>
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
  </div>
</template>

<script>
import { mapState } from 'vuex';
import toastr from 'toastr';
import 'toastr/build/toastr.min.css';
import { fetchCart, updateCart, removeFromCart, signup, login } from '../api/api';

export default {
  name: 'CartPage',
  data() {
    return {
      showQR: false,
      isLoginOpen: false,
      isLoginForm: true,
      loginError: '',
      windowWidth: window.innerWidth,
      breakpoints: {
        mobile: 576,
        tablet: 768,
        desktop: 1200
      },
      loginForm: {
        username: '',
        password: ''
      },
      signupForm: {
        username: '',
        fullName: '',
        email: '',
        phone: '',
        address: '',
        password: '',
        confirmPassword: ''
      }
    };
  },
  computed: {
    ...mapState(['cartItems', 'user']),
    totalPrice() {
      return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
    },
    isMobile() {
      return this.windowWidth < this.breakpoints.tablet;
    },
    isTablet() {
      return this.windowWidth >= this.breakpoints.tablet && this.windowWidth < this.breakpoints.desktop;
    },
    isDesktop() {
      return this.windowWidth >= this.breakpoints.desktop;
    },
    deviceType() {
      if (this.windowWidth < this.breakpoints.mobile) return 'mobile-small';
      if (this.windowWidth < this.breakpoints.tablet) return 'mobile';
      if (this.windowWidth < this.breakpoints.desktop) return 'tablet';
      return 'desktop';
    }
  },
  methods: {
    showQRCode() {
      this.showQR = true;
    },
    formatPrice(price) {
      return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
    async increaseQuantity(itemId) {
      try {
        const res = await updateCart(itemId, 'increase');
        if (res.success) {
          this.$store.dispatch('increaseQuantity', itemId);
        }
      } catch (err) {
        console.error('Error increasing quantity:', err);
      }
    },
    async decreaseQuantity(itemId) {
      try {
        const res = await updateCart(itemId, 'decrease');
        if (res.success) {
          this.$store.dispatch('decreaseQuantity', itemId);
        }
      } catch (err) {
        console.error('Error decreasing quantity:', err);
      }
    },
    async removeItem(itemId) {
      try {
        const res = await removeFromCart(itemId);
        if (res.success) {
          this.$store.dispatch('removeFromCart', itemId);
        }
      } catch (err) {
        console.error('Error removing item:', err);
      }
    },
    toggleLogin() {
      this.isLoginOpen = !this.isLoginOpen;
      if (!this.isLoginOpen) this.clearLoginForm();
    },
    clearLoginForm() {
      this.loginForm.username = '';
      this.loginForm.password = '';
      this.loginError = '';
      this.signupForm = {
        username: '',
        fullName: '',
        email: '',
        phone: '',
        address: '',
        password: '',
        confirmPassword: ''
      };
    },
    toggleForm() {
      this.isLoginForm = !this.isLoginForm;
      this.loginError = '';
    },
    async handleLogin(type) {
      if (type === 'admin') {
        if (this.loginForm.username === 'admin' && this.loginForm.password === 'password') {
          localStorage.setItem('isAdmin', 'true');
          window.location.href = '/admin/index.html';
          this.toggleLogin();
        } else {
          this.loginError = 'Invalid admin credentials';
          toastr.error('Wrong credentials');
        }
      } else {
        try {
          const res = await login(this.loginForm);
          if (res.success) {
            toastr.success('Login successful!');
            // Update the user state in Vuex
            this.$store.dispatch('setUser', res.user);
            // Close the login modal
            this.isLoginOpen = false;
            // Immediately load cart data
            await this.loadCart();
            // Force component to update
            this.$forceUpdate();
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
    async handleSignup() {
      try {
        const res = await signup(this.signupForm);
        if (res.success) {
          toastr.success('Signup successful! Please login.');
          this.toggleForm();
        } else {
          toastr.error(res.message || 'Signup failed');
        }
      } catch (err) {
        toastr.error('Signup error');
      }
    },
    goToProduct() {
      this.$router.push('/product');
    },
    async loadCart() {
      if (this.user) {
        try {
          const res = await fetchCart();
          if (res.success) {
            this.$store.dispatch('setCartItems', res.cartItems);
          }
        } catch (err) {
          console.error('Error loading cart:', err);
        }
      }
    },
    checkScreen() {
      this.windowWidth = window.innerWidth;
      // Tùy chỉnh giao diện dựa trên kích thước màn hình nếu cần
      if (this.isMobile) {
        // Thực hiện các điều chỉnh cần thiết cho giao diện mobile
        console.log('Mobile view activated');
      } else if (this.isTablet) {
        // Thực hiện các điều chỉnh cần thiết cho giao diện tablet
        console.log('Tablet view activated');
      } else {
        // Thực hiện các điều chỉnh cần thiết cho giao diện desktop
        console.log('Desktop view activated');
      }
    },
    handleResize() {
      this.checkScreen();
    }
  },
  watch: {
    // Add this watcher to react to user state changes
    user(newValue) {
      if (newValue) {
        // User is logged in, load the cart
        this.loadCart();
      }
    }
  },
  async mounted() {
    // Check session status on component mount
    try {
      const res = await login.checkSession();
      if (res && res.loggedIn) {
        // If already logged in, update user state
        this.$store.dispatch('setUser', res.user);
      }
    } catch (error) {
      console.error('Error checking session:', error);
    }
    
    this.loadCart();
    this.checkScreen();
    window.addEventListener('resize', this.handleResize);
    console.log(`Current device: ${this.deviceType}`);
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.handleResize);
  }
};
</script>

<style scoped>
.cart-page {
  padding: 30px;
  max-width: 1200px;
  margin: 0 auto;
  font-family: 'Samsung Sharp Sans';
}

.cart-page h2 {
  font-size: 28px;
  margin-bottom: 20px;
  text-align: center;
}

.cart-items {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.cart-item-specs {
  display: flex;
  gap: 40px;
  width: 100%;
}

.cart-item {
  display: flex;
  align-items: center;
  gap: 20px;
  padding: 15px;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  background: #fff;
}

.cart-item-image {
  width: 100px;
  height: 100px;
  object-fit: contain;
}

.cart-item-info {
  flex-grow: 1;
}

.cart-item-info h3 {
  margin: 0;
  font-size: 25px;
  font-weight: bold;
}

.cart-item-info p {
  margin: 10px 0;
  font-size: 16px;
}

.cart-item-info p strong {
  color: #333;
}

.cart-item-info p {
  color: #666;
}

#price_product {
  color: #d32f2f;
  font-weight: 600;
  font-size: 18px;
  font-family: 'Samsung Sharp Sans';
  margin-top: 0;
}

.cart-item-quantity {
  display: flex;
  align-items: center;
  gap: 20px;
}

.cart-item-quantity button {
  padding: 5px 10px;
  border: 1px solid #ccc;
  background: #f9f9f9;
  cursor: pointer;
  border-radius: 4px;
}

.cart-item-quantity span {
  font-size: 16px;
  min-width: 30px;
  text-align: center;
}

.cart-item-actions .remove-button {
  padding: 5px 15px;
  border: 1px solid #dc3545;
  background: #dc3545;
  color: white;
  cursor: pointer;
  border-radius: 4px;
  transition: background 0.3s;
  font-family: 'Samsung Sharp Sans';
}

.cart-item-actions .remove-button:hover {
  background: #c82333;
}

.qr-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.qr-modal {
  background: white;
  padding: 20px;
  border-radius: 8px;
  position: relative;
}

.qr-image {
  width: 300px;
  height: 300px;
}

.cart-item-quantity button,
.cart-item-actions button,
.checkout-button,
.continue-shopping,
.cart-login-prompt button,
.login-buttons button,
.close-button {
  transition: all 0.2s ease;
}

.cart-item-quantity button:active,
.cart-item-actions button:active,
.checkout-button:active,
.continue-shopping:active,
.cart-login-prompt button:active,
.login-buttons button:active,
.close-button:active {
  transform: scale(0.95);
}


.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  background: red;
  color: white;
  border: none;
  padding: 5px 10px;
  cursor: pointer;
}

.cart-footer {
  margin-top: 20px;
  text-align: right;
}

.total-price {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

.checkout-button {
  background: #1428a0;
  color: white;
  border: none;
  padding: 12px 25px;
  border-radius: 5px;
  cursor: pointer;
  font-family: 'Samsung Sharp Sans';
  font-size: 16px;
}

.checkout-button:hover {
  background: #0f1f7a;
}

.empty-cart,
.cart-login-prompt {
  text-align: center;
  padding: 40px;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  background: #fff;
}

.empty-cart p,
.cart-login-prompt p {
  font-size: 20px;
  font-weight: 500;
  margin-bottom: 20px;
}

.empty-cart img {
  width: 5%;
}

.continue-shopping,
.cart-login-prompt button {
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  font-family: 'Samsung Sharp Sans';
  font-size: 16px;
  cursor: pointer;
}

.continue-shopping {
  border: 2px solid black;
  color: #000;
  border-radius: 20px;
  margin-top: 10px;
}

.continue-shopping:hover {
  background: #e9e9e9;
}

.cart-login-prompt button {
  background: #1428a0;
  color: white;
  border: none;
  margin: 0 10px;
}

.cart-login-prompt button:nth-child(2) {
  background: transparent;
  border: 1px solid #1428a0;
  color: #1428a0;
}

.cart-login-prompt button:hover {
  background: #0f1f7a;
}

.cart-login-prompt button:nth-child(2):hover {
  background: rgba(20, 40, 160, 0.1);
}

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

.login-buttons-container {
  display: flex;
  justify-content: center;
  gap: 15px;
  margin-top: 20px;
}

.login-modal {
    background: white;
  width: 90%;
  max-width: 400px;
  border-radius: 10px;
  padding: 30px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.2);
  transition: all 0.3s ease;
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

.btn-filled-dark {
  background: #1428a0;
  color: white;
  border: none;
}

.btn-outline-dark {
  background: transparent;
  color: #1428a0;
  border: 1px solid #1428a0;
}

.btn-filled-dark:hover {
  background: #0f1f7a;
}

.btn-outline-dark:hover {
  background: rgba(20, 40, 160, 0.1);
}

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

/* Laptop và màn hình lớn (mặc định) */
@media screen and (min-width: 1201px) {
  .cart-item {
    padding: 20px;
    gap: 25px;
  }
  
  .cart-item-image {
    width: 120px;
    height: 120px;
  }
  
  .cart-item-specs {
    gap: 50px;
  }
}

/* Máy tính bảng (landscape) */
@media screen and (max-width: 1200px) {
  .cart-page {
    padding: 20px;
  }
  
  .cart-item-specs {
    gap: 30px;
  }
  
  .cart-item-info h3 {
    font-size: 22px;
  }
}

/* Máy tính bảng (portrait) */
@media screen and (max-width: 992px) {
  .cart-item {
    padding: 15px;
    gap: 15px;
  }
  
  .cart-item-image {
    width: 90px;
    height: 90px;
  }
  
  .cart-item-specs {
    flex-direction: column;
    gap: 5px;
  }
  
  .cart-item-specs p {
    margin: 5px 0;
  }
  
  .cart-item-info h3 {
    font-size: 20px;
  }
  
  #price_product {
    font-size: 16px;
  }
  
  .cart-item-quantity {
    gap: 10px;
  }
}

/* Tablet nhỏ */
@media screen and (max-width: 768px) {
  .cart-page {
    padding: 15px;
  }
  
  .cart-page h2 {
    font-size: 24px;
  }
  
  .cart-item {
    flex-wrap: wrap;
  }
  
  .cart-item-image {
    width: 80px;
    height: 80px;
  }
  
  .cart-item-info {
    width: calc(100% - 100px);
  }
  
  .cart-item-quantity {
    order: 3;
    margin-top: 10px;
    margin-left: 100px;
  }
  
  .cart-item-actions {
    order: 4;
    margin-top: 10px;
    margin-left: auto;
  }
  
  .cart-footer .total-price {
    text-align: center;
    margin-bottom: 15px;
  }
  
  .checkout-button {
    width: 100%;
  }
  
  .empty-cart img {
    width: 15%;
  }
}

/* Điện thoại */
@media screen and (max-width: 576px) {
  .cart-page {
    padding: 10px;
  }
  
  .cart-page h2 {
    font-size: 20px;
    margin-bottom: 15px;
  }
  
  .cart-item {
    padding: 10px;
  }
  
  .cart-item-image {
    width: 70px;
    height: 70px;
  }
  
  .cart-item-info {
    width: calc(100% - 85px);
  }
  
  .cart-item-info h3 {
    font-size: 16px;
  }
  
  .cart-item-info p {
    font-size: 14px;
  }
  
  #price_product {
    font-size: 15px;
  }
  
  .cart-item-quantity {
    margin-left: 0;
    width: 100%;
    justify-content: flex-start;
  }
  
  .cart-item-actions {
    width: 100%;
    text-align: right;
  }
  
  .cart-footer .total-price {
    font-size: 14px;
  }
  
  .cart-footer .total-price span {
    font-size: 24px;
  }
  
  .empty-cart,
  .cart-login-prompt {
    padding: 20px;
  }
  
  .empty-cart p,
  .cart-login-prompt p {
    font-size: 16px;
  }
  
  .empty-cart img {
    width: 30%;
  }
  
  .continue-shopping,
  .cart-login-prompt button {
    padding: 8px 16px;
    font-size: 14px;
    display: inline-block;
    margin-top: 10px;
  }
  
  .cart-login-prompt button {
    display: block;
    width: 100%;
    margin: 10px 0;
  }
  
  /* Cải thiện form đăng nhập/đăng ký trên mobile */
  .login-form {
    max-height: 60vh;
  }
  
  .form-group input {
    padding: 10px;
  }
  
  .login-buttons {
    flex-direction: column;
  }
  
  .login-buttons button {
    width: 100%;
  }
  
  .qr-image {
    width: 250px;
    height: 250px;
  }
}

/* Điện thoại nhỏ */
@media screen and (max-width: 375px) {
  .cart-item-info h3 {
    font-size: 14px;
  }
  
  .cart-item-info p {
    font-size: 12px;
  }
  
  #price_product {
    font-size: 14px;
  }
  
  .cart-item-quantity button {
    padding: 3px 8px;
  }
  
  .cart-item-actions .remove-button {
    padding: 4px 12px;
    font-size: 12px;
  }
  
  .cart-footer .total-price span {
    font-size: 20px;
  }
  
  .checkout-button {
    font-size: 14px;
    padding: 10px 20px;
  }
  
  .qr-image {
    width: 200px;
    height: 200px;
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
</style>