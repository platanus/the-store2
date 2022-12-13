import { createApp } from 'vue';
import App from './components/app.vue';
import TheHeader from './components/the-header.vue';
import './css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: {
      App,
      TheHeader,
    },
  });
  app.mount('#vue-app');

  return app;
});
