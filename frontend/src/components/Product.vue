<template>
  <div class="samsung-home">
    <section class="hero-banner">
      <video class="video-background" autoplay loop muted playsinline :src="videoSource">
        <source :src="videoSource" type="video/webm">
        <!-- Fallback nếu trình duyệt không hỗ trợ video WebM -->
        Your browser does not support the video tag.
      </video>
      <div class="banner-content">
        <div class="banner-actions">
          <button class="primary-btn" @click="handleLearnMore">Learn More</button>
          <button class="secondary-btn" @click="handleBuyNow">Buy Now</button>
        </div>
      </div>
    </section>

    <section class="suggest-products">
      <h2>Suggest for you</h2>
      <div class="suggest-product-container">
        <button class="carousel-arrow carousel-prev" @click="prevProduct" :disabled="currentProductIndex === 0">
          &lt;
        </button>
        
        <div class="suggest-product-wrapper">
          <transition-group name="slide" tag="div" class="suggest-product-grid">
            <div 
              v-for="product in visibleProducts"
              :key="product.id"
              class="suggest-product-card"
            >
              <img :src="product.image" :alt="product.title" v-if="product.image">
              <h3>{{ product.title }}</h3>
              <p>{{ product.color }}</p>
              <p>{{ product.size }}</p>
              <h3>{{product.price}}</h3>
              <button>Buy now</button>
            </div>
          </transition-group>
        </div>
        
        <button class="carousel-arrow carousel-next" @click="nextProduct" :disabled="currentProductIndex >= products.length - productsToShow">
          &gt;
        </button>
      </div>
    </section>

    <section class="trending">
      <h2 class="section-title">Trending Products</h2>
      
      <div class="category-tabs">
        <button 
          v-for="(category, index) in categories" 
          :key="index"
          @click="activeCategory = index"
          :class="['category-tab', { active: activeCategory === index }]"
        >
          {{ category.name }}
        </button>
      </div>
      
      <transition-group name="fade" tag="div" class="product-container">
        <div v-if="activeCategory === 0" key="uudai" class="product-grid-trending">
          <!-- Sản phẩm cho tab Ưu đãi -->
          <div class="trending-product-card large">
            <div class="badge">New</div>
            <img src="../assets/e-voucher.avif" alt="E-Voucher">
            <div class="product-info">
              <h3>Get E-Voucher 3.000.000 VNĐ just with 100k</h3>
              <p>Applicable to NEW AI HOUSEHOLD products 2025</p>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/galaxy-a56.webp" alt="Galaxy A56">
            <div class="product-info">
              <h3>Galaxy A56 5G discount upto 500k</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/S25.png" alt="Galaxy S25">
            <div class="product-info">
              <h3>Galaxy S25 | S25+ Trade-in for a new one</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/fridge.png" alt="Fridge">
            <div class="product-info">
              <h3>Opening sale price from 41.5 million VND</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/TV.png" alt="Galaxy Buds3">
            <div class="product-info">
              <h3>Buy with Galaxy Buds3 discount 10% in combo</h3>
              <button>Buy now</button>
            </div>
          </div>
        </div>
        
        <!-- Other category content remains the same -->
        <div v-if="activeCategory === 1" key="dienthoai" class="product-grid-trending">
          <!-- Sản phẩm cho tab Điện Thoại -->
          <div class="trending-product-card large">
            <div class="badge">New</div>
            <img src="../assets/S25U_Xanh_Ngoc_PC.avif" alt="Galaxy S25 Ultra">
            <div class="product-info">
              <h3>Galaxy S25 Ultra</h3>
              <p>Flagship with breakthrough camera</p>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/S24_Series.jpg" alt="Galaxy Z Fold5">
            <div class="product-info">
              <h3>Galaxy S24 512GB. X2 storage SAME PRICE</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/a26.png" alt="Galaxy Z Flip5">
            <div class="product-info">
              <h3>Galaxy A26 5G. Give Charge 25W</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/s24-fe.avif" alt="Galaxy S24-FE">
            <div class="product-info">
              <h3>Galaxy S24 FE discount 2.500.000VND</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/TabS10_PC4.avif" alt="Galaxy A56">
            <div class="product-info">
              <h3>Galaxy Tab S10 Series. Discount 4.400.000VND</h3>
              <button>Buy now</button>
            </div>
          </div>
        </div>
        
        <div v-if="activeCategory === 2" key="tvav" class="product-grid-trending">
          <!-- Sản phẩm cho tab TV&AV -->
          <div class="trending-product-card large">
            <div class="badge">New</div>
            <img src="../assets/tv0.avif" alt="QLED TV">
            <div class="product-info">
              <h3>Buds just from 3 millions when buy with 1 television</h3>
              <p> 65 inch QLED 4K Smart TV </p>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/tv1.avif" alt="Neo QLED">
            <div class="product-info">
              <h3>Neo QLED 8K</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/tv2.webp" alt="tv2">
            <div class="product-info">
              <h3>TV S90D 65 Inch </h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/tv3.webp" alt="TV3">
            <div class="product-info">
              <h3>The Frame 75 Inch</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/tv4.avif" alt="TV4">
            <div class="product-info">
              <h3>TV DU9000 98 Inch</h3>
              <button>Buy now</button>
            </div>
          </div>
        </div>
        
        <div v-if="activeCategory === 3" key="giadung" class="product-grid-trending">
          <!-- Sản phẩm cho tab Gia Dụng -->
          <div class="trending-product-card large">
            <div class="badge">New</div>
            <img src="../assets/maygiat1.webp" alt="Tủ lạnh">
            <div class="product-info">
              <h3>Pay online and get deals from only 7.9 million</h3>
              <p>467㎥/h Air Purifier - Multi-Filter System</p>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/fridge.png" alt="Máy giặt">
            <div class="product-info">
              <h3>Smart Fridge. Trade-In Program discount 15%</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/maylanh.avif" alt="Máy lạnh">
            <div class="product-info">
              <h3>Air Condition just 8 millions by prepay</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/mayhutbui.avif" alt="Máy hút bụi">
            <div class="product-info">
              <h3>Vacuum cleaner on sale from 19 million</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/maygiat2.avif" alt="Máy giặt 2">
            <div class="product-info">
              <h3>Washing machine AI</h3>
              <button>Buy now</button>
            </div>
          </div>
        </div>
        
        <div v-if="activeCategory === 4" key="manhinh" class="product-grid-trending">
          <!-- Sản phẩm cho tab Màn hình-Bộ nhớ -->
          <div class="trending-product-card large">
            <div class="badge">New</div>
            <img src="../assets/voucher1.avif" alt="voucher">
            <div class="product-info">
              <h3>E-Voucher Screen 2025</h3>
              <p>Buy just 100K. Receive discount 3.5 millions when pay</p>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/Screen1.avif" alt="screen1">
            <div class="product-info">
              <h3>Odyssey 3D</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/screen2.avif" alt="screen2">
            <div class="product-info">
              <h3>Odyssey G9</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge">New</div>
            <img src="../assets/screen3.avif" alt="screen3">
            <div class="product-info">
              <h3>Odyssey OLED G8</h3>
              <button>Buy now</button>
            </div>
          </div>
          <div class="trending-product-card">
            <div class="badge sale">Sale</div>
            <img src="../assets/screen4.avif" alt="SSD">
            <div class="product-info">
              <h3>SSD 9100 PRO 1TB</h3>
              <button>Buy now</button>
            </div>
          </div>
        </div>
      </transition-group>
    </section>
    <ProductMobileHeader />
    <ProductTVLoaHeader/>
    <ProductApplicationHeader/>
  </div>
