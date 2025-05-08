// src/router.js
import { createRouter, createWebHistory } from 'vue-router'
import Home from './components/Home.vue'
import ProductMobile from './components/ProductMobile.vue'
import ProductTVAV from './components/ProductTVAV.vue'
import ProductApplication from './components/ProductApplication.vue'
import ProductDetail from './components/ProductDetail.vue' // Thêm import cho ProductDetail
import CartPage from './components/CartPage.vue' 

// Giả sử bạn có các component này 
// (nếu chưa có, hãy tạo chúng)
const About = () => import('./components/About.vue')
const Product = () => import('./components/Product.vue')
const Contact = () => import('./components/Contact.vue')
const FAQ = () => import('./components/FAQ.vue')
const BusinessAreas = () => import('./components/BusinessAreas.vue')

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: About
  },
  {
    path: '/product',
    name: 'Product',
    component: Product
  },
  {
    path: '/contact',
    name: 'Contact',
    component: Contact
  },
  {
    path: '/faq',
    name: 'FAQ',
    component: FAQ
  },
  {
    path: '/mobile',
    name: 'ProductMobile',
    component: ProductMobile
  },
  {
    path: '/tvav',
    name: 'ProductTVAV',
    component: ProductTVAV
  },
  {
    path: '/application',
    name: 'ProductApplication',
    component: ProductApplication
  },
  {
    path: '/product/:id', // Thêm route mới cho trang chi tiết sản phẩm
    name: 'ProductDetail',
    component: ProductDetail
  },
  {
    path: '/business-areas',
    name: 'BusinessAreas',
    component: BusinessAreas
  },
  { 
    path: '/cart', 
    name: 'Cart', 
    component: CartPage
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router