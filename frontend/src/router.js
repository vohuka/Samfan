// src/router.js
import { createRouter, createWebHistory } from 'vue-router'
import Home from './components/Home.vue'
import ProductMobile from './components/ProductMobile.vue'
import ProductTVAV from './components/ProductTVAV.vue'
import ProductApplication from './components/ProductApplication.vue'

// Giả sử bạn có các component này 
// (nếu chưa có, hãy tạo chúng)
const About = () => import('./components/About.vue')
const Product = () => import('./components/Product.vue')
const Contact = () => import('./components/Contact.vue')

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
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router