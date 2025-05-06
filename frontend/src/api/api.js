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
    const response = await apiClient.get('/get_products.php'); // Bỏ "/api" vì DocumentRoot đã trỏ thẳng vào backend
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