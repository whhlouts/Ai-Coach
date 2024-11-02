<template>
  <view class="container">


    <scroll-view scroll-y="true" class="scroll-view-y">
      <uni-card>
        <view class="card-container1" style="display: flex;height: 100rpx;width: 100%; margin-left: 0;">
          <view style="width: 240rpx; height: 400rpx;">
            <image class="profile-image" src="../../static/static/default_avatar.png"></image>
            <br><text style="font-weight: bold;width: 200rpx;">{{ userInfo.name }}</text>
          </view>
          <view style="">
            <text style="margin-left: 60rpx; font-weight: bold;">
              关注&emsp;&emsp;粉丝&emsp;&emsp;<br>
              &emsp;&emsp;&emsp;&ensp;{{ userInfo.focus }}&emsp;&emsp;&emsp;&ensp;{{ userInfo.fan }}&emsp;&emsp;&emsp;&ensp;{{ userInfo.like }}
            </text>
          </view>
        </view>

        <view style="margin-top: 20rpx;">
          <text style="color: lightgray;">{{ userInfo.joinTime }}加入AICoach&ensp;|&ensp;IP属地：{{ userInfo.IP }}</text>
        </view>

        <view class="card-container2" style="align-items: center; display: flex; margin-top: 30rpx; margin-bottom: 50rpx;">
          <button @click="goToModifyProfile" class="changeInfo" size="mini" style="width: 200rpx;background-color:lavender;border-radius: 15px;border: none;margin: 0;">
            <text style="font-size:12px">修改资料</text>
          </button>
          <button class="my2Dcode" size="mini" style="width: 200rpx;background-color:lavender;border-radius: 15px;border: none;" @click="goToQrCodePage">
            <text>我的二维码</text>
          </button>
        </view>

        <view style="display: flex; margin: 0; height: 300rpx;">
          <button style="margin: 0; width: 300rpx; height: 100%; background-color: transparent; border: none;">
            <view style="display: flex;">
              <image src="/static/static/ligntning.png" style="width: 30rpx; height: 30rpx; margin-top: 20rpx;"></image>
              <text style="font-size: 14px; color: rebeccapurple; margin-top: 5rpx; margin-left: 8rpx;">
                总运动</text>
              <uni-icons type="right" style="color: lightgrey; margin-left: 90rpx; margin-top: 5rpx;"></uni-icons>
            </view>
            <text style="font-weight: bold; font-size: 24px; margin-right: 5rpx;">{{ userInfo.sportsTime }}</text>
            <text style="font-size: 12px; margin-right: 80rpx">分钟</text>
            <text style="font-size: 10px; color: darkgrey; margin-right: 70rpx;">
              本周消耗{{ userInfo.consume }}千卡</text>
          </button>

          <button @click="goTobodyData" style="margin: 0; width: 300rpx; height: 100%; background-color: transparent; border: none;">
            <image src="/static/static/ligntning.png" style="width: 30rpx; height: 30rpx;"></image>
            <text style="font-size: 14px; color: limegreen;">
              体重</text>
            <uni-icons type="right" style="color: lightgrey; margin-left: 90rpx;"></uni-icons>
            <br><text style="font-weight: bold; font-size: 24px; margin-right: 5rpx;">{{ userInfo.weight }}</text>
            <text style="font-size: 12px; margin-right: 80rpx">千克</text>
            <text style="font-size: 10px; color: darkgrey; margin-right: 70rpx;">
              上次记录{{ userInfo.record }}天前</text>
          </button>
        </view>


      </uni-card>
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
        sportsTime: 10,
        consume: 100,
        record: 39,
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
    goToModifyProfile() {
      const userInfoStr = encodeURIComponent(JSON.stringify(this.userInfo));
      uni.navigateTo({
        url: '/pages/updateUserInfo/UpdateUserInfo?userInfo=' + userInfoStr,
      });
    },
    goTobodyData() {
      uni.navigateTo({
        url: '/pages/profile/bodyData'
      });
    },
    goToQrCodePage() {
      uni.navigateTo({
        url: '/pages/profile/QrCodePage',  // 假设你的二维码页面路径为 /pages/qrCode/QrCodePage
      });
    }
  }

};
</script>

<style lang="scss">


.profile-image {
  width: 60rpx;
  height: 60rpx;
  object-fit: cover;
  margin-left: 50rpx;
}
</style>
