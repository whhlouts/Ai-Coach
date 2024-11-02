<template>
  <view class="container">
    <!-- 二维码展示区域 -->
    <view class="qrcode-container">
      <text style="font-weight: bold; margin-bottom: 20rpx;">扫描下方二维码添加好友</text>
      <image :src="qrCodeUrl" class="qrcode-image"></image>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      qrCodeUrl: '', // 二维码图片的 URL
    };
  },
  onLoad() {
    this.qrCodeUrl = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=MyQRCodeData';
  },
  methods: {
    goBack() {
      uni.navigateBack(); // 手动返回上一页
    }
  }
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  justify-content: center; /* 垂直居中 */
  align-items: center; /* 水平居中 */
  height: 100vh; /* 占满整个视口高度 */
  background-color: #f5f5f5;
}

.qrcode-container {
  display: flex;
  flex-direction: column;
  justify-content: center; /* 垂直居中 */
  align-items: center; /* 水平居中 */
  padding: 20rpx;
}

.qrcode-image {
  width: 300rpx;
  height: 300rpx;
  margin-top: 20rpx;
}
</style>
