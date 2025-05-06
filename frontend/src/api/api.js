import axios from 'axios';

// Create an axios instance with the base URL of your PHP backend
const apiClient = axios.create({
  baseURL: 'http://localhost', // Apache thường chạy trên port 80
  headers: {
    'Content-Type': 'application/json',
  },
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