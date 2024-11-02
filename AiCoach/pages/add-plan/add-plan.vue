<template>
  <view class="container">
    <view class="input-group">
      <text>计划标题：</text>
      <input v-model="title" placeholder="请输入计划标题" />
    </view>
    <view class="input-group">
      <text>计划描述：</text>
      <input v-model="description" placeholder="请输入计划描述" />
    </view>
    <button @click="addPlan">添加计划</button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: '',
      description: ''
    }
  },
  methods: {
    addPlan() {
      if (this.title && this.description) {
        uni.navigateBack({
          delta: 1,
          success: (res) => {
            // 通过页面栈传递数据
            const pages = getCurrentPages();
            const prevPage = pages[pages.length - 2]; // 获取上一个页面
            prevPage.workoutPlans.push({
              title: this.title,
              description: this.description
            });
          }
        });
      } else {
        uni.showToast({
          title: '请填写完整的计划信息',
          icon: 'none'
        });
      }
    }
  }
}
</script>

<style>
.container {
  padding: 30rpx;
  background-color: #f8f8f8;
  min-height: 100vh;
}
.input-group {
  margin-bottom: 20rpx;
}
</style>
