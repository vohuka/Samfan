<template>
  <div class="product-container">
    <div class="relative w-11/12 h-full mb-10 text-white mx-auto">
      <!-- Background Image -->
      <div class="relative w-full h-full">
        <img
          src="@/assets/pictures/Home/03_Product_00_PC.jpg"
          alt="Business Image"
          class="object-cover w-full h-full"
        />
        <!-- Overlay Text -->
        <div
          class="absolute top-1/2 left-10 transform -translate-y-1/2 text-left w-2/3"
        >
          <h1 class="text-4xl font-bold mb-4">
            Màn Hình Chuyên Dụng Cho Doanh Nghiệp
          </h1>
          <p class="text-xs">
            Nâng tầm doanh nghiệp với công nghệ hiển thị hàng đầu
          </p>
        </div>
        <!-- Next and Previous Buttons -->
      </div>
    </div>

    <!-- Call to Action Button -->

    <div class="max-w-4xl mx-auto text-center mb-20">
      <div class="text-4xl font-bold mb-12">Tailored for your industry</div>
      <div
        class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-5 justify-center"
      >
        <div
          class="group flex flex-col items-center cursor-pointer col-start-1 p-2"
        >
          <font-awesome-icon :icon="['fas', 'school']" class="text-3xl" />
          <div class="mt-2 group-hover:text-blue-600 transition-colors">
            Giáo dục
          </div>
        </div>
        <div class="group flex flex-col items-center cursor-pointer p-2">
          <font-awesome-icon :icon="['fas', 'store']" class="text-3xl" />
          <div class="mt-2 group-hover:text-blue-600 transition-colors">
            Bán lẻ
          </div>
        </div>
        <div class="group flex flex-col items-center cursor-pointer p-2">
          <font-awesome-icon :icon="['fas', 'chart-simple']" class="text-3xl" />
          <div class="mt-2 group-hover:text-blue-600 transition-colors">
            Tài chính
          </div>
        </div>
        <div class="group flex flex-col items-center cursor-pointer p-2">
          <font-awesome-icon :icon="['fas', 'landmark']" class="text-3xl" />
          <div class="mt-2 group-hover:text-blue-600 transition-colors">
            Chính phủ
          </div>
        </div>
        <div class="group flex flex-col items-center cursor-pointer p-2">
          <font-awesome-icon :icon="['fas', 'building']" class="text-3xl" />
          <div class="mt-2 group-hover:text-blue-600 transition-colors">
            Doanh nghiệp
          </div>
        </div>
      </div>
    </div>
    <div class="max-w-4xl mx-auto text-center mb-3">
      <div class="text-4xl font-bold mb-12">Di động</div>
      <div class="grid md:grid-cols-6 place-items-center item-center">
        <div
          class="col-start-3 font-semibold cursor-pointer w-max border-b-2 transition-opacity duration-200"
          :class="[
            selected === 'feature' ? 'border-black' : 'border-transparent',
            selected !== 'feature' && hovered === 'feature' ? 'opacity-50' : '',
          ]"
          @click="selected = 'feature'"
          @mouseenter="hovered = 'feature'"
          @mouseleave="hovered = null"
        >
          Tính năng
        </div>
        <div
          class="font-semibold cursor-pointer w-max border-b-2 transition-opacity duration-200"
          :class="[
            selected === 'product' ? 'border-black' : 'border-transparent',
            selected !== 'product' && hovered === 'product' ? 'opacity-50' : '',
          ]"
          @click="selected = 'product'"
          @mouseenter="hovered = 'product'"
          @mouseleave="hovered = null"
        >
          Sản phẩm
        </div>
      </div>
    </div>

    <div class="relative min-h-[700px] mb-20">
      <transition :name="transitionName" mode="in-out">
        <div
          v-show="selected === 'feature'"
          class="grid grid-cols-1 md:grid-cols-12 gap-4 w-full p-2"
          key="feature"
        >
          <!-- Cột 1 -->
          <div
            class="relative rounded-2xl overflow-hidden h-full col-span-6 cursor-pointer group"
          >
            <img
              src="@/assets/pictures/Home/684x684_PC.webp"
              alt="Ưu đãi"
              class="w-full h-full object-cover group-hover:scale-105 group-hover:translate-y-2 transition-transform"
            />
            <div
              class="absolute bottom-12 left-1/2 transform -translate-x-1/2 text-white text-center"
            >
              <div class="text-2xl font-bold whitespace-nowrap mb-4">
                Ưu Đãi độc quyền cho doanh nghiệp
              </div>
              <div class="text-sm whitespace-nowrap">
                Đăng kí nhận ngay ưu đãi độc quyền
              </div>
            </div>
          </div>

          <!-- Cột 2 -->
          <div class="flex flex-col gap-4 col-span-3">
            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer"
            >
              <img
                src="@/assets/pictures/Home/2D_UK_pc.avif"
                alt="Lựa chọn tốt nhất"
                class="w-full h-full object-cover"
              />
              <div
                class="absolute bottom-12 left-1/2 transform -translate-x-1/2 text-white text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Samsung - Lựa chọn di động tốt nhất
                </div>
                <div class="text-xs whitespace-nowrap">
                  Thiết kế để đồng hành cùng doanh nghiệp
                </div>
              </div>
            </div>

            <div
              class="relative rounded-2xl overflow-hidden h-full bg-gray-200 cursor-pointer shadow-md border border-gray-200 flex items-center justify-center"
            >
              <img
                src="@/assets/pictures/Home/HOME_Galaxy_S25_Ultra_KV_Merchandising_160x160.webp"
                alt="Galaxy S25 Ultra"
                class="w-1/2 h-1/2 object-contain -mt-12"
              />
              <div
                class="absolute bottom-12 left-1/2 transform -translate-x-1/2 text-black font-semibold text-base bg-opacity-80 px-2 py-1 rounded"
              >
                Galaxy S25 Ultra
              </div>
            </div>
          </div>

          <!-- Cột 3 -->
          <div class="flex flex-col gap-4 col-span-3">
            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer"
            >
              <img
                src="@/assets/pictures/Home/Knox-Suite_pc.avif"
                alt="Samsung Knox"
                class="w-full h-full object-cover"
              />
              <div
                class="absolute bottom-12 left-1/2 transform -translate-x-1/2 text-white text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Samsung Knox
                </div>
                <div class="text-xs whitespace-nowrap">
                  Giải pháp di động dành cho doang nghiệp
                </div>
              </div>
            </div>

            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer"
            >
              <img
                src="@/assets/pictures/Home/pc.jpeg"
                alt="Samsung SMB"
                class="w-full h-full object-cover"
              />
              <div
                class="absolute bottom-12 left-1/2 transform -translate-x-1/2 text-white text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Samsung SMB
                </div>
                <div class="text-xs whitespace-nowrap">
                  Giải pháp dành cho doanh nghiệp vừa và nhỏ
                </div>
              </div>
            </div>
          </div>
        </div>
      </transition>

      <!-- Product Section -->
      <transition name="transitionName" mode="in-out">
        <div v-show="selected === 'product'" key="product" class="p-2 bg-white">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Enterprise Edition -->
            <div
              class="bg-gray-100 p-6 rounded-xl flex flex-col items-center text-center"
            >
              <img
                src="@/assets/pictures/Home/IM_Home_Showcase_Card_02_Products_1_Enterprise_Edition_PC_376X376.avif"
                alt="Enterprise Edition"
                class="h-full object-contain mb-4"
              />
              <h2 class="text-lg font-semibold">Enterprise Edition</h2>
              <p class="text-sm text-gray-600">
                Tất cả những gì bạn cần cho doanh nghiệp
              </p>
            </div>

            <!-- Chuyên biệt -->
            <div
              class="bg-gray-100 p-6 rounded-xl flex flex-col items-center text-center"
            >
              <img
                src="@/assets/pictures/Home/IM_Home_Showcase_Card_02_Products_2_Rugged_PC_376X376.webp"
                alt="Chuyên biệt"
                class="h-full object-contain mb-4"
              />
              <h2 class="text-lg font-semibold">Chuyên biệt</h2>
              <p class="text-sm text-gray-600">Dễ dùng, khó hỏng</p>
            </div>

            <!-- Máy tính bảng -->
            <div
              class="bg-gray-100 p-6 rounded-xl flex flex-col items-center text-center"
            >
              <img
                src="@/assets/pictures/Home/IM_Home_Showcase_Card_02_Products_3_Tablets_PC_376X376.avif"
                alt="Máy tính bảng"
                class="h-full object-contain mb-4"
              />
              <h2 class="text-lg font-semibold">Máy tính bảng</h2>
              <p class="text-sm text-gray-600">
                Màn hình lớn cùng hiệu năng vượt trội
              </p>
            </div>
          </div>
        </div>
      </transition>
    </div>

    <div class="max-w-4xl mx-auto text-center mb-3">
      <div class="text-4xl font-bold mb-12">Displays</div>
      <div class="grid md:grid-cols-6 place-items-center item-center">
        <!-- Tab: Sản phẩm -->
        <div
          class="col-start-3 font-semibold cursor-pointer w-max border-b-2 transition-opacity duration-200"
          :class="[
            selectedDisplay === 'product'
              ? 'border-black'
              : 'border-transparent',
            selectedDisplay !== 'product' && hoveredDisplay === 'product'
              ? 'opacity-50'
              : '',
          ]"
          @click="selectedDisplay = 'product'"
          @mouseenter="hoveredDisplay = 'product'"
          @mouseleave="hoveredDisplay = null"
        >
          Sản phẩm
        </div>

        <!-- Tab: Giải pháp -->
        <div
          class="font-semibold cursor-pointer w-max border-b-2 transition-opacity duration-200"
          :class="[
            selectedDisplay === 'solution'
              ? 'border-black'
              : 'border-transparent',
            selectedDisplay !== 'solution' && hoveredDisplay === 'solution'
              ? 'opacity-50'
              : '',
          ]"
          @click="selectedDisplay = 'solution'"
          @mouseenter="hoveredDisplay = 'solution'"
          @mouseleave="hoveredDisplay = null"
        >
          Giải pháp
        </div>
      </div>
    </div>

    <div class="relative min-h-[600px] mb-20">
      <transition :name="transitionDisplayName" mode="out-in">
        <div
          v-if="selectedDisplay === 'product'"
          :key="'display-product'"
          class="grid grid-cols-1 md:grid-cols-12 gap-4 w-full p-2"
        >
          <!-- Nội dung "Sản phẩm" phần Displays -->
          <div
            class="relative rounded-2xl overflow-hidden h-full col-span-6 cursor-pointer"
          >
            <img
              src="@/assets/pictures/Home/Display_PC_684x684.webp"
              alt="Ưu đãi"
              class="w-full h-full object-cover"
            />
            <div
              class="absolute bottom-12 left-1/2 transform -translate-x-1/2 text-black text-center px-4"
            >
              <div class="font-bold text-2xl whitespace-nowrap mb-5">
                Màn hình cho doanh nghiệp
              </div>
              <div class="text-xs whitespace-nowrap">
                Đẳng cấp hiển thị thu hút mọi sự chú ý
              </div>
            </div>
          </div>
          <div class="flex flex-col gap-4 col-span-3">
            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer bg-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/display-products_PC_Smart-Signage_2.avif"
                alt="Lựa chọn tốt nhất"
                class="w-2/3 h-2/3 object-contain p-4 -mt-20"
              />
              <div
                class="absolute bottom-10 left-1/2 transform -translate-x-1/2 text-blackblack text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Màn hình chuyên dụng
                </div>
                <div class="text-xs whitespace-nowrap">
                  Hiển thị hình ảnh sống động chuyên nghiệp
                </div>
              </div>
            </div>
            <div
              class="relative rounded-2xl overflow-hidden h-full bg-gray-200 cursor-pointer shadow-md border border-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/display-products_PC_LED-Signage_2.webp"
                alt="Galaxy S25 Ultra"
                class="w-2/3 h-2/3 object-contain p-4 -mt-20"
              />
              <div
                class="absolute bottom-10 left-1/2 transform -translate-x-1/2 text-black text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Màn hình LED Signage
                </div>
                <div class="text-xs whitespace-nowrap">
                  Giải pháp dành cho doanh nghiệp vừa và nhỏ
                </div>
              </div>
            </div>
          </div>
          <div class="flex flex-col gap-4 col-span-3">
            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer bg-gray-200 shadow-md border border-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/display-products_PC_Commercial-TVs_2.avif"
                alt="Samsung Knox"
                class="w-2/3 h-2/3 object-contain p-4 -mt-20"
              />
              <div
                class="absolute bottom-10 left-1/2 transform -translate-x-1/2 text-black text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Màn hình khách sạn thông minh
                </div>
                <div class="text-xs whitespace-nowrap">
                  Nâng cấp với TV dành cho doang nghiệp
                </div>
              </div>
            </div>

            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer bg-gray-200 shadow-md border border-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/display-products_PC_Monitors_2.avif"
                alt="Samsung SMB"
                class="w-2/3 h-2/3 object-contain p-4 -mt-20"
              />
              <div
                class="absolute bottom-10 left-1/2 transform -translate-x-1/2 text-black text-center px-4"
              >
                <div class="font-bold text-base whitespace-nowrap mb-5">
                  Màn hình
                </div>
                <div class="text-xs whitespace-nowrap">
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
          class="p-2 bg-white"
        >
          <!-- Nội dung "Giải pháp" phần Displays -->
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Enterprise Edition -->
            <div
              class="relative bg-gray-100 rounded-xl flex flex-col items-center text-center h-full"
            >
              <img
                src="@/assets/pictures/Home/Display-Solutions_PC_448x684_3-Card_MagicINFO.webp"
                alt="Enterprise Edition"
                class="h-full w-full object-cover rounded-xl"
              />
              <div
                class="absolute bottom-5 text-white left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-lg font-semibold mb-5 whitespace-nowrap">
                  Giải pháp MagicINFO™
                </h2>
                <p class="text-xs whitespace-nowrap">
                  Giải pháp quản lý màn thông minh
                </p>
              </div>
            </div>

            <!-- Chuyên biệt -->
            <div
              class="relative bg-gray-100 rounded-xl flex flex-col items-center text-center h-full"
            >
              <img
                src="@/assets/pictures/Home/Display-Solutions_PC_448x684_3-Card_Color-Expert-LED.avif"
                alt="Chuyên biệt"
                class="h-full w-full object-cover rounded-xl"
              />
              <div
                class="absolute bottom-5 text-black left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-lg font-semibold mb-5 whitespace-nowrap">
                  Giải pháp Color Expert LED
                </h2>
                <p class="text-xs whitespace-nowrap">
                  Giải pháp hiệu chuẩn màn hình LED
                </p>
              </div>
            </div>

            <!-- Máy tính bảng -->
            <div
              class="relative bg-gray-100 rounded-xl flex flex-col items-center text-center h-full"
            >
              <img
                src="@/assets/pictures/Home/Display-Solutions_PC_448x684_3-Card_LYNK-HMS.avif"
                alt="Máy tính bảng"
                class="h-full w-full object-cover rounded-xl"
              />
              <div
                class="absolute bottom-5 text-black left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-lg font-semibold mb-5 whitespace-nowrap">
                  Giải pháp LYNK REACH
                </h2>
                <p class="text-xs whitespace-nowrap">
                  Giải pháp quản lý TV khách sạn
                </p>
              </div>
            </div>
          </div>
        </div>
      </transition>
    </div>
    <div class="max-w-4xl mx-auto text-center mb-3">
      <div class="text-4xl font-bold mb-12">Điều hòa nhiệt độ</div>
    </div>
    <div class="relative min-h-[700px] mb-20">
      <transition :name="transitionName" mode="in-out">
        <div
          v-show="selected === 'feature'"
          class="grid grid-cols-1 md:grid-cols-12 gap-4 w-full p-2"
          key="feature"
        >
          <!-- Cột 1 -->
          <div
            class="relative rounded-2xl overflow-hidden h-full col-span-6 cursor-pointer"
          >
            <img
              src="@/assets/pictures/Home/da_showcase_card_01.avif"
              alt="Ưu đãi"
              class="w-full h-full object-cover"
            />
            <div
              class="absolute bottom-5 text-white left-1/2 transform -translate-x-1/2 text-center"
            >
              <h2 class="text-2xl font-semibold mb-5 whitespace-nowrap">
                Giải pháp điều hòa tối tân
              </h2>
              <p class="text-xs whitespace-nowrap">
                Đột phá công nghệ diều hòa sáng tạo
              </p>
            </div>
          </div>

          <!-- Cột 2 -->
          <div class="flex flex-col gap-4 col-span-3">
            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer bg-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/AM015TNVDCH-AA_001_Front_White_thumb_PC_160x160.webp"
                alt="Lựa chọn tốt nhất"
                class="w-1/2 h-1/2 object-contain p-4 -mt-10"
              />
              <div
                class="absolute bottom-20 text-black left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-md font-semibold whitespace-nowrap">
                  WindFree™ Treo tường
                </h2>
              </div>
            </div>
            <div
              class="relative rounded-2xl overflow-hidden h-full bg-gray-200 cursor-pointer shadow-md border border-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/250_AM007NN1DCH-AA_001_Front_White_thumb_PC_160x160.webp"
                alt="Galaxy S25 Ultra"
                class="w-1/2 h-1/2 object-contain p-4 -mt-10"
              />
              <div
                class="absolute bottom-20 text-black left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-md font-semibold whitespace-nowrap">
                  Điều hòa WindFree™ 1 chiều
                </h2>
              </div>
            </div>
          </div>

          <!-- Cột 3 -->
          <div class="flex flex-col gap-4 col-span-3">
            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer bg-gray-200 shadow-md border border-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/250_AM045NN4DEH-EU_001_Front-Sensor-on_White_thumb_PC_160x160.avif"
                alt="Samsung Knox"
                class="w-1/2 h-1/2 object-contain p-4 -mt-10"
              />
              <div
                class="absolute bottom-20 text-black left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-md font-semibold whitespace-nowrap">
                  Điều hòa WindFree™ 4 chiều
                </h2>
              </div>
            </div>

            <div
              class="relative rounded-2xl overflow-hidden h-full cursor-pointer bg-gray-200 shadow-md border border-gray-200 flex justify-center items-center"
            >
              <img
                src="@/assets/pictures/Home/180_4.AC071KN4DKH-EU_002_Front_White_thumb_PC_160x160.webp"
                alt="Samsung SMB"
                class="w-1/2 h-1/2 object-contain p-4 -mt-10"
              />
              <div
                class="absolute bottom-20 text-black left-1/2 transform -translate-x-1/2 text-center"
              >
                <h2 class="text-md font-semibold whitespace-nowrap">
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
/* Slide từ phải sang trái */
.slide-left-enter-active,
.slide-left-leave-active,
.slide-right-enter-active,
.slide-right-leave-active {
  transition: all 0.3s ease;
}

.slide-left-enter-from {
  transform: translateX(100%);
  opacity: 0;
}
.slide-left-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}

.slide-right-enter-from {
  transform: translateX(-100%);
  opacity: 0;
}
.slide-right-leave-to {
  transform: translateX(100%);
  opacity: 0;
}
</style>
