<template>
  <view class="container">
    <video
      src="../../static/static/video/do.mp4"
      autoplay
      loop
      muted
      class="background-video"
    ></video>
    <view class="login-container">
      <view class="form-item">
        <input type="text" placeholder="请输入账号" v-model="account" />
      </view>
      <view class="form-item">
        <input type="password" placeholder="请输入密码" v-model="password" />
      </view>
      <button class="login-button" @click="login">登录</button>
      <view class="link" @click="goToRegister">还没有账号？点击注册</view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      account: '',
      password: ''
    };
  },
  methods: {
    login() {
      uni.request({
        url: "http://localhost:8080/users/login",
        method: 'POST',
        data: {
          account: this.account,
          password: this.password
        },
        success: (res) => {
          if (res.statusCode === 200) {
            uni.showToast({
              title: '登录成功',
              icon: 'success'
            });
            uni.setStorageSync('userInfo', res.data);
            uni.switchTab({
              url: '/pages/plan/plan'
            });
          } else {
            uni.showToast({
              title: res.data.message || '登录失败',
              icon: 'none'
            });
          }
        },
        fail: (err) => {
          uni.showToast({
            title: '请求失败，请稍后再试',
            icon: 'none'
          });
        }
      });
    },
    goToRegister() {
      uni.navigateTo({
        url: '/pages/register/register'
      });
    }
  }
};
</script>

<style scoped>
.container {
  position: relative;
  width: 100%;
  height: 100vh; /* 设为全屏 */
  overflow: hidden;
}

.background-video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover; /* 保持视频的纵横比 */
  z-index: -1; /* 确保视频在背景 */
  pointer-events: none; /* 确保视频不接收任何鼠标事件 */
}

.login-container {
  position: absolute; /* 使用绝对定位 */
  top: 50%; /* 垂直居中 */
  left: 50%; /* 水平居中 */
  transform: translate(-50%, -50%); /* 通过变换居中对齐 */
  padding: 20px;
  z-index: 1; /* 确保登录表单在视频前面 */
  color: white; /* 文字颜色 */
  background: rgba(0, 0, 0, 0.7); /* 为登录表单添加半透明背景 */
  border-radius: 8px; /* 圆角边框 */
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5); /* 添加阴影效果 */
  pointer-events: auto; /* 确保容器可以接收事件 */
}

.form-item {
  margin-bottom: 15px;
  width: 80%; /* 设置输入框的宽度 */
}

input {
  width: 100%; /* 确保输入框填满 */
  padding: 10px;
  border: none;
  border-radius: 4px; /* 圆角边框 */
  background: rgba(255, 255, 255, 0.2); /* 半透明背景 */
  color: white; /* 输入文本颜色 */
}

input::placeholder {
  color: rgba(255, 255, 255, 0.7); /* 占位符颜色 */
}

.login-button {
  width: 80%; /* 按钮宽度 */
  padding: 10px;
  border: none;
  border-radius: 4px;
  background-color: #007AFF; /* 按钮颜色 */
  color: white; /* 按钮文字颜色 */
  cursor: pointer; /* 鼠标样式 */
}

.login-button:hover {
  background-color: #0056b3; /* 悬停效果 */
}

.link {
  margin-top: 10px;
  color: #007AFF;
  text-align: center;
}
</style>
