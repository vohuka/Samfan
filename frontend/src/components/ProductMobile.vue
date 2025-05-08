<template>
  <ProductMobileHeader />
  <div class="product-container">
    <ProductFilterPanel @update:filters="applyFilters" class="filter-panel" />
    <ProductList :products="filteredProducts" class="product-list" />
  </div>
</template>

<script>
import ProductMobileHeader from './ProductMobileHeader.vue';
import ProductFilterPanel from './ProductFilterPanel.vue';
import ProductList from './ProductList.vue';
import { fetchProducts } from '../api/api'; // Import the API function

export default {
  name: 'ProductMobile',
  components: { ProductMobileHeader, ProductFilterPanel, ProductList },
  data() {
    return {
      products: [],
      filters: {
        name: [],
        price: [],
        storage: [],
        ram: [],
      },
      isMobileFilterOpen: false,
      screenWidth: window.innerWidth
    };
  },
  computed: {
    filteredProducts() {
      let filtered = [...this.products];

      // Lọc theo Name
      if (this.filters.name.length > 0) {
        filtered = filtered.filter(product =>
          this.filters.name.some(name => product.name.startsWith(name))
        );
      }

      // Lọc theo Price
      if (this.filters.price.length > 0) {
        filtered = filtered.filter(product =>
          this.filters.price.some(range =>
            product.price >= range.min && product.price < range.max
          )
        );
      }

      // Lọc theo Storage
      if (this.filters.storage.length > 0) {
        filtered = filtered.filter(product =>
          this.filters.storage.includes(product.memory)
        );
      }

      // Lọc theo RAM
      if (this.filters.ram.length > 0) {
        filtered = filtered.filter(product =>
          this.filters.ram.includes(product.ram)
        );
      }

      return filtered;
    },
    isMobile() {
      return this.screenWidth <= 768;
    },
    isTablet() {
      return this.screenWidth > 768 && this.screenWidth <= 992;
    }
  },
  watch: {
    // Watch for screen size changes to update layout
    screenWidth(newWidth) {
      if (newWidth > 768 && this.isMobileFilterOpen) {
        this.isMobileFilterOpen = false;
      }
    }
  },
  mounted() {
    this.fetchProducts();
    // Add event listener for screen resize
    window.addEventListener('resize', this.handleResize);
  },
  beforeUnmount() {
    // Remove event listener when component is destroyed
    window.removeEventListener('resize', this.handleResize);
  },
  methods: {
    async fetchProducts() {
      try {
        this.products = await fetchProducts();
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    },
    applyFilters(filters) {
      this.filters = filters;
      if (this.isMobile) {
        this.isMobileFilterOpen = false;
      }
    },
    handleResize() {
      this.screenWidth = window.innerWidth;
    },
    toggleMobileFilter() {
      this.isMobileFilterOpen = !this.isMobileFilterOpen;
    }
  },
};
</script>

<style scoped>
.product-container {
  display: flex;
  width: 100%;
  position: relative;
}

.filter-panel {
  width: 25%;
  border-right: 1px solid #e0e0e0;
  padding-right: 15px;
}

.product-list {
  width: 75%;
  padding-left: 15px;
}

/* Tablet Styles */
@media screen and (max-width: 992px) {
  .filter-panel {
    width: 30%;
  }
  
  .product-list {
    width: 70%;
  }
}

/* Mobile Styles */
@media screen and (max-width: 768px) {
  .product-container {
    flex-direction: column;
  }
  
  .filter-panel {
    width: 100%;
    border-right: none;
    border-bottom: 1px solid #e0e0e0;
    padding-right: 0;
    padding-bottom: 15px;
    margin-bottom: 15px;
    transition: all 0.3s ease;
  }
  
  .product-list {
    width: 100%;
    padding-left: 0;
  }
}

/* Extra small devices */
@media screen and (max-width: 576px) {
  .product-container {
    padding: 0 10px;
  }
  
  .filter-panel {
    padding-bottom: 10px;
    margin-bottom: 10px;
  }
}
</style>