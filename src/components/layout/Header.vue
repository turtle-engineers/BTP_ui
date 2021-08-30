<template>
<div>
  <b-navbar type="dark" variant="dark">
    <b-navbar-brand href="/">BTP</b-navbar-brand>
    <b-navbar-nav>
      <b-nav-item href="/myroutine">My Routine</b-nav-item>

      <!-- Navbar dropdowns -->
      <b-nav-item-dropdown text="???" right>
        <b-dropdown-item href="/randomChallenge">랜덤 챌린지</b-dropdown-item>
        <b-dropdown-item href="/myturtle">거북이 키우기</b-dropdown-item>
        <b-dropdown-item href="/stretchingGuide">스트레칭 가이드</b-dropdown-item>
      </b-nav-item-dropdown>

      <b-nav-item-dropdown text="User" right>
        <b-dropdown-item href="/account">Account</b-dropdown-item>
        <b-dropdown-item href="/settings">Settings</b-dropdown-item>
        <b-dropdown-item href="/missionList">Mission List</b-dropdown-item>
      </b-nav-item-dropdown>
      
      <b-nav-item-dropdown text="About Us" right>
        <b-dropdown-item href="/about">프로젝트 소개</b-dropdown-item>
        <b-dropdown-item href="/story">브랜드 스토리</b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>
  </b-navbar>
</div>
</template>
<script>
export default {
    name: "header",
};
</script>