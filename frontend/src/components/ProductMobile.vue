<template>
  <ProductMobileHeader />
  <div class="product-container">
    <ProductFilterPanel @update:filters="applyFilters" />
    <ProductList :products="filteredProducts" />
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
  },
  mounted() {
    this.fetchProducts();
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
    },
  },
};
</script>

<style scoped>
.product-container {
  display: flex;
  width: 100%;
}

@media (max-width: 768px) {
  .product-container {
    flex-direction: column;
  }
  .filter-panel {
    width: 100%;
    border-right: none;
    border-bottom: 1px solid #e0e0e0;
  }
  .product-list {
    width: 100%;
  }
  .product-grid {
    grid-template-columns: 1fr;
  }
}
</style>