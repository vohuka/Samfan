<template>
  <div class="TV-header" :class="{ 'dark-text': currentProductIndex >= 3 && currentProductIndex <= 4 }" :style="{ backgroundImage: `url(${currentProduct.backgroundImage})` }">
    <div class="title" @click="goToProductTVAV" :class="{ 'dark-text': currentProductIndex >= 3 && currentProductIndex <= 4 }" >TV & SPEAKER </div>
    <div class="navigation-links">
      <div class="nav-container">
        <a 
          v-for="(product, index) in products" 
          :key="index" 
          href="#" 
          class="nav-link" 
          :class="{ 
            active: currentProductIndex === index, 
            'dark-text': currentProductIndex >= 3 && currentProductIndex <= 4
          }"
          @click.prevent="changeProduct(index)"
        >
          {{ product.name }}
        </a>
      </div>
    </div>
    
    <div class="product-info">       
      <h1 class="product-title">{{ currentProduct.title }}</h1>
      <p class="product-promo">{{ currentProduct.promo }}</p>
      
      <div class="action-buttons">
        <button class="btn" :class="currentProductIndex >= 3 && currentProductIndex <= 4 ? 'btn-outline-dark' : 'btn-outline'">Learn more</button>
        <button class="btn" :class="currentProductIndex >= 3 && currentProductIndex <= 4 ? 'btn-filled-dark' : 'btn-filled'">Buy now</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SamsungProductHeader',
  data() {
    return {
      currentProductIndex: 0,
      products: [
        {
          name: 'Neo QLED 8K',
          title: 'Neo QLED 8K',
          promo: 'Surpassing 8K, surpassing multitasking',
          backgroundImage: require('@/assets/TV-header.avif')
        },
        {
          name: 'Neo QLED 4K',
          title: 'Neo QLED 4K',
          promo: 'Beyond masterpiece',
          backgroundImage: require('@/assets/TV-header-2.avif')
        },
        {
          name: 'OLED',
          title: 'OLED',
          promo: 'OLED surpasses world\'s number 1 tv standard',
          backgroundImage: require('@/assets/TV-header-3.avif')
        },
        {
          name: 'The Frame',
          title: 'The Frame',
          promo: 'Turn on as OLED TV, turn off as Art masterpiece',
          backgroundImage: require('@/assets/TV-header-4.avif')
        },
        {
          name: 'Music Frame Speaker',
          title: 'Music Frame Speaker',
          promo: 'Speakers in harmony, sublimating emotions',
          backgroundImage: require('@/assets/TV-header-5.avif')
        }
      ]
    };
  },
  computed: {
    currentProduct() {
      return this.products[this.currentProductIndex];
    }
  },
  methods: {
    changeProduct(index) {
      this.currentProductIndex = index;
      
      // Thêm class để tạo hiệu ứng transition
      const productInfo = document.querySelector('.product-info');
      productInfo.classList.add('fade-out');
      
      // Sau khi fade out, cập nhật nội dung và fade in
      setTimeout(() => {
        productInfo.classList.remove('fade-out');
        productInfo.classList.add('fade-in');
        
        // Xóa class fade-in sau khi animation hoàn thành
        setTimeout(() => {
          productInfo.classList.remove('fade-in');
        }, 500);
      }, 300);
    },
    goToProductTVAV() {
      this.$router.push({ name: 'ProductTVAV' });
    },
  }
}
</script>

<style>
:root {
  --base-font-size: 16px;
}

.TV-header {
  font-family: 'Samsung Sharp Sans';
  background-image: url('@/assets/TV-header.avif');
  width: 100%;
  color: white;
  padding: 2rem 1rem;
  box-sizing: border-box;
  background-size: cover;
  background-position: center;
  height: 810px;
  position: relative;
  transition: background-image 0.5s ease;
}

.TV-header.dark-text {
  color: black;
}

.title {
    font-size: 35px;
    justify-content: center;
    text-align: center;
    font-weight: 700;
    cursor: pointer;
}

.title:hover {
  opacity: 1;
  color: #cccccc;
}

