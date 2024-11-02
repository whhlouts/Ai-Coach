<template>
  <view class="container">
    <!-- Calendar -->
    <view class="calendar">
      <view class="week-days">
        <text v-for="day in ['日', '一', '二', '三', '四', '五', '六']" :key="day" class="week-day">{{ day }}</text>
      </view>
      <view class="dates">
        <view v-for="(date, index) in calendarDates" :key="index" class="date-item" @click="handleDateClick(date)">
          <view :class="{ 'current-date': date.current }">
            {{ date.day }}
          </view>
        </view>
      </view>
    </view>

    <!-- AI Assistant -->
    <view class="ai-assistant">
      <view class="ai-icon">
        <image src="/static/static/AIchat.png" mode="aspectFit"></image>
      </view>
      <view class="ai-text" @click="handleAiClick">
        <text>AI助手</text>
      </view>
    </view>

    <!-- Workout Plan -->
    <view class="workout-plan">
      <text class="section-title">自选日程</text>
      <view v-for="(plan, index) in workoutPlans" :key="index" class="plan-item">
        <view class="plan-indicator"></view>
        <view class="plan-details">
          <text class="plan-title">{{ plan.title }}</text>
          <text class="plan-description">{{ plan.description }}</text>
        </view>
      </view>
    </view>

    <!-- Workout Recommendation -->
    <view class="workout-recommendation">
      <text class="section-title">根据你的运动偏好推荐</text>
      <view class="recommendation-item">
        <text class="recommendation-title">瘦子增肌 · 下半身塑形</text>
        <text class="recommendation-description">锻炼细腿肌肉，打造完美体型！</text>
      </view>
    </view>


    <view class="add-button" @click="handleAddClick">
      <text>+</text>
    </view>


    <view class="bottom-nav">
      <view class="nav-item active">
        <image src="/static/icon-plan.png" mode="aspectFit"></image>
      </view>
      <view class="nav-item">
        <image src="/static/icon-ai.png" mode="aspectFit"></image>
      </view>
      <view class="nav-item">
        <image src="/static/icon-stats.png" mode="aspectFit"></image>
      </view>
      <view class="nav-item">
        <image src="/static/icon-profile.png" mode="aspectFit"></image>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      calendarDates: this.generateCalendarDates(),
      workoutPlans: [
        { title: '自重训练 · 上肢力量', description: '训练 10分钟 · 消耗能量 100千卡' },
        { title: 'HIIT训练 · 全身燃脂', description: '训练 20分钟 · 消耗能量 200千卡' },
      ]
    }
  },
  onLoad(options) {
    // 检查是否有传递的计划信息
    if (options.title && options.description) {
      const newPlan = {
        title: decodeURIComponent(options.title),
        description: decodeURIComponent(options.description)
      };
      // 将新计划添加到自选日程中
      this.workoutPlans.push(newPlan);
    }
  },
  methods: {
    generateCalendarDates() {
      const dates = [];
      const today = new Date();
      const currentMonth = today.getMonth();
      const currentDate = today.getDate();

      // 生成本月的日期
      const daysInMonth = new Date(today.getFullYear(), currentMonth + 1, 0).getDate();
      for (let i = 1; i <= daysInMonth; i++) {
        dates.push({
          day: i,
          current: i === currentDate
        });
      }
      return dates;
    },
    handleAddClick() {
      uni.navigateTo({
        url: '/pages/add-plan/add-plan'
      });
    },
    handleDateClick(date) {
      uni.showToast({
        title: `选择日期: ${date.day}`,
        icon: 'none'
      });
    },
    handleAiClick() {
      // 跳转到 ChatGPT 对话界面
      uni.navigateTo({
        url: '/pages/ChatPage/ChatPage' 
      });
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

.calendar {
  background-color: #ffffff;
  border-radius: 20rpx;
  padding: 20rpx;
  margin-bottom: 30rpx;
}

.week-days {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20rpx;
}

.week-day {
  color: #999;
  font-size: 28rpx;
}

.dates {
  display: flex;
  flex-wrap: wrap;
}

.date-item {
  width: 14.28%;
  height: 80rpx;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer; /* 增加光标效果 */
}

.current-date {
  background-color: #4a90e2;
  color: #ffffff;
  width: 60rpx;
  height: 60rpx;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10rpx;
}

.ai-assistant {
  background-color: #ffffff;
  border-radius: 20rpx;
  padding: 20rpx;
  margin-bottom: 30rpx;
  display: flex;
  align-items: center;
}

.ai-icon {
  width: 80rpx;
  height: 80rpx;
  margin-right: 20rpx;
}

.ai-icon image {
  width: 100%;
  height: 100%;
}

.ai-text {
  font-size: 28rpx;
}

.workout-plan, .workout-recommendation {
  background-color: #ffffff;
  border-radius: 20rpx;
  padding: 20rpx;
  margin-bottom: 30rpx;
}

.section-title {
  font-size: 32rpx;
  font-weight: bold;
  margin-bottom: 20rpx;
}

.plan-item {
  display: flex;
  align-items: center;
}

.plan-indicator {
  width: 8rpx;
  height: 60rpx;
  background-color: #4caf50;
  margin-right: 20rpx;
  border-radius: 4rpx;
}

.plan-title, .recommendation-title {
  font-size: 28rpx;
  font-weight: bold;
}

.plan-description, .recommendation-description {
  font-size: 24rpx;
  color: #999;
  margin-top: 10rpx;
}

.add-button {
  position: fixed;
  right: 40rpx;
  bottom: 140rpx;
  width: 100rpx;
  height: 100rpx;
  background-color: #4a90e2;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #ffffff;
  font-size: 60rpx;
  box-shadow: 0 4rpx 10rpx rgba(0, 0, 0, 0.2);
}

.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100rpx;
  background-color: #ffffff;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border-top: 1rpx solid #e0e0e0;
}

.nav-item {
  width: 50rpx;
  height: 50rpx;
}

.nav-item image {
  width: 100%;
  height: 100%;
}

.nav-item.active image {
  tint-color: #4a90e2;
}
</style>
