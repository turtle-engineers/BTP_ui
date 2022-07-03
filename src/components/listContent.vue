<template>
  <div class="content-wrap">
    <button @click="emitStretchData">
      <img
        :src="
          require(`@/assets/images/stretch_sample/stretching_${contentInfo.category}.png`)
        "
        alt="sample img"
      />
    </button>
    <div class="caption-wrap">
      <img
        :src="require(`@/assets/images/bookmark-${bookmarkChecked}.png`)"
        alt="bookmark-on"
        v-on:click="bookmarkOnOff"
      />
      <div>
        <button @click="emitStretchData">
          <h1>[{{ contentInfo.category }}] {{ contentInfo.title }}</h1>
        </button>
        <p>00 : 00 : {{ contentInfo.playTime }}</p>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/listContent.scss";
</style>
<script>
import axios from "axios";
export default {
  data() {
    return {
      bookmarkChecked: "off",
      userID: undefined,
    };
  },
  props: {
    category: {
      type: String,
      default: "eye",
    },
    contentInfo: {
      type: Object,
      default: () => {
        return {
          category: 'eye',
          id: '0',
          title: 'SAMPLE TITLE',
          playTime: '00:00:00',
        };
      },
    },
  },
  created() {
    this.getUserID();
  },
  methods: {
    emitStretchData() {
      this.$emit("stretchData", this.contentInfo);
    },
    bookmarkOnOff() {
      if (this.bookmarkChecked == "off") {
        this.bookmarkChecked = "on";

        axios({
          method: "post",
          url: "http://127.0.0.1:3000/bookmark/add",
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
        this.bookmarkChecked = "off";

        axios({
          method: "post",
          url: "http://127.0.0.1:3000/bookmark/delete",
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
      axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.data != null) {
          const loginData = res.data.results;
          this.userID = loginData.id;
          // console.log(this.userID);
          this.getBookmark();
        }
      });
    },
    getBookmark() {
      axios({
        method: "get",
        url: "http://127.0.0.1:3000/bookmark/list",
        params: { uid: this.userID },
      }).then((res) => {
        if (res.data.results != null) {
          let result = res.data.results;
          // console.log(result);
          const bookmarkIdList = [];
          result.forEach((element) => {
            bookmarkIdList.push(element.StretchContentId);
          });
          this.markBookmark(bookmarkIdList);
        } else {
          console.log(res.data);
        }
      });
    },
    markBookmark(bookmarkIdList) {
      if (bookmarkIdList.includes(this.contentInfo.id)) {
        this.bookmarkChecked = "on";
      }
    },
  },
};
</script>
