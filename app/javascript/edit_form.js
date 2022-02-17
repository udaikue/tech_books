import Vue from 'vue'
import EditForm from './edit-form.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-edit-form'
  const book = document.querySelector(selector)
  if (book) {
    const bookId = book.getAttribute('data-book-id')
    new Vue({
      render: h => h(EditForm, { props: { bookId } })
    }).$mount(selector)
  }
})