</template>

<script>
import ProductMobileHeader from './ProductMobileHeader.vue';
import ProductTVLoaHeader from './ProductTVAVHeader.vue';
import ProductApplicationHeader from './ProductApplicationHeader.vue';
import { addToCart } from '../api/api';

export default {
  name: 'SamsungHome',
  components: {
    ProductMobileHeader,
    ProductTVLoaHeader,
    ProductApplicationHeader,
  },
  data() {
    return {
      activeCategory: 0,
      categories: [
        { name: 'Discount' },
        { name: 'Phone' },
        { name: 'TV&AV' },
        { name: 'Application' },
        { name: 'Screen - Memory' }
      ],
      videoSource: '',
      isMobile: true,
      currentProductIndex: 0,
      productsToShow: 4,
      s25UltraProduct: {
        id: 1, 
      },
      // Array of all products for the carousel
      products: [
        {
          id: 1,
          title: 'Galaxy S25 Ultra',
          color: 'Color: Black, Gray, Pink',
          size: '256GB, 512GB, 1TB',
          image: require('../assets/S25.png'),
          price: '33.990.000 VND'
        },
        {
          id: 2,
          title: 'Galaxy Buds3 Pro',
          color: 'Color: Gray, White',
          size: '',
          image: require('../assets/buds3.avif'),
          price: '5.490.000 VND'
        },
        {
          id: 3,
          title: 'Galaxy S25',
          color: 'Color: Icy, Gray, Mint',
          size: '256GB, 512GB',
          image: require('../assets/galaxy-s25.avif'),
          price: '25.490.000 VND'
        },
        {
          id: 4,
          title: 'Galaxy A06',
          color: 'Color: Black, Navy, Icy',
          size: '64GB, 128GB',
          image: require('../assets/galaxy-a06.avif'),
          price: '3.289.500 VND'
        },
        {
          id: 5,
          title: 'Galaxy A16',
          color: 'Color: Gray, White, Black',
          size: '128GB, 256GB',
          image: require('../assets/galaxy-a16.avif'),
          price: '4.589.500 VND'
        },
        {
          id: 6,
          title: '70W Robot Bespoke AI',
          color: 'Color: White',
          size: '',
          image: require('../assets/robotAI.avif'),
          price: '26.999.000 VND'
        },
        {
          id: 7,
          title: 'Galaxy A56 5G',
          color: 'Color: Gray, Blue, Pink',
          size: '128GB, 256GB',
          image: require('../assets/galaxy-a56.webp'),
          price: '9.490.000 VND'
        }
      ]
    }
  },
  computed: {
    visibleProducts() {
      return this.products.slice(this.currentProductIndex, this.currentProductIndex + this.productsToShow);
    }
  },
  methods: {
    getVideoSource() {
      return window.innerWidth <= 768
        ? require('../assets/galaxy-s25-banner-mobile.webm')
        : require('../assets/galaxy-s25-banner.webm')
    },
    async handleBuyNow() {
      // Only handle for Galaxy S25 Ultra
      try {
        const user = this.$store.state.user;
        if (!user) {
          alert('Please login to add items to your cart.');
          return;
        }

        const response = await addToCart({
          product_id: this.s25UltraProduct.id,
          quantity: 1
        });

        if (response.success) {
          const cartItem = {
            id: response.cartItemId,
            product_id: this.s25UltraProduct.id,
            quantity: 1,
            name: this.s25UltraProduct.name,
            price: this.s25UltraProduct.price,
            image: this.s25UltraProduct.image,
          };
          this.$store.dispatch('addToCart', cartItem);
          alert('Galaxy S25 Ultra added to cart successfully!');
        } else {
          alert('Failed to add Galaxy S25 Ultra to cart: ' + response.message);
        }
      } catch (error) {
        console.error('Error adding Galaxy S25 Ultra to cart:', error);
        alert('An error occurred while adding Galaxy S25 Ultra to the cart.');
      }
    },
    handleLearnMore() {
      // Navigate to product details page for Galaxy S25 Ultra
      this.$router.push(`/product/${this.s25UltraProduct.id}`);
    },
    handleResize() {
      const newIsMobile = window.innerWidth <= 768
      if (newIsMobile !== this.isMobile) {
        this.isMobile = newIsMobile
        this.videoSource = this.getVideoSource()
        
        // Adjust number of products to show based on screen size
        if (this.isMobile) {
          this.productsToShow = 2;
        } else {
          this.productsToShow = 4;
        }
      }
    },
    nextProduct() {
      if (this.currentProductIndex < this.products.length - this.productsToShow) {
        this.currentProductIndex++;
        // Thêm RequestAnimationFrame để tránh hiện tượng giật
        requestAnimationFrame(() => {
          requestAnimationFrame(() => {
            // Đoạn code để thực hiện sau animation
          });
        });
      }
    },
    prevProduct() {
      if (this.currentProductIndex > 0) {
        this.currentProductIndex--;
        requestAnimationFrame(() => {
          requestAnimationFrame(() => {
            // Đoạn code để thực hiện sau animation
          });
        });
      }
}
  },
  mounted() {
    window.addEventListener('resize', this.handleResize)
    this.videoSource = this.getVideoSource() 
    this.handleResize() // Call to set initial values
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.handleResize)
  }
}
</script>

