import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost',
  headers: {
    'Content-Type': 'application/json',
  },
  withCredentials: true
});

// Function to search products by keyword
export const searchProducts = async (keyword) => {
  try {
    const response = await apiClient.get('/search_products.php', {
      params: { keyword }
    });
    return response.data;
  } catch (error) {
    console.error('Error searching products:', error);
    throw error;
  }
};

// Function to fetch products
export const fetchProducts = async () => {
  try {
    const response = await apiClient.get('/get_products.php');
    return response.data;
  } catch (error) {
    console.error('Error fetching products:', error);
    throw error;
  }
};

// Function to fetch FAQs
export const fetchFAQs = async () => {
  try {
    const response = await apiClient.get('/get_FAQs.php');
    return response.data;
  } catch (error) {
    console.error('Error fetching FAQs:', error);
    throw error;
  }
};

// Function to fetch product details
export const fetchProductDetails = async (productId) => {
  try {
    const response = await apiClient.get(`/get_product_details.php?id=${productId}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching product details:', error);
    throw error;
  }
};

// Function to fetch comments
export const fetchComments = async (productId) => {
  try {
    const response = await apiClient.get(`/get_comments.php?product_id=${productId}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching comments:', error);
    throw error;
  }
};

// Function to fetch average rating
export const fetchRating = async (productId) => {
  try {
    const response = await apiClient.get(`/get_rating.php?product_id=${productId}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching rating:', error);
    throw error;
  }
};

// Function to post a comment
export const postComment = async (productId, comment) => {
  try {
    const response = await apiClient.post('/post_comment.php', { product_id: productId, comment });
    return response.data;
  } catch (error) {
    console.error('Error posting comment:', error);
    throw error;
  }
};

// Function to post a rating
export const postRating = async (productId, rating) => {
  try {
    const response = await apiClient.post('/post_rating.php', { product_id: productId, rating });
    return response.data;
  } catch (error) {
    console.error('Error posting rating:', error);
    throw error;
  }
};

export const fetchCart = async () => {
  try {
    const response = await apiClient.get('/get_cart.php');
    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch cart: ' + error.message);
  }
};

export const updateCart = async (itemId, action) => {
  try {
    const response = await apiClient.post('/update_cart.php', { itemId, action });
    return response.data;
  } catch (error) {
    throw new Error('Failed to update cart: ' + error.message);
  }
};

export const removeFromCart = async (itemId) => {
  try {
    const response = await apiClient.post('/update_cart.php', { itemId, action: 'remove' });
    return response.data;
  } catch (error) {
    throw new Error('Failed to remove item from cart: ' + error.message);
  }
};

export const addToCart = async (data) => {
  try {
    const response = await apiClient.post('/add_to_cart.php', data);
    return response.data;
  } catch (error) {
    throw new Error('Failed to add to cart: ' + error.message);
  }
};

export const signup = async (signupData) => {
  const response = await apiClient.post('/signup.php', signupData);
  return response.data;
};

export const login = async (loginData) => {
  const response = await apiClient.post('/login.php', loginData);
  return response.data;
};

export const logout = async () => {
  const response = await apiClient.post('/logout.php');
  return response.data;
};

export const checkSession = async () => {
  const response = await apiClient.get('/check_session.php');
  return response.data;
};