<template>
  <div class="relative">
    <img
      src="@/assets/pictures/Home/Contact_Us_KV_1440x640.jpg.webp"
      alt="Contact Us"
      class="w-full h-auto"
    />
    <div  class="text-white absolute top-1/3 left-1/4 text-5xl font-bold">Samsung sẵn sàng hỗ trợ bạn!</div>
  </div> 
  <div class="container mx-auto py-8">
    <h1 class="text-3xl font-bold text-center mb-8">Hỗ Trợ Trực Tuyến</h1>
    <div
      class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 h-full mb-5"
    >
      <div class="bg-white p-6 rounded-xl shadow-lg relative">
        <h2 class="text-xl font-semibold">Tư Vấn Trực Tuyến</h2>
        <p class="text-gray-500 mb-10">Miễn phí, Hoạt động 24/7</p>
        <div class="flex flex-col">
          <button class="btn w-2/3">Chat qua WhatsApp</button>
          <button class="btn w-2/3">Chat qua Zalo</button>
        </div>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg relative">
        <h2 class="text-xl font-semibold">Đặt Hẹn Lịch Sửa Chữa</h2>
        <p class="text-gray-500 mb-20">
          Ưu tiên phục vụ, Tiết kiệm thời gian của bạn
        </p>
        <button class="btn">Bắt đầu</button>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg relative">
        <h2 class="text-xl font-semibold">Thư điện tử</h2>
        <p class="text-gray-500 mb-20">Gửi phản hồi đến Samsung Việt Nam</p>
        <button class="btn">Bắt đầu</button>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg relative">
        <h2 class="text-xl font-semibold">Ban Giám Đốc</h2>
        <p class="text-gray-500 mb-10">
          Gửi phản hồi đến Ban Giám Đốc Samsung Việt Nam
        </p>
        <button class="btn">Bắt đầu</button>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg relative">
        <h2 class="text-xl font-semibold">Cửa Hàng Trực Tuyến</h2>
        <p class="text-gray-500 mb-10">
          Tận hưởng chính sách giao hàng miễn phí và bảo hành chính hãng
        </p>
        <button class="btn">Bắt đầu</button>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-lg relative">
        <h2 class="text-xl font-semibold">Ngôn Ngữ Ký Hiệu</h2>
        <p class="text-gray-500 mb-16">
          Hỗ trợ khách hàng sử dụng Ngôn ngữ ký hiệu
        </p>
        <button class="btn">Bắt đầu</button>
      </div>
    </div>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 p-6 min-h-screen">
      <!-- Chăm sóc Khách Hàng -->
      <div class="bg-white rounded-lg shadow-lg p-6">
        <h2 class="text-xl font-semibold mb-4">Chăm sóc Khách hàng</h2>
        <p class="text-gray-600 mb-4">
          Hỗ trợ sản phẩm và dịch vụ Samsung qua
          <a href="#" class="text-blue-500">Zalo Samsung Vietnam</a>.
        </p>
        <p class="text-gray-600 mb-4">
          Zalo call: 9 sáng - 6 chiều (Thứ Hai đến Thứ Bảy)
        </p>
        <p class="text-gray-600 mb-32">Zalo chat: hoạt động 24/7</p>
        <button class="btn mt-4">Tổng đài CSKH</button>
      </div>

      <!-- Trung Tâm Bảo Hành -->
      <div class="bg-white rounded-lg shadow-lg p-6">
        <h2 class="text-xl font-semibold mb-4">Trung Tâm Bảo Hành</h2>
        <p class="text-gray-600 mb-56">
          Tìm kiếm Trung Tâm Bảo Hành gần bạn nhất
        </p>
        <button class="btn mt-4">Tìm Trung Tâm Bảo Hành</button>
      </div>

      <!-- Dành Cho Khách Hàng Doanh Nghiệp -->
      <div class="bg-white rounded-lg shadow-lg p-6">
        <h2 class="text-xl font-semibold mb-4">
          Dành Cho Khách Hàng Doanh Nghiệp
        </h2>
        <p class="text-gray-600 mb-4">Giờ làm việc:</p>
        <p class="text-gray-600 mb-4">9:00 - 18:00 từ Thứ 2 đến Thứ Bảy.</p>
        <p class="text-gray-600 mb-4">
          Nghỉ Chủ Nhật và các ngày lễ theo quy định của Nhà nước
        </p>

        <!-- Nút Xem thêm / Thu gọn -->
        <button class="btn mb-4" @click="toggleDetails">
          {{ isDetailsVisible ? "Thu gọn" : "Xem thêm" }}
        </button>

        <!-- Nội dung chi tiết sẽ hiển thị khi isDetailsVisible là true -->
        <div v-if="isDetailsVisible">
          <p class="text-gray-600">1800-588-890</p>
          <p class="text-gray-600">Nhánh 0: Hỗ trợ sản phẩm máy lạnh</p>
          <p class="text-gray-600">Nhánh 1: Các sản phẩm khác</p>
          <p class="text-gray-600">Nhánh 2: Hỗ trợ Đại lý</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ContactPage",
  data() {
    return {
      isDetailsVisible: false,
    };
  },
  methods: {
    toggleDetails() {
      this.isDetailsVisible = !this.isDetailsVisible; // Đảo ngược trạng thái hiển thị
    },
  },
};
</script>

<style scoped>
/* CSS cho trang Contact */
.btn {
  background-color: #000;
  color: white;
  padding: 10px 20px;
  border-radius: 20px;
  text-align: center;
  cursor: pointer;
}

.btn:hover {
  background-color: #333;
}
</style>
