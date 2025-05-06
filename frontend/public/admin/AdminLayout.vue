<template>
  <div class="admin-page">
    <iframe src="/src/admin/index.html" style="width:100%; height:100vh; border:none;"></iframe>
  </div>
</template>

<script>
export default {
  name: 'AdminLayout'
}
</script>

<style>
.admin-page {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  z-index: 9999;
  background: white;
}
</style>