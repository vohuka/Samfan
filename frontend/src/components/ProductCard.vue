<template>
  <div class="product-card">
    <img :src="`/images/${product.image}`" :alt="product.name" class="product-image" />
    <h3 class="product-name">{{ product.name }}</h3>
    <div class="product-rating">
      <span class="star">★</span>
      <span>{{ product.rating }}</span>
    </div>
    <p class="product-price">{{ formatPrice(product.price) }} VND</p>
    <div class="product-variants">
      <p class="product-detail">
        <span class="variant-label">Color:</span>
        <span class="variant-value">{{ product.color }}</span>
      </p>
      <p class="product-detail">
        <span class="variant-label">Memory:</span>
        <span class="variant-value">{{ product.memory }}</span>
      </p>
      <p class="product-detail">
        <span class="variant-label">RAM:</span>
        <span class="variant-value">{{ product.ram }}</span>
      </p>
    </div>
    <div class="button-group">
      <button class="buy-button">Buy now</button>
      <router-link :to="'/product/' + product.id" class="learn-more" custom v-slot="{ navigate }">
        <button class="learn-more" @click="navigate" role="link">Learn More</button>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
  methods: {
    formatPrice(price) {
      return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
  },
};
</script>

<style scoped>
.product-card {
  font-family: 'Samsung Sharp Sans';
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.2s;
}
.product-card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.product-image {
  width: 100%;
  height: 192px;
  object-fit: contain;
  margin-bottom: 16px;
}
.product-name {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 8px;
  text-align: left;
}
.product-rating {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
  text-align: left;
}
.star {
  color: #f4c430;
  margin-right: 4px;
}
.product-price {
  font-size: 20px;
  font-weight: bold;
  color: #d32f2f;
  margin-bottom: 8px;
  text-align: left;
}
.product-variants {
  margin-bottom: 16px;
}
.product-detail {
  font-size: 14px;
  color: #555;
  margin-bottom: 8px;
  display: flex;
  align-items: center;
  gap: 8px;
  text-align: left;
}
.variant-label {
  font-weight: 500;
}
.variant-value {
  padding: 4px 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background: #f9f9f9;
  font-size: 14px;
}
.button-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
  width: 100%;
  align-items: center;
}
.buy-button {
  background-color: black;
  color: white;
  width: 90%;
  border: 2px solid black;
  padding: 12px 20px;
  border-radius: 50px;
  cursor: pointer;
  text-transform: uppercase;
  font-family: 'Samsung Sharp Sans';
  transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
}
.buy-button:hover {
  background-color: white;
  color: black;
}
.learn-more {
  background-color: white;
  text-decoration: none;
  text-align: center;
  color: black;
  width: 90%;
  border: none;
  padding: 12px 20px;
  border-radius: 50px;
  cursor: pointer;
  text-transform: uppercase;
  font-family: 'Samsung Sharp Sans';
  transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
  border: 2px solid black;
  display: inline-block;
}
.learn-more:hover {
  background-color: black;
  color: white;
}
</style>