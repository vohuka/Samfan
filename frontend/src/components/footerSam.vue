<!-- src/components/Footer.vue -->

<template>
  <footer class="samfan-footer">
    <div class="footer-container">
      <div class="footer-sections">
        <div class="footer-column">
          <h4>Products</h4>
          <ul>
            <li><a href="#">Smartphones</a></li>
            <li><a href="#">Tablets</a></li>
            <li><a href="#">TVs</a></li>
            <li><a href="#">Home Appliances</a></li>
          </ul>
        </div>
        <div class="footer-column">
          <h4>Support</h4>
          <ul>
            <li><a href="#">Contact Us</a></li>
            <li><a href="#">Product Support</a></li>
            <li><a href="#">Manuals & Downloads</a></li>
            <li><a href="#">Repair Status</a></li>
          </ul>
        </div>
        <div class="footer-column">
          <h4>About samfan</h4>
          <ul>
            <li><a href="#">Company Info</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Newsroom</a></li>
            <li><a href="#">Sustainability</a></li>
          </ul>
        </div>
        <div class="footer-column">
          <h4>Account</h4>
          <ul>
            <li><a href="#">My account</a></li>
            <li><a href="#">My cart</a></li>
            <li><a href="#">Favorites</a></li>
            <li><a href="#">Samfan member</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <div class="copyright">
          <p>© 2025 Samsung Electronics Co., Ltd. All rights reserved. </p>
          <p>Followed by a Samsung fan, referencing samsung.vn. </p>
        </div>
        <div class="social-links">
          <a href="https://www.facebook.com/vohuka/" target="_blank">
            <i class="fa fa-facebook"></i>
          </a>
          <a href="https://github.com/vohuka" target="_blank">
            <i class="fa fa-github"></i>
          </a>
          <a href="https://www.linkedin.com/in/khangvohuu/" target="_blank">
            <i class="fa fa-linkedin"></i>
          </a>
          <a href="https://www.youtube.com/@vohuka" target="_blank">
            <i class="fa fa-youtube-play"></i>
          </a>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>


export default {
  name: 'SamfanFooter',
}
</script>

<style scoped>
.samfan-footer {
  font-family: 'Samsung Sharp Sans';
  background-color: #f4f4f4;
  padding: 40px 0;
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 15px;
}

.footer-sections {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  margin-bottom: 30px;
  gap: 20px;
}

.footer-column {
  margin-bottom: 20px;
  width: 100%; /* 1 cột/hàng trên màn hình nhỏ (1/4 màn hình) */
  
}

.footer-column h4 {
  margin-bottom: 15px;
  font-weight: bold;
  font-size: 16px;
}

.footer-column ul {
  list-style: none;
  padding: 0;
}

.footer-column a {
  color: #666;
  text-decoration: none;
  line-height: 2;
  font-size: 14px;
}

.footer-bottom {
  display: flex;
  flex-direction: column;
  border-top: 1px solid #ddd;
  padding-top: 20px;
  text-align: center;
}

.copyright {
  font-size: 12px;
  margin: 0;
  padding: 0;
  margin-bottom: 15px;
}

.social-links {
  display: flex;
  justify-content: center;
}

.social-links a {
  margin: 0 8px;
  color: #666;
  text-decoration: none;
  font-size: 18px;
}

/* Màn hình trung bình (1/2 màn hình): 2 cột/hàng */
@media screen and (min-width: 768px) {
  .footer-column {
    width: 45%; /* 2 cột/hàng */
  }
  
  .copyright {
    font-size: 13px;
  }
}

/* Màn hình lớn: 4 cột/hàng */
@media screen and (min-width: 992px) {
  .footer-sections {
    justify-content: space-between;
  }
  
  .footer-column {
    width: 22%; /* 4 cột/hàng */
    text-align: left;
  }
  
  .footer-column h4 {
    font-size: 18px;
  }
  
  .footer-column a {
    font-size: 15px;
  }
  
  .copyright {
    font-size: 14px;
  }
  
  .social-links a {
    font-size: 20px;
  }
  
  .footer-bottom {
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    text-align: left;
  }
  
  .copyright {
    margin-bottom: 0;
  }
  
  .social-links {
    justify-content: flex-end;
  }
  
  .social-links a {
    margin-left: 15px;
    margin-right: 0;
  }
}
</style>