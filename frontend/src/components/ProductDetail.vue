<template>
  <div class="product-detail">
    <!-- Thông tin sản phẩm -->
    <h1>{{ product?.name }}</h1>
    <img :src="'/images/' + product?.image" :alt="product?.name" class="product-image" />
    <div class="button-group">
      <button class="buy-button">Buy now</button>
    </div>

    <!-- Tabs for Specifications and Reviews -->
    <!-- <div class="tabs">
      <button @click="activeTab = 'specs'" :class="{ active: activeTab === 'specs' }">
        Specifications
      </button>
      <button @click="activeTab = 'reviews'" :class="{ active: activeTab === 'reviews' }">
        Reviews and Comments
      </button>
    </div> -->   
        <div class="tabs-header">
          <div 
            class="tab" 
            :class="{ active: activeTab === 'specs' }" 
            @click="activeTab = 'specs'"
          >
              Specifications
          </div>
          <div 
            class="tab" 
            :class="{ active: activeTab === 'reviews' }" 
            @click="activeTab = 'reviews'"
          >
            Reviews
          </div>
      </div>

    <!-- Specifications Section -->
    <div v-if="activeTab === 'specs' && product?.specs" class="specs-container">
      <div class="spec-container">
        <div v-for="(category, index) in Object.keys(product.specs)" :key="index" class="spec-row">
          <div class="spec-column">
            <h3>{{ category.charAt(0).toUpperCase() + category.slice(1) }}</h3>
          </div>
          <div class="spec-content">
            <div class="spec-grid">
              <div v-for="(value, key) in product.specs[category]" :key="key" class="spec-item">
                <span class="spec-label"><strong>{{ key }}</strong></span>
                <span class="spec-value">{{ value }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Reviews and Comments Section -->
    <div v-if="activeTab === 'reviews'" class="reviews">
      <h2>Reviews and Comments</h2>
      <div v-if="rating" class="average-rating">
        <p><strong>Average Rating:</strong> {{ rating.average_rating }} / 5 ({{ rating.total_ratings }} ratings)</p>
      </div>

      <!-- Form gửi đánh giá và bình luận -->
      <div v-if="isLoggedIn" class="comment-form">
        <h3>Write a Comment and Rating</h3>
        <div class="rating-input">
          <label>Rating:</label>
          <div class="star-rating">
            <span
              v-for="star in 5"
              :key="star"
              class="star"
              :class="{ filled: star <= hoverRating || star <= newRating }"
              @mouseover="hoverRating = star"
              @mouseleave="hoverRating = 0"
              @click="newRating = star"
            >
              <i class="fas fa-star"></i>
            </span>
          </div>
          <button @click="submitRating">Submit Rating</button>
        </div>
        <div class="comment-input">
          <textarea v-model="newComment" placeholder="Write your comment..." rows="4"></textarea>
          <button @click="submitComment">Submit Comment</button>
        </div>
      </div>
      <div v-else class="login-prompt">
        <p>You must log in to use this feature</p>
      </div>

      <!-- Danh sách bình luận -->
      <div class="comments">
        <h3>Comments</h3>
        <div v-if="comments.length === 0" class="no-comments">
          <p>No comments yet.</p>
        </div>
        <div v-else v-for="comment in comments" :key="comment.id" class="comment">
          <p><strong>{{ comment.full_name }} ({{ comment.username }})</strong> - {{ formatDate(comment.created_at) }}</p>
          <p>{{ comment.comment }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { fetchProductDetails, fetchComments, fetchRating, postComment, postRating, checkSession } from '../api/api';

export default {
  name: 'ProductDetail',
  data() {
    return {
      product: null,
      comments: [],
      rating: null,
      newComment: '',
      newRating: 0,
      hoverRating: 0,
      isLoggedIn: false,
      activeTab: 'specs', // Default tab
    };
  },
  async mounted() {
    const productId = this.$route.params.id;

    // Kiểm tra trạng thái đăng nhập
    try {
      const session = await checkSession();
      this.isLoggedIn = session.loggedIn;
    } catch (error) {
      console.error('Error checking session:', error);
    }

    // Lấy thông tin sản phẩm
    try {
      const response = await fetchProductDetails(productId);
      if (response.success) {
        this.product = response.product;
      } else {
        console.error('Failed to load product details:', response.message);
      }
    } catch (error) {
      console.error('Error loading product details:', error);
    }

    // Lấy bình luận
    try {
      const response = await fetchComments(productId);
      if (response.success) {
        this.comments = response.comments;
      }
    } catch (error) {
      console.error('Error loading comments:', error);
    }

    // Lấy đánh giá trung bình
    try {
      const response = await fetchRating(productId);
      if (response.success) {
        this.rating = response;
      }
    } catch (error) {
      console.error('Error loading rating:', error);
    }
  },
  methods: {
    async submitComment() {
      if (!this.newComment.trim()) {
        alert('Please enter a comment!');
        return;
      }
      try {
        const response = await postComment(this.$route.params.id, this.newComment);
        if (response.success) {
          this.newComment = '';
          const commentsResponse = await fetchComments(this.$route.params.id);
          if (commentsResponse.success) {
            this.comments = commentsResponse.comments;
          }
        } else {
          alert(response.message);
        }
      } catch (error) {
        console.error('Error submitting comment:', error);
      }
    },
    async submitRating() {
      if (this.newRating === 0) {
        alert('Please select a star rating!');
        return;
      }
      try {
        const response = await postRating(this.$route.params.id, this.newRating);
        if (response.success) {
          const ratingResponse = await fetchRating(this.$route.params.id);
          if (ratingResponse.success) {
            this.rating = ratingResponse;
          }
        } else {
          alert(response.message);
        }
      } catch (error) {
        console.error('Error submitting rating:', error);
      }
    },
    formatDate(dateString) {
      const date = new Date(dateString);
      return date.toLocaleString('en-US', { dateStyle: 'short', timeStyle: 'short' });
    },
  },
};
</script>

<style scoped>
/* Include Font Awesome for star icons */
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css');

.product-detail {
  margin: 0 auto;
  padding: 20px;
  font-family: 'Samsung Sharp Sans';
}

.product-image {
  width: 100%;
  max-height: 400px;
  object-fit: contain;
}

.tabs-header {
  display: flex;
  border-bottom: 1px solid #e0e0e0;
}

.tab {
  padding: 15px 30px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  border-bottom: 3px solid transparent;
}

.tab:hover {
  background-color: #f5f5f5;
}

.tab.active {
  border-bottom-color: #1976d2;
  color: #1976d2;
}


.specs-container,
.reviews {
  border: 1px solid #e0e0e0;
  padding: 15px;
  border-radius: 5px;
}

.spec-container {
  width: 100%;
}

.spec-row {
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 20px;
  margin-bottom: 20px;
}

.spec-row:not(:last-child) {
  border-bottom: 1px solid #e0e0e0;
  padding-top: 20px;
  padding-bottom: 20px;
}

.spec-column {
  margin-left: 30px;
}

.spec-column h3 {
  font-size: 20px;
  font-weight: 700;
  margin: 0;
  color: #333;
}

.spec-content {
  display: flex;
  flex-wrap: wrap;
}

.spec-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  width: 100%;
}

.spec-item {
  display: flex;
  flex-direction: column;
  margin-bottom: 10px;
}

.spec-label {
  font-size: 16px;
 
  margin-bottom: 10px;
  font-weight: bold;
}

.spec-value {
  font-size: 14px;
  color: #333;
}

.star-rating {
  display: inline-block;
  margin-left: 10px;
}

.star {
  cursor: pointer;
  color: #ccc;
  font-size: 20px;
}

.star.filled {
  color: #f5c518;
}

.rating-input {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.rating-input label {
  font-size: 14px;
  font-weight: bold;
}

.comment-input textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  font-size: 14px;
}

button {
  padding: 8px 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

button:hover {
  background-color: #0056b3;
}

.button-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
  width: 100%;
  align-items: center;
}
.buy-button {
  background-color: black;
  color: white;
  width: 200px;
  border: 2px solid black;
  padding: 12px 20px;
  border-radius: 50px;
  cursor: pointer;
  text-transform: uppercase;
  font-family: 'Samsung Sharp Sans';
  margin-bottom: 20px;
  transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
}
.buy-button:hover {
  background-color: white;
  color: black;
}

.average-rating {
  margin-bottom: 20px;
  font-size: 14px;
}

.comment-form {
  margin-bottom: 30px;
}

.login-prompt {
  text-align: center;
  margin-bottom: 20px;
  color: #888;
  font-size: 14px;
}

.comments h3 {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

.comment {
  border-bottom: 1px solid #e0e0e0;
  padding: 10px 0;
  margin-bottom: 10px;
}

.comment p {
  margin: 5px 0;
  font-size: 14px;
}

.no-comments {
  text-align: center;
  color: #888;
  font-size: 14px;
}

@media (max-width: 768px) {
  .product-detail {
    padding: 15px;
  }

  .spec-column h3 {
    font-size: 2rem;
    color: #1428a0;
  }

  .spec-column {
    margin-left: 0px;
  }

  .spec-row {
    grid-template-columns: 1fr;
  }

  .spec-grid {
    grid-template-columns: 1fr;
  }

  .tabs {
    flex-direction: column;
  }

  .tabs button {
    margin-bottom: 5px;
  }
}
</style>