.title.dark-text:hover {
  color: #4b4b4b;
}

.navigation-links {
  text-align: center;
  margin-bottom: 2rem;
}

.nav-container {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  gap: 2rem;
  /* font-size: 1rem; */
  flex-wrap: wrap;
}

.nav-link {
  white-space: nowrap;
  opacity: 0.8;
  transition: all 0.2s ease;
  padding-bottom: 0.25rem;
  color: white;
  text-decoration: none;
  font-weight: 500;
}

.nav-link.active {
  opacity: 1;
  border-bottom: 2px solid white;
}

.nav-link.dark-text {
  color: black;
}

.nav-link.dark-text.active {
  border-bottom: 2px solid black;
}

.nav-link:hover {
  opacity: 1;
  color: #cccccc;
}

.nav-link.dark-text:hover {
  color: #333333;
}

.product-info {
  text-align: center;
  position: absolute;
  bottom: 2rem;
  left: 0;
  right: 0;
  width: 100%;
  transition: all 0.3s ease;
}


.fade-out {
  opacity: 0;
}

.fade-in {
  opacity: 1;
}

.product-title {
  font-size: 2.25rem;
  font-weight: bold;
  margin-bottom: 1rem;
}

.product-promo {
  font-size: 0.875rem;
  margin-bottom: 1.5rem;
}

.action-buttons {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.btn {
  border-radius: 9999px;
  padding: 0.5rem 1.5rem;
  font-size: 0.875rem;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn:hover {
  transform: translateY(-2px);
}


.btn-outline {
  border: 1px solid white;
  background-color: transparent;
  color: white;
}

.btn-outline:hover {
  background-color: rgba(255, 255, 255, 0.1);
}


.btn-outline-dark {
  border: 1px solid black;
  background-color: transparent;
  color: black;
}

.btn-outline-dark:hover {
  background-color: rgba(0, 0, 0, 0.1);
}


.btn-filled {
  background-color: white;
  color: black;
  border: none;
}

.btn-filled:hover {
  background-color: #f0f0f0;
}


.btn-filled-dark {
  background-color: black;
  color: white;
  border: none;
}

.btn-filled-dark:hover {
  background-color: #333333;
}


@media screen and (max-width: 1200px) {
  .TV-header {
    font-size: calc(0.85 * var(--base-font-size));
    width: 100%;
  }
  
  .product-title {
    font-size: 2rem;
  }
  
  .btn {
    padding: 0.45rem 1.35rem;
  }
}

@media screen and (max-width: 900px) {
  .TV-header {
    font-size: calc(0.75 * var(--base-font-size));
    padding: 1.5rem 0.75rem;
    width: 100%;
  }
  
  .product-title {
    font-size: 1.8rem;
  }
  
  .navigation-links {
    margin-bottom: 1.5rem;
  }
  
  .btn {
    padding: 0.4rem 1.2rem;
    font-size: 0.8rem;
  }
  
  .product-info {
    bottom: 1.5rem;
  }
}

@media screen and (max-width: 600px) {
  .TV-header {
    font-size: calc(0.65 * var(--base-font-size));
    padding: 1rem 0.5rem;
    width: 100%;
  }
  
  .product-title {
    font-size: 1.5rem;
    margin-bottom: 0.75rem;
  }
  
  .navigation-links {
    margin-bottom: 1rem;
  }
  
  .nav-container {
    gap: 0.5rem;
    font-size: 0.75rem;
  }
  
  .product-promo {
    font-size: 0.75rem;
    margin-bottom: 1rem;
  }
  
  .action-buttons {
    gap: 0.75rem;
  }
  
  .btn {
    padding: 0.35rem 1rem;
    font-size: 0.7rem;
  }
  
  .product-info {
    bottom: 1rem;
  }
}

@media screen and (max-width: 400px) {
  .TV-header {
    height: 400px; 
    padding: 0.75rem 0.25rem;
  }
  
  .product-title {
    font-size: 1.25rem;
  }
  
  .title {
    font-size: 28px;
  }
  
  .nav-container {
    font-size: 0.6rem;
  }
}

</style>