<template>
  <div class="product-container">
    <div class="hero-section">
      <!-- Background Image -->
      <div class="hero-image-container">
        <img
          src="@/assets/pictures/Home/03_Product_00_PC.jpg"
          alt="Business Image"
          class="hero-image"
        />
        <!-- Overlay Text -->
        <div class="hero-text">
          <h1 class="hero-title">
            Màn Hình Chuyên Dụng Cho Doanh Nghiệp
          </h1>
          <p class="hero-subtitle">
            Nâng tầm doanh nghiệp với công nghệ hiển thị hàng đầu
          </p>
        </div>
        <!-- Next and Previous Buttons -->
      </div>
    </div>

    <!-- Call to Action Button -->

    <div class="industry-section">
      <div class="section-title">Tailored for your industry</div>
      <div class="industry-grid">
        <div class="industry-item col-start-1">
          <font-awesome-icon :icon="['fas', 'school']" class="industry-icon" />
          <div class="industry-name">
            Giáo dục
          </div>
        </div>
        <div class="industry-item">
          <font-awesome-icon :icon="['fas', 'store']" class="industry-icon" />
          <div class="industry-name">
            Bán lẻ
          </div>
        </div>
        <div class="industry-item">
          <font-awesome-icon :icon="['fas', 'chart-simple']" class="industry-icon" />
          <div class="industry-name">
            Tài chính
          </div>
        </div>
        <div class="industry-item">
          <font-awesome-icon :icon="['fas', 'landmark']" class="industry-icon" />
          <div class="industry-name">
            Chính phủ
          </div>
        </div>
        <div class="industry-item">
          <font-awesome-icon :icon="['fas', 'building']" class="industry-icon" />
          <div class="industry-name">
            Doanh nghiệp
          </div>
        </div>
      </div>
    </div>

    <div class="tab-section">
      <div class="section-title">Di động</div>
      <div class="tab-navigation">
        <div
          class="tab-item"
          :class="[
            selected === 'feature' ? 'active' : '',
            selected !== 'feature' && hovered === 'feature' ? 'hovered' : '',
          ]"
          @click="selected = 'feature'"
          @mouseenter="hovered = 'feature'"
          @mouseleave="hovered = null"
        >
          Tính năng
        </div>
        <div
          class="tab-item"
          :class="[
            selected === 'product' ? 'active' : '',
            selected !== 'product' && hovered === 'product' ? 'hovered' : '',
          ]"
          @click="selected = 'product'"
          @mouseenter="hovered = 'product'"
          @mouseleave="hovered = null"
        >
          Sản phẩm
        </div>
      </div>
    </div>

    <div class="content-section">
      <transition :name="transitionName" mode="in-out">
        <div
          v-show="selected === 'feature'"
          class="feature-grid"
          key="feature"
        >
          <!-- Cột 1 -->
          <div class="feature-col-main">
            <img
              src="@/assets/pictures/Home/684x684_PC.webp"
              alt="Ưu đãi"
              class="feature-image"
            />
            <div class="feature-text">
              <div class="feature-title">
                Ưu Đãi độc quyền cho doanh nghiệp
              </div>
              <div class="feature-subtitle">
                Đăng kí nhận ngay ưu đãi độc quyền
              </div>
            </div>
          </div>

          <!-- Cột 2 -->
          <div class="feature-col">
            <div class="feature-item">
              <img
                src="@/assets/pictures/Home/2D_UK_pc.avif"
                alt="Lựa chọn tốt nhất"
                class="feature-image"
              />
              <div class="feature-text">
                <div class="feature-item-title">
                  Samsung - Lựa chọn di động tốt nhất
                </div>
                <div class="feature-item-subtitle">
                  Thiết kế để đồng hành cùng doanh nghiệp
                </div>
              </div>
            </div>

            <div class="feature-item feature-light">
              <img
                src="@/assets/pictures/Home/HOME_Galaxy_S25_Ultra_KV_Merchandising_160x160.webp"
                alt="Galaxy S25 Ultra"
                class="feature-item-image"
              />
              <div class="feature-badge">
                Galaxy S25 Ultra
              </div>
            </div>
          </div>

          <!-- Cột 3 -->
          <div class="feature-col">
            <div class="feature-item">
              <img
                src="@/assets/pictures/Home/Knox-Suite_pc.avif"
                alt="Samsung Knox"
                class="feature-image"
              />
              <div class="feature-text">
                <div class="feature-item-title">
                  Samsung Knox
                </div>
                <div class="feature-item-subtitle">
                  Giải pháp di động dành cho doang nghiệp
                </div>
              </div>
            </div>

            <div class="feature-item">
              <img
                src="@/assets/pictures/Home/pc.jpeg"
                alt="Samsung SMB"
                class="feature-image"
              />
              <div class="feature-text">
                <div class="feature-item-title">
                  Samsung SMB
                </div>
                <div class="feature-item-subtitle">
                  Giải pháp dành cho doanh nghiệp vừa và nhỏ
                </div>
              </div>
            </div>
          </div>
        </div>
      </transition>

      <!-- Product Section -->
      <transition name="transitionName" mode="in-out">
        <div v-show="selected === 'product'" key="product" class="product-grid">
          <div class="product-row">
            <!-- Enterprise Edition -->
            <div class="product-card">
              <img
                src="@/assets/pictures/Home/IM_Home_Showcase_Card_02_Products_1_Enterprise_Edition_PC_376X376.avif"
                alt="Enterprise Edition"
                class="product-image"
              />
              <h2 class="product-title">Enterprise Edition</h2>
              <p class="product-description">
                Tất cả những gì bạn cần cho doanh nghiệp
              </p>
            </div>

            <!-- Chuyên biệt -->
            <div class="product-card">
              <img
                src="@/assets/pictures/Home/IM_Home_Showcase_Card_02_Products_2_Rugged_PC_376X376.webp"
                alt="Chuyên biệt"
                class="product-image"
              />
              <h2 class="product-title">Chuyên biệt</h2>
              <p class="product-description">Dễ dùng, khó hỏng</p>
            </div>

            <!-- Máy tính bảng -->
            <div class="product-card">
              <img
                src="@/assets/pictures/Home/IM_Home_Showcase_Card_02_Products_3_Tablets_PC_376X376.avif"
                alt="Máy tính bảng"
                class="product-image"
              />
              <h2 class="product-title">Máy tính bảng</h2>
              <p class="product-description">
                Màn hình lớn cùng hiệu năng vượt trội
              </p>
            </div>
          </div>
        </div>
      </transition>
    </div>

    <div class="tab-section">
      <div class="section-title">Displays</div>
      <div class="tab-navigation">
        <!-- Tab: Sản phẩm -->
        <div
          class="tab-item"
          :class="[
            selectedDisplay === 'product' ? 'active' : '',
            selectedDisplay !== 'product' && hoveredDisplay === 'product' ? 'hovered' : '',
          ]"
          @click="selectedDisplay = 'product'"
          @mouseenter="hoveredDisplay = 'product'"
          @mouseleave="hoveredDisplay = null"
        >
          Sản phẩm
        </div>

        <!-- Tab: Giải pháp -->
        <div
          class="tab-item"
          :class="[
            selectedDisplay === 'solution' ? 'active' : '',
            selectedDisplay !== 'solution' && hoveredDisplay === 'solution' ? 'hovered' : '',
          ]"
          @click="selectedDisplay = 'solution'"
          @mouseenter="hoveredDisplay = 'solution'"
          @mouseleave="hoveredDisplay = null"
        >
          Giải pháp
        </div>
      </div>
    </div>

    <div class="content-section">
      <transition :name="transitionDisplayName" mode="out-in">
        <div
          v-if="selectedDisplay === 'product'"
          :key="'display-product'"
          class="display-grid"
        >
          <!-- Nội dung "Sản phẩm" phần Displays -->
          <div class="display-col-main">
            <img
              src="@/assets/pictures/Home/Display_PC_684x684.webp"
              alt="Ưu đãi"
              class="display-image"
            />
            <div class="display-text dark">
              <div class="display-title">
                Màn hình cho doanh nghiệp
              </div>
              <div class="display-subtitle">
                Đẳng cấp hiển thị thu hút mọi sự chú ý
              </div>
            </div>
          </div>
          <div class="display-col">
            <div class="display-item light">
              <img
                src="@/assets/pictures/Home/display-products_PC_Smart-Signage_2.avif"
                alt="Lựa chọn tốt nhất"
                class="display-item-image"
              />
              <div class="display-item-text dark">
                <div class="display-item-title">
                  Màn hình chuyên dụng
                </div>
                <div class="display-item-subtitle">
                  Hiển thị hình ảnh sống động chuyên nghiệp
                </div>
              </div>
            </div>
            <div class="display-item light">
              <img
                src="@/assets/pictures/Home/display-products_PC_LED-Signage_2.webp"
                alt="Galaxy S25 Ultra"
                class="display-item-image"
              />
              <div class="display-item-text dark">
                <div class="display-item-title">
                  Màn hình LED Signage
                </div>
                <div class="display-item-subtitle">
                  Giải pháp dành cho doanh nghiệp vừa và nhỏ
                </div>
              </div>
            </div>
          </div>
          <div class="display-col">
            <div class="display-item light">
              <img
                src="@/assets/pictures/Home/display-products_PC_Commercial-TVs_2.avif"
                alt="Samsung Knox"
                class="display-item-image"
              />
              <div class="display-item-text dark">
                <div class="display-item-title">
                  Màn hình khách sạn thông minh
                </div>
                <div class="display-item-subtitle">
                  Nâng cấp với TV dành cho doang nghiệp
                </div>
              </div>
            </div>

            <div class="display-item light">
              <img
                src="@/assets/pictures/Home/display-products_PC_Monitors_2.avif"
                alt="Samsung SMB"
                class="display-item-image"
              />
              <div class="display-item-text dark">
                <div class="display-item-title">
                  Màn hình
                </div>
                <div class="display-item-subtitle">
                  Nâng cao hiệu quả và hiệu suất tối đa
                </div>
              </div>
            </div>
          </div>
        </div>
      </transition>
      <transition :name="transitionDisplayName" mode="out-in">
        <div
          v-if="selectedDisplay === 'solution'"
          :key="'display-solution'"
          class="solution-grid"
        >
          <!-- Nội dung "Giải pháp" phần Displays -->
          <div class="solution-row">
            <!-- Enterprise Edition -->
            <div class="solution-card">
              <img
                src="@/assets/pictures/Home/Display-Solutions_PC_448x684_3-Card_MagicINFO.webp"
                alt="Enterprise Edition"
                class="solution-image"
              />
              <div class="solution-text">
                <h2 class="solution-title">
                  Giải pháp MagicINFO™
                </h2>
                <p class="solution-description">
                  Giải pháp quản lý màn thông minh
                </p>
              </div>
            </div>

            <!-- Chuyên biệt -->
            <div class="solution-card">
              <img
                src="@/assets/pictures/Home/Display-Solutions_PC_448x684_3-Card_Color-Expert-LED.avif"
                alt="Chuyên biệt"
                class="solution-image"
              />
              <div class="solution-text dark">
                <h2 class="solution-title">
                  Giải pháp Color Expert LED
                </h2>
                <p class="solution-description">
                  Giải pháp hiệu chuẩn màn hình LED
                </p>
              </div>
            </div>

            <!-- Máy tính bảng -->
            <div class="solution-card">
              <img
                src="@/assets/pictures/Home/Display-Solutions_PC_448x684_3-Card_LYNK-HMS.avif"
                alt="Máy tính bảng"
                class="solution-image"
              />
              <div class="solution-text dark">
                <h2 class="solution-title">
                  Giải pháp LYNK REACH
                </h2>
                <p class="solution-description">
                  Giải pháp quản lý TV khách sạn
                </p>
              </div>
            </div>
          </div>
        </div>
      </transition>
    </div>
    <div class="tab-section">
      <div class="section-title">Điều hòa nhiệt độ</div>
    </div>
    <div class="content-section">
      <transition :name="transitionName" mode="in-out">
        <div
          v-show="selected === 'feature'"
          class="ac-grid"
          key="feature"
        >
          <!-- Cột 1 -->
          <div class="ac-col-main">
            <img
              src="@/assets/pictures/Home/da_showcase_card_01.avif"
              alt="Ưu đãi"
              class="ac-image"
            />
            <div class="ac-text">
              <h2 class="ac-title">
                Giải pháp điều hòa tối tân
              </h2>
              <p class="ac-subtitle">
                Đột phá công nghệ diều hòa sáng tạo
              </p>
            </div>
          </div>

          <!-- Cột 2 -->
          <div class="ac-col">
            <div class="ac-item">
              <img
                src="@/assets/pictures/Home/AM015TNVDCH-AA_001_Front_White_thumb_PC_160x160.webp"
                alt="Lựa chọn tốt nhất"
                class="ac-item-image"
              />
              <div class="ac-item-text">
                <h2 class="ac-item-title">
                  WindFree™ Treo tường
                </h2>
              </div>
            </div>
            <div class="ac-item">
              <img
                src="@/assets/pictures/Home/250_AM007NN1DCH-AA_001_Front_White_thumb_PC_160x160.webp"
                alt="Galaxy S25 Ultra"
                class="ac-item-image"
              />
              <div class="ac-item-text">
                <h2 class="ac-item-title">
                  Điều hòa WindFree™ 1 chiều
                </h2>
              </div>
            </div>
          </div>

          <!-- Cột 3 -->
          <div class="ac-col">
            <div class="ac-item">
              <img
                src="@/assets/pictures/Home/250_AM045NN4DEH-EU_001_Front-Sensor-on_White_thumb_PC_160x160.avif"
                alt="Samsung Knox"
                class="ac-item-image"
              />
              <div class="ac-item-text">
                <h2 class="ac-item-title">
                  Điều hòa WindFree™ 4 chiều
                </h2>
              </div>
            </div>

            <div class="ac-item">
              <img
                src="@/assets/pictures/Home/180_4.AC071KN4DKH-EU_002_Front_White_thumb_PC_160x160.webp"
                alt="Samsung SMB"
                class="ac-item-image"
              />
              <div class="ac-item-text">
                <h2 class="ac-item-title">
                  360 Cassette
                </h2>
              </div>
            </div>
          </div>
        </div>
      </transition>
    </div>
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { library } from "@fortawesome/fontawesome-svg-core";
import {
  faSchool,
  faStore, 
  faChartSimple,
  faLandmark,
  faBuilding,
} from "@fortawesome/free-solid-svg-icons";

