<template>
  <div id="js-new-form">
    <form class='form' action='/books' method='post'>
      <input type='hidden' name='authenticity_token' v-bind:value='token()'>
      <div class="mb-3">
        <label class='form-label'>Title</label>
        <input type='text' name='book[title]' class='form-control'>
      </div>
      <div class="mb-3">
        <label class='form-label'>Memo</label>
        <textarea class='form-control' name='book[memo]' rows='3'></textarea>
      </div>
      <div class="mb-3">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name='book[paper]'>
          <label class="form-check-label">Paper</label>
        </div>
      </div>
      <div class="mb-3">
        <button type='submit' class='btn btn-primary'>create</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },
  methods: {
    token() {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
  }
}
</script>
