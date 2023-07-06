import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

export default ({ Vue, options, router, siteData }) => {
  // Make BootstrapVue available throughout your project
  Vue.use(BootstrapVue);
  // Optionally install the BootstrapVue icon components plugin
  Vue.use(IconsPlugin);
}