<style scoped>
.samsung-home {
  font-family: 'Samsung Sharp Sans';
}

.hero-banner {
  position: relative;
  height: 600px;
  display: flex;
  margin: 0 0;
  align-items: center;
  color: white;
  overflow: hidden; /* Để đảm bảo video không tràn ra ngoài */
}

.video-background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover; /* Giữ tỷ lệ video và cover toàn bộ container */
  z-index: -1; /* Đảm bảo video nằm dưới nội dung */
}

.banner-content {
  max-width: 600px;
  margin-top: 250px;
  margin-left: 100px;
  position: relative; /* Để nằm trên video */
  z-index: 1;
}

.banner-content h1 {
  font-size: 48px;
  margin-bottom: 20px;
}

.banner-actions {
  display: flex;
  gap: 30px;
  padding-left: 35px;
}

/* Primary Button (Learn More) */
.primary-btn {
  background-color: transparent; /* Không có màu nền */
  border: none; /* Không có viền */
  color: white; /* Chữ màu trắng */
  padding: 12px 20px;
  font-family: 'Samsung Sharp Sans';
  
  cursor: pointer;
  position: relative; /* Để định vị đường gạch chân */
  text-transform: uppercase; /* Chữ in hoa như trong hình */
}

.primary-btn::after {
  content: ''; /* Tạo đường gạch chân bằng pseudo-element */
  position: absolute;
  bottom: 8px; /* Đặt vị trí đường gạch chân */
  left: 50%; /* Bắt đầu từ giữa */
  width: 85px; /* Độ dài ban đầu của đường gạch chân */
  height: 2px; /* Độ dày của đường gạch chân */
  background-color: white; /* Màu trắng cho đường gạch chân */
  transform: translateX(-50%); /* Căn giữa đường gạch chân */
  transition: width 0.3s ease; /* Hiệu ứng mở rộng mượt mà */
}

