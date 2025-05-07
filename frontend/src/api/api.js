import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost',
  headers: {
    'Content-Type': 'application/json',
  },
  withCredentials: true
});

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