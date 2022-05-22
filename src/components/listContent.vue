<template>
  <div class="content-wrap">
    <img :src="require(`@/assets/images/stretch_sample/stretching_${contentInfo.category}.png`)" alt="sample img" />
    <div class="caption-wrap">
      <img
        :src="require(`../assets/images/bookmark-${bookmarkChecked}.png`)"
        alt="bookmark-on"
        v-on:click="bookmarkOnOff"
      />
      <div>
        <h1>[{{ contentInfo.category }}] {{ contentInfo.title }}</h1>
        <p>00 : 00 : 00</p>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/listContent.scss';
</style>
<script>
import axios from 'axios';
export default {
  data() {
    return {
      bookmarkChecked: 'off',
      userID: undefined,
    };
  },
  props: {
    category: {
      type: String,
      default: 'eye',
    },
    contentInfo: {
      type: Object,
      default: () => {
        return {
          category: 'eye',
          id: '0',
          title: 'SAMPLE TITLE',
        };
      },
    },
  },
  created() {
    this.getUserID();
  },
  methods: {
    bookmarkOnOff() {
      if (this.bookmarkChecked == 'off') {
        this.bookmarkChecked = 'on';

        axios({
          method: 'post',
          url: 'http://127.0.0.1:3000/bookmark/add',
          data: {
            userId: this.userID,
            stretchContentId: this.contentInfo.id,
          },
        }).then((res) => {
          if (res.data.results != null) {
            let result = res.data.results;
            console.log(result);
          } else {
            console.log(res.data);
          }
        });
      } else {
        this.bookmarkChecked = 'off';

        axios({
          method: 'post',
          url: 'http://127.0.0.1:3000/bookmark/delete',
          data: {
            userId: this.userID,
            stretchContentId: this.contentInfo.id,
          },
        }).then((res) => {
          if (res.data.results != null) {
            let result = res.data.results;
            console.log(result);
          } else {
            console.log(res.data);
          }
        });
      }
    },
    getUserID() {
      axios.get('http://127.0.0.1:3000/user/info').then((res) => {
        if (res.data != null) {
          const loginData = res.data.results;
          this.userID = loginData.id;
          // console.log(this.userID);
        }
      });
    },
  },
};
</script>