.primary-btn:hover::after {
  width: 100%; /* Khi hover, đường gạch chân mở rộng toàn bộ chiều rộng */
}

/* Secondary Button (Shop Now) */
.secondary-btn {
  background-color: white; /* Nền trắng mặc định */
  color: black; /* Chữ đen mặc định */
  border: none; /* Không có viền mặc định */
  padding: 12px 20px;
  font-family: 'Samsung Sharp Sans';
 
  cursor: pointer;
  border-radius: 50px; /* Bo tròn như trong hình */
  text-transform: uppercase; /* Chữ in hoa như trong hình */
  transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease; /* Hiệu ứng mượt mà */
}

.secondary-btn:hover {
  background-color: black; /* Nền chuyển sang đen khi hover */
  color: white; /* Chữ chuyển sang trắng */
  border: 2px solid white; /* Thêm viền trắng khi hover */
}

/* Suggest Products Section with Carousel */
.suggest-products {
  padding: 50px;
  text-align: center;
}

.suggest-products h2 {
  font-size: 40px;
  font-weight: bold;
  margin-bottom: 30px;
}

.suggest-product-container {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  max-width: 1200px;
  margin: 0 auto;
}

.suggest-product-wrapper {
  overflow: hidden;
  width: 100%;
}

.suggest-product-grid {
  display: flex;
  gap: 30px;
  transition: transform 0.5s cubic-bezier(0.4, 0.0, 0.2, 1);
  will-change: transform;
}

.suggest-product-card {
  min-width: 200px;
  flex: 1;
  text-align: center;
  border-radius: 20px;
  background-color: #f4f4f4;
  padding: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease;
}

.suggest-product-card:hover {
  transform: translateY(-5px);
}

.suggest-product-card img {
  max-width: 100%;
  height: 200px; 
  /* fix */
  object-fit: contain;
  margin-bottom: 15px;
}

.suggest-product-card h3 {
  margin: 10px 0;
  font-weight: 500;
}

.suggest-product-card p {
  color: #666;
  margin-bottom: 15px;
  min-height: 20px;
  display: block;
}

.suggest-product-card button {
  background-color: black;
  color: white;
  width: 90%;
  border: none;
  padding: 12px 20px;
  border-radius: 50px;
  cursor: pointer;
  text-transform: uppercase;
  margin-top: 30px;
  font-family: 'Samsung Sharp Sans';
  transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
}

.suggest-product-card button:hover {
  background-color: white;
  color: black;
  border: 2px solid black;
}

.carousel-arrow {
  background: rgba(0, 0, 0, 0.5);
  color: white;
  border: none;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-size: 20px;
  z-index: 2;
  transition: background-color 0.3s;
}

.carousel-arrow:hover {
  background: rgba(0, 0, 0, 0.8);
}

.carousel-arrow:disabled {
  background: rgba(0, 0, 0, 0.2);
  cursor: not-allowed;
}

.carousel-prev {
  margin-right: 10px;
}

.carousel-next {
  margin-left: 10px;
}

/* Slide Animation */
.slide-enter-active, .slide-leave-active {
  transition: all 0.5s cubic-bezier(0.4, 0.0, 0.2, 1);
}

.slide-enter {
  transform: translateX(30px);
  opacity: 0;
}

.slide-leave-to {
  transform: translateX(-30px);
  opacity: 0;
}


/* Phần Trending Section */
.trending {
  padding: 50px 20px;
  text-align: center;
  background-color: "white";
  overflow: hidden;
}

