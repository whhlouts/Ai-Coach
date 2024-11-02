<template>
  <view class="ai-assistant">
    <text class="ai-text" @click="handleAiClick">与AI助手对话</text>
  </view>
</template>

<script>
export default {
  methods: {
    handleAiClick() {
      uni.navigateTo({
        url: '/pages/ChatPage/ChatPage' // 路径需与实际路径一致
      });
    }
  }
}
</script>

<style>
.ai-assistant {
  padding: 20rpx;
  cursor: pointer;
}

.ai-text {
  font-size: 16rpx;
  color: #007AFF;
}
</style>