library.add(faSchool, faStore, faChartSimple, faLandmark, faBuilding);

export default {
  name: "ProductPage",
  components: {
    FontAwesomeIcon,
  },
  data() {
    return {
      selected: "feature",
      hovered: null,
      transitionName: "slide-left", // mặc định

      selectedDisplay: "product",
      hoveredDisplay: null,
      transitionDisplayName: "slide-left",
      currentImage: 0, // Tracks the current image index
      images: [
        "@/assets/pictures/Home/03_Product_00_PC.jpg",
        "@/assets/pictures/Home/home_galaxy_s25_ultra_kv_main_kv_1440x640_250103.avif",
      ],
    };
  },
  watch: {
    selected(newVal, oldVal) {
      if (oldVal === "feature" && newVal === "product") {
        this.transitionName = "slide-left";
      } else if (oldVal === "product" && newVal === "feature") {
        this.transitionName = "slide-right";
      }
    },
    selectedDisplay(newVal, oldVal) {
      if (oldVal === "product" && newVal === "solution") {
        this.transitionDisplayName = "slide-left";
      } else if (oldVal === "solution" && newVal === "product") {
        this.transitionDisplayName = "slide-right";
      }
    },
  },
  methods: {
    // Go to the previous image
    prevImage() {
      this.currentImage =
        (this.currentImage - 1 + this.images.length) % this.images.length;
    },
    // Go to the next image
    nextImage() {
      this.currentImage = (this.currentImage + 1) % this.images.length;
    },
  },
};
</script>

