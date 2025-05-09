
import { createApp } from 'vue'
import App from './App.vue'
import router from './router' 
import store from './store';
import Header from './components/headerSam.vue'
import Footer from './components/footerSam.vue'
import Home from './components/Home.vue'


import './assets/index.css'

const app = createApp(App)


app.component('samsung-header', Header)
app.component('samsung-footer', Footer)
app.component('samsung-home', Home)

app.use(router) 
app.use(store)

app.mount('#app')