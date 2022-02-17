<template>
  <div id="js-edit-form">
    <form class='form' v-bind:action="`/books/${this.bookId}`" method='post' name='put'>
      <input type='hidden' name='_method' value='put'>
      <input type='hidden' name='authenticity_token' v-bind:value='token()'>
      <div class="mb-3">
        <label class='form-label'>Title</label>
        <input type='text' name='book[title]' v-bind:value='book.title' class='form-control'>
      </div>
      <div class="mb-3">
        <label class='form-label'>Memo</label>
        <textarea class='form-control' name='book[memo]' v-bind:value='book.memo' rows='3'></textarea>
      </div>
      <div class="mb-3">
        <div class="form-check">
          <input name='book[paper]' type='hidden' value='0'>
          <input class='form-check-input' type='checkbox' name='book[paper]' value='1' v-bind:checked='book.paper'>
          <label class='form-check-label'>Paper</label>
        </div>
      </div>
      <div class="mb-3">
        <button type='submit' class='btn btn-primary'>update</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  props: {
    bookId: { type: String, required: true }
  },
  data () {
    return {
      book: [],
    }
  },
  mounted() {
    this.getBook()
  },
  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    getBook() {
      fetch(`/api/books/${this.bookId}`, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token()
        },
        credentials: 'same-origin',
        redirect: 'manual'
      })
        .then((response) => response.json())
        .then((json) => {
          this.book = json
        })
        .catch((error) => {
          console.warn('Failed to parsing', error)
        })
    },
  }
}
</script>