.section-title {
  margin-bottom: 30px;
  font-size: 32px;
  font-weight: bold;
}

.category-tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 30px;
  border-bottom: 1px solid #e0e0e0;
}

.category-tab {
  padding: 15px 20px;
  margin: 0 10px;
  background: none;
  border: none;
  font-size: 16px;
  font-weight: 500;
  font-family: 'Samsung Sharp Sans';
  cursor: pointer;
  position: relative;
  transition: color 0.3s;
}

.category-tab::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  width: 0;
  height: 2px;
  background-color: #000;
  transition: width 0.3s ease;
}

.category-tab:hover::after {
  width: 100%;
}

.category-tab.active {
  color: #000;
}

.category-tab.active::after {
  width: 100%;
}

.product-container {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
}

.product-grid-trending {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-rows: auto auto;
  grid-gap: 20px;
  padding: 10px;
}

.trending-product-card {
  background-color: white;
  border-radius: 8px;
  overflow: hidden;
  position: relative;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  background-color: #f4f4f4;
  padding: 20px;
  display: flex;
  flex-direction: column;
  height: 300px;
  padding: 20px 20px 10px 20px;
}

.trending-product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.trending-product-card.large {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
  background-color: #f4f4f4;
  padding: 0;
  height: auto;
}

.trending-product-card.large img {
  height: auto; /* Chiều cao lớn hơn cho ảnh trong thẻ large */
}

.trending-product-card img {
  width: 100%;
  height: 180px; /* Slightly reduced to give more space for text */
  object-fit: contain;
  margin-bottom: 15px; /* Increased spacing between image and text */
}

.trending-product-card .product-info {
  display: flex;
  flex-direction: column;
  /* This is key - make it take all remaining space */
  flex: 1;
  /* Set minimum height to ensure there's always space */
  min-height: 100px;
  width: 100%;
  padding: 0;
  bottom: 0;
  margin: 0;
}

.product-info button {
  background-color: black;
  color: white;
  width: 50%;
  margin: 10px auto 10px;
  border: none;
  padding: 12px 20px;
  border-radius: 50px;
  cursor: pointer;
  text-transform: uppercase;
  font-family: 'Samsung Sharp Sans';
  transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
  position: relative;
  bottom: 0;
}

.product-info button:hover {
  background-color: white;
  color: black;
  border: 2px solid black;
}

.product-info h3 {
  margin-top: 10px;
  margin-bottom: 8px; /* Consistent spacing */
  font-size: 16px;
  font-weight: 500;
  width: 100%;
  height: auto; /* Change from fixed height to auto */
  max-height: 40px; /* Maximum height */
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  line-height: 1.2;
}

.trending-product-card p {
  margin: 0;
  color: #666;
  font-size: 14px;
}

.badge {
  position: absolute;
  top: 10px;
  left: 10px;
  background-color: #1d6bff;
  color: white;
  padding: 5px 10px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
  z-index: 1;
}

.badge.sale {
  background-color: #ff3333;
}

/* Fade transition for category change */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.5s ease, transform 0.5s ease;
}

.fade-enter {
  opacity: 0;
  transform: translateX(50px);
}

.fade-leave-to {
  opacity: 0;
  transform: translateX(-50px);
}

/* Responsive styles */
@media (max-width: 1024px) {
  .product-grid-trending {
    grid-template-columns: 1fr 1fr;
  }
  
  .trending-product-card.large {
    grid-column: 1 / 3;
    grid-row: auto;
  }
  
  .suggest-product-grid {
    gap: 20px;
  }
}

@media (max-width: 768px) {
  .banner-content {
    margin: 0;
    width: 100%;
    margin-top: 200px;
    padding-left: 20px;
  }
  
  .banner-actions {
    justify-content: center;
    margin-top: 200px;
  }
  
  .category-tabs {
    flex-wrap: wrap;
  }
  
  .category-tab {
    margin: 5px;
  }
  
  .suggest-product-container {
    flex-direction: column;
    /* align-content: space-between; */
  }
  
  .carousel-arrow {
    margin: 10px 0;
  }
  
  .carousel-prev {
    order: 2;
  }
  
  .carousel-next {
    order: 3;
  }
  
  .suggest-product-wrapper {
    order: 1;
    margin-bottom: 10px;
  }
}

@media (max-width: 600px) {
  .product-grid-trending {
    grid-template-columns: 1fr;
  }
  
  .trending-product-card.large {
    grid-column: 1;
  }
  
  .suggest-product-grid {
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .suggest-product-card {
    min-width: 100%;
  }
}
</style>