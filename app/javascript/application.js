import { createApp } from 'vue';
import InlineSvg from 'vue-inline-svg';
import Notifications from '@kyvg/vue3-notification';
import TheHeader from './components/the-header.vue';
import BaseNotifications from './components/base-notifications.vue';
import BaseInput from './components/base-input.vue';
import BaseButton from './components/base-button.vue';
import BaseCheckbox from './components/base-checkbox.vue';
import UserSession from './components/user-session.vue';
import ItemList from './components/item-list.vue';
import PurchaseList from './components/purchase-list.vue';
import ItemView from './components/item-view.vue';
import './css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: {
      TheHeader,
      UserSession,
      ItemList,
      PurchaseList,
      BaseNotifications,
      ItemView,
      InlineSvg,
    },
  });
  app.component('BaseInput', BaseInput);
  app.component('BaseButton', BaseButton);
  app.component('BaseCheckbox', BaseCheckbox);
  app.component('InlineSvg', InlineSvg);
  app.use(Notifications);
  app.mount('#vue-app');

  return app;
});
