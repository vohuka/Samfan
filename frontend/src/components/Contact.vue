<template>
  <div class="container">
    <div class="banner-container">
      <img
        src="@/assets/pictures/Home/Contact_Us_KV_1440x640.jpg.webp"
        alt="Contact Us"
        class="banner-image"
      />
      <div class="banner-text">Samsung sẵn sàng hỗ trợ bạn!</div>
    </div> 
    <div class="main-container">
      <h1 class="page-title">Hỗ Trợ Trực Tuyến</h1>
      <div class="support-grid">
        <div class="support-card">
          <h2 class="card-title">Tư Vấn Trực Tuyến</h2>
          <p class="card-description">Miễn phí, Hoạt động 24/7</p>
          <div class="button-container">
            <button class="btn chat-button">Chat qua WhatsApp</button>
            <button class="btn chat-button">Chat qua Zalo</button>
          </div>
        </div>
        <div class="support-card">
          <h2 class="card-title">Đặt Hẹn Lịch Sửa Chữa</h2>
          <p class="card-description long-description">
            Ưu tiên phục vụ, Tiết kiệm thời gian của bạn
          </p>
          <button class="btn">Bắt đầu</button>
        </div>
        <div class="support-card">
          <h2 class="card-title">Thư điện tử</h2>
          <p class="card-description long-description">Gửi phản hồi đến Samsung Việt Nam</p>
          <button class="btn">Bắt đầu</button>
        </div>
        <div class="support-card">
          <h2 class="card-title">Ban Giám Đốc</h2>
          <p class="card-description">
            Gửi phản hồi đến Ban Giám Đốc Samsung Việt Nam
          </p>
          <button class="btn">Bắt đầu</button>
        </div>
        <div class="support-card">
          <h2 class="card-title">Cửa Hàng Trực Tuyến</h2>
          <p class="card-description">
            Tận hưởng chính sách giao hàng miễn phí và bảo hành chính hãng
          </p>
          <button class="btn">Bắt đầu</button>
        </div>
        <div class="support-card">
          <h2 class="card-title">Ngôn Ngữ Ký Hiệu</h2>
          <p class="card-description sign-language-description">
            Hỗ trợ khách hàng sử dụng Ngôn ngữ ký hiệu
          </p>
          <button class="btn">Bắt đầu</button>
        </div>
      </div>
      <div class="contact-services">
        <!-- Chăm sóc Khách Hàng -->
        <div class="service-card">
          <h2 class="card-title">Chăm sóc Khách hàng</h2>
          <p class="service-text">
            Hỗ trợ sản phẩm và dịch vụ Samsung qua
            <a href="#" class="link">Zalo Samsung Vietnam</a>.
          </p>
          <p class="service-text">
            Zalo call: 9 sáng - 6 chiều (Thứ Hai đến Thứ Bảy)
          </p>
          <p class="service-text zalo-chat">Zalo chat: hoạt động 24/7</p>
          <button class="btn service-btn">Tổng đài CSKH</button>
        </div>

        <!-- Trung Tâm Bảo Hành -->
        <div class="service-card">
          <h2 class="card-title">Trung Tâm Bảo Hành</h2>
          <p class="service-text service-center-text">
            Tìm kiếm Trung Tâm Bảo Hành gần bạn nhất
          </p>
          <button class="btn service-btn">Tìm Trung Tâm Bảo Hành</button>
        </div>

        <!-- Dành Cho Khách Hàng Doanh Nghiệp -->
        <div class="service-card">
          <h2 class="card-title">
            Dành Cho Khách Hàng Doanh Nghiệp
          </h2>
          <p class="service-text">Giờ làm việc:</p>
          <p class="service-text">9:00 - 18:00 từ Thứ 2 đến Thứ Bảy.</p>
          <p class="service-text">
            Nghỉ Chủ Nhật và các ngày lễ theo quy định của Nhà nước
          </p>

          <!-- Nút Xem thêm / Thu gọn -->
          <button class="btn toggle-btn" @click="toggleDetails">
            {{ isDetailsVisible ? "Thu gọn" : "Xem thêm" }}
          </button>

          <!-- Nội dung chi tiết sẽ hiển thị khi isDetailsVisible là true -->
          <div v-if="isDetailsVisible" class="details-container">
            <p class="service-text">1800-588-890</p>
            <p class="service-text">Nhánh 0: Hỗ trợ sản phẩm máy lạnh</p>
            <p class="service-text">Nhánh 1: Các sản phẩm khác</p>
            <p class="service-text">Nhánh 2: Hỗ trợ Đại lý</p>
          </div>
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
.banner-container {
  position: relative;
}

.banner-image {
  width: 100%;
  height: auto;
}

.banner-text {
  position: absolute;
  top: 33%;
  left: 25%;
  font-size: 3rem;
  font-weight: bold;
  color: white;
}

.main-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem 0;
}

.page-title {
  font-size: 1.875rem;
  font-weight: bold;
  text-align: center;
  margin-bottom: 2rem;
}

.support-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
  height: 100%;
  margin-bottom: 1.25rem;
}

.support-card {
  background-color: white;
  padding: 1.5rem;
  border-radius: 0.75rem;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  position: relative;
}

.card-title {
  font-size: 1.25rem;
  font-weight: 600;
}

.card-description {
  color: #6b7280;
  margin-bottom: 2.5rem;
}

.long-description {
  margin-bottom: 5rem;
}

.sign-language-description {
  margin-bottom: 4rem;
}

.button-container {
  display: flex;
  flex-direction: column;
}

.chat-button {
  width: 66.666%;
}

.contact-services {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
  padding: 1.5rem;
  min-height: 100vh;
}

.service-card {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  padding: 1.5rem;
}

.service-text {
  color: #4b5563;
  margin-bottom: 1rem;
}

.zalo-chat {
  margin-bottom: 8rem;
}

.service-center-text {
  margin-bottom: 14rem;
}

.link {
  color: #3b82f6;
}

.toggle-btn {
  margin-bottom: 1rem;
}

.details-container {
  margin-top: 1rem;
}

.service-btn {
  margin-top: 1rem;
}

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

/* Media Queries cho responsive design */
@media (min-width: 768px) {
  .support-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .contact-services {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (min-width: 1024px) {
  .support-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
</style>