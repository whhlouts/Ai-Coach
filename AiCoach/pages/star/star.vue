<template>
  <view class="container">
    <text class="title">社区动态</text>

    <!-- 新增发帖区域 -->
    <view class="new-post">
      <textarea v-model="newPostContent" placeholder="分享你的想法..."></textarea>
      <button class="submit-button" @click="submitPost">发布</button>
    </view>

    <!-- 社区动态列表 -->
    <view class="post-list">
      <view class="post-item" v-for="(post, index) in posts" :key="index">
        <view class="post-header">
          <image :src="post.avatar" class="post-avatar" />
          <view class="post-info">
            <text class="post-author">{{ post.author }}</text>
            <text class="post-time">{{ post.time }}</text>
          </view>
        </view>
        <view class="post-content">{{ post.content }}</view>
        <view class="post-actions">
          <button class="like-button" @click="likePost(index)">👍 {{ post.likes }}</button>
          <button class="comment-button" @click="post.showComments = !post.showComments">💬 评论</button>
        </view>

        <!-- 评论区 -->
        <view v-if="post.showComments" class="comments-section">
          <view class="comment" v-for="(comment, commentIndex) in post.comments" :key="commentIndex">
            <text class="comment-author">{{ comment.author }}:</text>
            <text class="comment-content">{{ comment.content }}</text>
          </view>
          <view class="new-comment">
            <input v-model="post.newComment" placeholder="写下你的评论..." class="comment-input" />
            <button class="submit-comment" @click="submitComment(index)">发布</button>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      posts: [
        {
          author: '用户1',
          avatar: 'https://via.placeholder.com/40',
          content: '刚完成了一次精彩的晨跑！',
          time: '1小时前',
          likes: 12,
          comments: [],
          showComments: false,
          newComment: '',
        },
        {
          author: '用户2',
          avatar: 'https://via.placeholder.com/40',
          content: '今天的饮食计划很健康！',
          time: '2小时前',
          likes: 5,
          comments: [],
          showComments: false,
          newComment: '',
        },
      ],
      newPostContent: '',
    };
  },
  methods: {
    likePost(index) {
      this.posts[index].likes += 1;
    },
    submitPost() {
      if (this.newPostContent.trim() !== '') {
        this.posts.unshift({
          author: '我',
          avatar: 'https://via.placeholder.com/40',
          content: this.newPostContent,
          time: '刚刚',
          likes: 0,
          comments: [],
          showComments: false,
          newComment: '',
        });
        this.newPostContent = ''; // 清空输入框
      } else {
        uni.showToast({
          title: '请输入内容再发布！',
          icon: 'none',
        });
      }
    },
    submitComment(postIndex) {
      const post = this.posts[postIndex];
      if (post.newComment.trim() !== '') {
        post.comments.push({
          author: '我',
          content: post.newComment,
        });
        post.newComment = ''; // 清空评论输入框
      } else {
        uni.showToast({
          title: '请输入评论后再发布！',
          icon: 'none',
        });
      }
    },
  },
};
</script>

<style>
.container {
  padding: 20rpx;
  background-color: #f5f5f5; /* 背景颜色 */
  height: 100vh; /* 填满整个视口 */
}

.title {
  font-size: 36upx;
  font-weight: bold;
  color: #333; /* 标题颜色 */
  margin-bottom: 20upx;
  text-align: center; /* 标题居中 */
}

.new-post {
  background-color: #ffffff; /* 发帖区域背景 */
  padding: 20rpx;
  border-radius: 8rpx;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 阴影效果 */
  margin-bottom: 20upx; /* 与帖子列表的间隔 */
}

textarea {
  width: 100%;
  height: 80upx;
  padding: 10rpx;
  border: 1px solid #ccc; /* 边框颜色 */
  border-radius: 4rpx; /* 圆角 */
  margin-bottom: 10upx; /* 与发布按钮的间隔 */
  resize: none; /* 禁止用户调整大小 */
  font-size: 28upx; /* 字体大小 */
}

textarea::placeholder {
  color: #aaa; /* 占位符颜色 */
}

.submit-button {
  background-color: #4CAF50; /* 提交按钮颜色 */
  color: #ffffff;
  padding: 10rpx;
  border-radius: 4rpx;
  border: none; /* 去掉边框 */
  font-size: 28upx; /* 字体大小 */
  cursor: pointer; /* 鼠标指针样式 */
}

.submit-button:hover {
  background-color: #45a049; /* 鼠标悬停时改变颜色 */
}

.post-list {
  margin-top: 10upx; /* 与发帖区域的间隔 */
}

.post-item {
  background-color: #ffffff; /* 帖子背景 */
  padding: 15rpx;
  margin-bottom: 10upx; /* 帖子间隔 */
  border-radius: 8rpx;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 帖子阴影 */
}

.post-header {
  display: flex;
  align-items: center; /* 垂直居中 */
  margin-bottom: 10rpx; /* 与内容的间隔 */
}

.post-avatar {
  width: 40rpx; /* 头像大小 */
  height: 40rpx; /* 头像大小 */
  border-radius: 20rpx; /* 圆形头像 */
  margin-right: 10rpx; /* 头像与文本的间隔 */
}

.post-info {
  flex: 1; /* 填充剩余空间 */
}

.post-author {
  font-size: 30upx; /* 作者字体大小 */
  font-weight: bold; /* 加粗 */
}

.post-time {
  font-size: 24upx; /* 时间字体大小 */
  color: #888; /* 时间颜色 */
}

.post-content {
  font-size: 28upx; /* 内容字体大小 */
  line-height: 1.5; /* 行间距 */
  margin-bottom: 10rpx; /* 与动作按钮的间隔 */
}

.post-actions {
  display: flex;
  justify-content: space-between; /* 左右对齐 */
}

.like-button,
.comment-button {
  background: none; /* 透明背景 */
  color: #4CAF50; /* 按钮文字颜色 */
  font-size: 26upx; /* 字体大小 */
  cursor: pointer; /* 鼠标指针样式 */
}

.like-button:hover,
.comment-button:hover {
  text-decoration: underline; /* 悬停时添加下划线 */
}

.comments-section {
  margin-top: 10upx; /* 与帖子内容的间隔 */
  padding-left: 10rpx; /* 左侧填充 */
}

.comment {
  font-size: 26upx; /* 评论字体大小 */
  margin-bottom: 5rpx; /* 评论间隔 */
}

.comment-author {
  font-weight: bold; /* 评论作者加粗 */
}

.new-comment {
  display: flex; /* 评论输入框和按钮水平排列 */
  margin-top: 10upx; /* 与已有评论的间隔 */
}

.comment-input {
  flex: 1; /* 填充剩余空间 */
  padding: 10rpx;
  border: 1px solid #ccc; /* 边框颜色 */
  border-radius: 4rpx; /* 圆角 */
}

.submit-comment {
  background-color: #4CAF50; /* 提交按钮颜色 */
  color: #ffffff;
  padding: 10rpx;
  border-radius: 4rpx;
  border: none; /* 去掉边框 */
  font-size: 26upx; /* 字体大小 */
  cursor: pointer; /* 鼠标指针样式 */
}
</style>