<style scoped>
/* General Styles */
.product-container {
  width: 100%;
  }

/* Hero Section */
.hero-section {
  width: 91.666667%;
  height: 100%;
  margin-bottom: 2.5rem;
  color: white;
  margin-left: auto;
  margin-right: auto;
}

.hero-image-container {
  position: relative;
  width: 100%;
  height: 100%;
}

.hero-image {
  object-fit: cover;
  width: 100%;
  height: 100%;
}

.hero-text {
  position: absolute;
  top: 50%;
  left: 2.5rem;
  transform: translateY(-50%);
  text-align: left;
  width: 66.666667%;
}

.hero-title {
  font-size: 3.25rem;
  font-weight: 700;
  margin-bottom: 1rem;
}

.hero-subtitle {
  font-size: 1rem;
}

/* Industry Section */
.industry-section {
  max-width: 56rem;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  margin-bottom: 5rem;
}

.section-title {
  font-size: 2.25rem;
  font-weight: 700;
  margin-bottom: 3rem;
}

.industry-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1.25rem;
  justify-content: center;
}

@media (min-width: 640px) {
  .industry-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (min-width: 768px) {
  .industry-grid {
    grid-template-columns: repeat(5, 1fr);
  }
}

.industry-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  cursor: pointer;
  padding: 0.5rem;
}

