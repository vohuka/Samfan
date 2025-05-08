import { createStore } from 'vuex';

const store = createStore({
  state() {
    return {
      cartItems: [],
      user: null,
    };
  },
  mutations: {
    setCartItems(state, items) {
      state.cartItems = items;
    },
    addToCart(state, item) {
      const existingItem = state.cartItems.find(i => i.variant_id === item.variant_id);
      if (existingItem) {
        existingItem.quantity += item.quantity;
      } else {
        state.cartItems.push({ ...item, quantity: item.quantity });
      }
    },
    increaseQuantity(state, itemId) {
      const item = state.cartItems.find(i => i.id === itemId);
      if (item) item.quantity++;
    },
    decreaseQuantity(state, itemId) {
      const item = state.cartItems.find(i => i.id === itemId);
      if (item && item.quantity > 1) item.quantity--;
      else if (item) state.cartItems = state.cartItems.filter(i => i.id !== itemId);
    },
    removeFromCart(state, itemId) {
      state.cartItems = state.cartItems.filter(i => i.id !== itemId);
    },
    setUser(state, user) {
      state.user = user;
    },
  },
  actions: {
    setCartItems({ commit }, items) {
      commit('setCartItems', items);
    },
    addToCart({ commit }, item) {
      commit('addToCart', item);
    },
    increaseQuantity({ commit }, itemId) {
      commit('increaseQuantity', itemId);
    },
    decreaseQuantity({ commit }, itemId) {
      commit('decreaseQuantity', itemId);
    },
    removeFromCart({ commit }, itemId) {
      commit('removeFromCart', itemId);
    },
    setUser({ commit }, user) {
      commit('setUser', user);
    },
  },
  getters: {
    cartItems: state => state.cartItems,
    user: state => state.user,
  },
});

export default store;