<template>
  <view class="container">
    <text class="title">动作测评</text>
    
    <view class="button-container">
      <view class="button green" @click="startPushups">
        <text class="button-title">开始俯卧撑</text>
        <text class="button-subtitle">点击前往俯卧撑首页</text>
      </view>
      <view class="button blue" @click="startSquats">
        <text class="button-title">开始深蹲</text>
        <text class="button-subtitle">点击前往深蹲首页</text>
      </view>
    </view>
    
    <view class="report-section">
      <text class="section-title">运动报告</text>
      <view class="report-item">
        <text>最近锻炼次数: {{ totalWorkouts }}</text>
      </view>
      <view class="report-item">
        <text>总锻炼时间: {{ totalWorkoutTime }} 分钟</text>
      </view>
      <view class="report-item">
        <text>消耗卡路里: {{ totalCaloriesBurned }} 卡路里</text>
      </view>
    </view>
    
    <view class="report-section">
      <text class="section-title">运动成就</text>
      <view v-for="(achievement, index) in achievements" :key="index" class="achievement-item">
        <text :style="{ color: achievement.achieved ? '#4CAF50' : '#FF0000' }">
          {{ achievement.title }} {{ achievement.achieved ? '✅' : '❌' }}
        </text>
      </view>
    </view>
    
    <view class="report-section">
      <text class="section-title">健康报告</text>
      <view class="report-item">
        <text>当前体重: {{ currentWeight }} kg</text>
      </view>
      <view class="report-item">
        <text>BMI: {{ bmi }}</text>
      </view>
      <view class="report-item">
        <text>心率: {{ heartRate }} bpm</text>
      </view>
      <view class="report-item">
        <text>水分摄入: {{ waterIntake }} L</text>
      </view>
      <view class="report-item">
        <text>健康建议: {{ healthAdvice }}</text>
      </view>
    </view>
    
    <view class="tab-bar">
      <view class="tab-item">
        <image src="/static/icons/clipboard.png" mode="aspectFit" class="tab-icon"></image>
      </view>
      <view class="tab-item">
        <image src="/static/icons/ai.png" mode="aspectFit" class="tab-icon"></image>
      </view>
      <view class="tab-item">
        <image src="/static/icons/planet.png" mode="aspectFit" class="tab-icon"></image>
      </view>
      <view class="tab-item">
        <image src="/static/icons/user.png" mode="aspectFit" class="tab-icon"></image>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      totalWorkouts: 0,
      totalCaloriesBurned: 0,
      totalWorkoutTime: 0,
      currentWeight: 74.7,
      bmi: 22.5,
      heartRate: 75,
      waterIntake: 2,
      healthAdvice: '多喝水，保持适量锻炼。',
      achievements: [
        { title: '完成100个俯卧撑', achieved: false },
        { title: '连续锻炼7天', achieved: false },
        { title: '消耗超过500卡路里', achieved: false },
        { title: '锻炼时长超过10小时', achieved: false },
      ],
    };
  },
  methods: {
    startPushups() {
      this.totalWorkouts+=20; //假设每次俯卧撑运动为20次
      this.totalCaloriesBurned += 200; // 假设每次俯卧撑运动消耗200卡路里
      this.totalWorkoutTime += 30; // 假设每次锻炼30分钟
      this.checkAchievements();
      uni.navigateTo({
        url: '/pages/pushups/index'
      });
    },
    startSquats() {
      this.totalWorkouts+=20; //假设每次深蹲运动为20次
      this.totalCaloriesBurned += 200; // 假设每次深蹲运动消耗200卡路里
      this.totalWorkoutTime += 30; // 假设每次锻炼30分钟
      this.checkAchievements();
      uni.navigateTo({
        url: '/pages/squats/index'
      });
    },
    checkAchievements() {
      if (this.totalWorkouts >= 100) {
        this.achievements[0].achieved = true; // 完成100个俯卧撑
      }
      if (this.totalWorkoutTime >= 1400) {
        this.achievements[1].achieved = true; // 连续锻炼7天
      }
      if (this.totalCaloriesBurned >= 500) {
        this.achievements[2].achieved = true; // 消耗超过500卡路里
      }
      if (this.totalWorkoutTime >= 600) { // 600分钟 = 10小时
        this.achievements[3].achieved = true; // 锻炼时长超过10小时
      }
    }
  }
}
</script>

<style>
.container {
  padding: 40upx;
  font-family: 'SimSun', 'STSong', sans-serif;
}

.title {
  font-size: 48upx;
  font-weight: bold;
  margin-bottom: 40upx;
}

.button-container {
  display: flex;
  justify-content: space-between;
  margin-bottom: 40upx;
}

.button {
  width: 48%;
  padding: 30upx;
  border-radius: 20upx;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.green {
  background-color: #4CAF50;
}

.blue {
  background-color: #2196F3;
}

.button-title {
  color: #ffffff;
  font-size: 36upx;
  font-weight: bold;
  margin-bottom: 10upx;
}

.button-subtitle {
  color: #ffffff;
  font-size: 24upx;
}

.report-section {
  background-color: #f0f0f0;
  padding: 30upx;
  margin-bottom: 40upx;
  border-radius: 20upx;
}

.section-title {
  font-size: 36upx;
  font-weight: bold;
  margin-bottom: 20upx;
}

.report-item {
  margin-bottom: 10upx;
  font-size: 28upx;
}

.achievement-item {
  margin-bottom: 10upx;
  font-size: 28upx;
}

.tab-bar {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100upx;
  background-color: #ffffff;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border-top: 1upx solid #e0e0e0;
}

.tab-icon {
  width: 48upx;
  height: 48upx;
}
</style>