.industry-item.col-start-1 {
  grid-column-start: 1;
}

.industry-icon {
  font-size: 1.875rem;
}

.industry-name {
  margin-top: 0.5rem;
  transition: color 0.3s;
}

.industry-item:hover .industry-name {
  color: #2563eb;
}

/* Tab Navigation */
.tab-section {
  max-width: 56rem;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  margin-bottom: 0.75rem;
}

.tab-navigation {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  place-items: center;
}

@media (max-width: 767px) {
  .tab-navigation {
    grid-template-columns: 1fr;
  }
}

.tab-item {
  font-weight: 600;
  cursor: pointer;
  width: 100%;
  border-bottom: 2px solid transparent;
  transition: opacity 0.2s;
  text-align: center;
  display: inline-block;
  padding: 0.5rem 1rem;
}

.tab-item.active {
  border-bottom-color: black;
}

.tab-item.hovered {
  opacity: 0.5;
}

/* Content Section */
.content-section {
  position: relative;
  min-height: 700px;
  margin-bottom: 5rem;
}

/* Feature Grid */
.feature-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
  width: 100%;
  padding: 0.5rem;
}

@media (min-width: 768px) {
  .feature-grid {
    grid-template-columns: repeat(12, 1fr);
  }
}

.feature-col-main {
  position: relative;
  border-radius: 1rem;
  overflow: hidden;
  height: 100%;
  cursor: pointer;
}

