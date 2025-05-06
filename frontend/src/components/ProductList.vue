<template>
  <div class="product-list">
    <div class="product-list-header">
      <h2 class="product-list-title">Product</h2>
      <select v-model="sortOption" @change="sortProducts" class="sort-dropdown">
        <option value="default">Sort by:</option>
        <option value="price-asc">Price: Low to High</option>
        <option value="price-desc">Price: High to Low</option>
        <option value="rating-desc">Best ratting</option>
      </select>
    </div>
    <div class="product-grid">
      <ProductCard v-for="product in sortedProducts" :key="product.id" :product="product" />
    </div>
  </div>
</template>

<script>
import ProductCard from './ProductCard.vue';

export default {
  components: { ProductCard },
  props: {
    products: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      sortOption: 'default',
      sortedProducts: [...this.products],
    };
  },
  watch: {
    products(newProducts) {
      this.sortedProducts = [...newProducts];
      this.sortProducts();
    },
  },
  methods: {
    sortProducts() {
      let sorted = [...this.products];
      if (this.sortOption === 'price-asc') {
        sorted.sort((a, b) => a.price - b.price);
      } else if (this.sortOption === 'price-desc') {
        sorted.sort((a, b) => b.price - a.price);
      } else if (this.sortOption === 'rating-desc') {
        sorted.sort((a, b) => b.rating - a.rating);
      }
      this.sortedProducts = sorted;
    },
  },
};
</script>

<style scoped>
.product-list {
  width: 75%;
  padding: 16px;
  font-family: 'Samsung Sharp Sans';
}
.product-list-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}
.product-list-title {
  font-size: 20px;
  font-weight: bold;
}
.sort-dropdown {
  padding: 8px;
  border: 1px solid #e0e0e0;
  border-radius: 4px;
  font-size: 14px;
  font-family: 'Samsung Sharp Sans';
}
.product-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
}
</style>