// src/main.js
import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import Header from "./components/headerSam.vue";
import Footer from "./components/footerSam.vue";
import Home from "./components/Home.vue";

// Import css
import "@/assets/index.css";

const app = createApp(App);

// Register global components
app.component("samsung-header", Header);
app.component("samsung-footer", Footer);
app.component("samsung-home", Home);

app.use(router);

app.mount("#app");