@media (min-width: 768px) {
  .feature-col-main {
    grid-column: span 6;
  }
}

.feature-col {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

@media (min-width: 768px) {
  .feature-col {
    grid-column: span 3;
  }
}

.feature-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.feature-col-main:hover .feature-image {
  transform: scale(1.05) translateY(0.5rem);
  transition: transform 0.3s;
}

.feature-text {
  position: absolute;
  bottom: 3rem;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  color: white;
}

.feature-title {
  font-size: 1.5rem;
  font-weight: 700;
  white-space: nowrap;
  margin-bottom: 1rem;
}

.feature-subtitle {
  font-size: 0.875rem;
  white-space: nowrap;
}

.feature-item {
  position: relative;
  border-radius: 1rem;
  overflow: hidden;
  height: 100%;
  cursor: pointer;
}

.feature-light {
  background-color: #e5e7eb;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  border: 1px solid #e5e7eb;
  display: flex;
  align-items: center;
  justify-content: center;
}

.feature-item-image {
  width: 50%;
  height: 50%;
  object-fit: contain;
  margin-top: -3rem;
}

.feature-item-title {
  font-weight: 700;
  font-size: 1rem;
  white-space: nowrap;
  margin-bottom: 1.25rem;
}

.feature-item-subtitle {
  font-size: 0.75rem;
  white-space: nowrap;
}

.feature-badge {
  position: absolute;
  bottom: 3rem;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  color: black;
  font-weight: 600;
  font-size: 1rem;
  background-color: rgba(255, 255, 255, 0.8);
  padding: 0.25rem 0.5rem;
  border-radius: 0.25rem;
}

/* Product Section */
.product-grid {
  padding: 0.5rem;
  background-color: white;
}

.product-row {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
}

@media (min-width: 768px) {
  .product-row {
    grid-template-columns: repeat(3, 1fr);
  }
}

.product-card {
  background-color: #f3f4f6;
  padding: 1.5rem;
  border-radius: 0.75rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.product-image {
  height: 80%;
  object-fit: contain;
  margin-bottom: 1rem;
}

.product-title {
  font-size: 1.125rem;
  font-weight: 600;
}

.product-description {
  font-size: 0.875rem;
  color: #4b5563;
}

/* Display Grid */
.display-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
  width: 100%;
  padding: 0.5rem;
}

@media (min-width: 768px) {
  .display-grid {
    grid-template-columns: repeat(12, 1fr);
  }
}

.display-col-main {
  position: relative;
  border-radius: 1rem;
  overflow: hidden;
  height: 100%;
  cursor: pointer;
}

@media (min-width: 768px) {
  .display-col-main {
    grid-column: span 6;
  }
}

.display-col {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

@media (min-width: 768px) {
  .display-col {
    grid-column: span 3;
  }
}

.display-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.display-text {
  position: absolute;
  bottom: 3rem;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  color: white;
  padding: 0 1rem;
}

.display-text.dark {
  color: black;
}

.display-title {
  font-size: 1.5rem;
  font-weight: 700;
  white-space: nowrap;
  margin-bottom: 1.25rem;
}

.display-subtitle {
  font-size: 0.75rem;
  white-space: nowrap;
}

.display-item {
  position: relative;
  border-radius: 1rem;
  overflow: hidden;
  height: 100%;
  cursor: pointer;
}

  .display-item.light {
    background-color: #e5e7eb;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  .display-item-image {
    width: 50%;
    height: 50%;
    object-fit: contain;
    margin-top: -3rem;
  }

  .display-item-title {
    font-weight: 700;
    font-size: 1.25rem;
    white-space: nowrap;
    margin-bottom: 1.25rem;
    text-align: center;
  }

  .display-item-subtitle {
    font-size: 0.9rem;
    white-space: nowrap;
    text-align: center;
  }

  /* Solution Grid */
  .solution-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1rem;
    width: 100%;
    padding: 0.5rem;
  }

  @media (min-width: 768px) {
    .solution-grid {
      grid-template-columns: repeat(12, 1fr);
    }
  }

  .solution-row {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1rem;
  }

  @media (min-width: 768px) {
    .solution-row {
      grid-template-columns: repeat(3, 1fr);
      
    }
  }

  .solution-card {
    background-color: #f3f4f6;
    padding: 1.5rem;
    border-radius: 0.75rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .solution-image {
    height: 80%;
    object-fit: contain;
    margin-bottom: 1rem;
  }

  .solution-title {
    font-size: 1.125rem;
    font-weight: 600;
  }

  .solution-description {
    font-size: 0.875rem;
    color: #4b5563;
  }

  /* AC Grid */
  .ac-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1rem;
    width: 100%;
    padding: 0.5rem;
  }

  @media (min-width: 768px) {
    .ac-grid {
      grid-template-columns: repeat(12, 1fr);
    }
  }

  .ac-col-main {
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
    height: 100%;
    cursor: pointer;
  }

  @media (min-width: 768px) {
    .ac-col-main {
      grid-column: span 6;
    }
  }

  .ac-col {
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  @media (min-width: 768px) {
    .ac-col {
      grid-column: span 3;
    }
  }

  .ac-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .ac-text {
    position: absolute;
    bottom: 3rem;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
    color: white;
  }

  .ac-title {
    font-size: 1.5rem;
    font-weight: 700;
    white-space: nowrap;
    margin-bottom: 1rem;
  }

  .ac-subtitle {
    font-size: 0.875rem;
    white-space: nowrap;
  }

  .ac-item {
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
    height: 100%;
    cursor: pointer;
    background-color: #f3f4f6;
    align-content: center;
    align-items: center;
    text-align: center;
  }

  .ac-item-image {
    width: 50%;
    height: 50%;
    object-fit: contain;
    margin-top: -3rem;
    
  }

  .ac-item-title {
    font-weight: 700;
    font-size: 1.25rem;
    white-space: nowrap;
    margin-bottom: 1.25rem;
  }
</style>