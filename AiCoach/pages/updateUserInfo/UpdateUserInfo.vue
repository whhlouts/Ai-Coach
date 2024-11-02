<template>
  <view class="container">
    <uni-nav-bar left-width="400rpx" right-width="400rpx" class="nav" height="50px" status-bar="true" fixed="true">
      <template #left>
        <text @click="goBack" style="color: #fff;">返回</text>
      </template>
      <template #title>
        <text style="color: #fff;">修改资料</text>
      </template>
    </uni-nav-bar>

    <scroll-view scroll-y="true" class="scroll-view">
      <view class="form-item">
        <text class="label">用户名</text>
        <input v-model="userInfo.name" placeholder="请输入用户名" class="input" />
      </view>
      <view class="form-item">
        <text class="label">关注</text>
        <input v-model="userInfo.focus" placeholder="请输入关注人数" class="input" />
      </view>
      <view class="form-item">
        <text class="label">粉丝</text>
        <input v-model="userInfo.fan" placeholder="请输入粉丝人数" class="input" />
      </view>
      <view class="form-item">
        <text class="label">体重</text>
        <input v-model="userInfo.weight" placeholder="请输入体重" class="input" />
      </view>
      <view class="form-item">
        <text class="label">IP属地</text>
        <input v-model="userInfo.IP" placeholder="请输入IP属地" class="input" />
      </view>
      <view class="form-item">
        <text class="label">加入时间</text>
        <input v-model="userInfo.joinTime" placeholder="请输入加入时间" class="input" />
      </view>
      <button @click="saveChanges" class="save-button">保存</button>
    </scroll-view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      userInfo: {
        name: 'AICoach体验官',
        focus: 0,
        fan: 0,
        weight: 74.7,
        IP: '重庆',
        joinTime: '2024.10.11',
      },
    };
  },
  onLoad(options) {
    // 从 URL 参数获取数据
    if (options.userInfo) {
      this.userInfo = JSON.parse(decodeURIComponent(options.userInfo));
    }
  },
  methods: {
    goBack() {
      uni.navigateBack();
    },
    saveChanges() {
      // 返回上一页面时传递更新后的用户信息
      uni.navigateBack({
        delta: 1,
        success: () => {
          const pages = getCurrentPages();
          const prevPage = pages[pages.length - 2]; // 获取上一个页面
          if (prevPage) {
            prevPage.userInfo = this.userInfo; // 更新上一个页面的 userInfo
          }
        }
      });

      uni.showToast({
        title: '修改成功',
        icon: 'success',
      });
    },
  },
};
</script>

<style lang="scss">
.container {
  background-color: #f5f5f5;
  height: 100vh;
}

.scroll-view {
  padding: 20rpx;
}

.form-item {
  margin-bottom: 20rpx;
  background-color: #fff;
  border-radius: 8px;
  padding: 10rpx;
}

.label {
  display: block;
  margin-bottom: 5rpx;
  font-weight: bold;
}

.input {
  width: 100%;
  padding: 10rpx;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.save-button {
  width: 100%;
  padding: 15rpx;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
}
</style>
