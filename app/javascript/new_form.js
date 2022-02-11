import Vue from 'vue'
import NewForm from './new-form.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-new-form'
  if (document.querySelector(selector)) {
    new Vue(NewForm).$mount(selector)
  }
})
