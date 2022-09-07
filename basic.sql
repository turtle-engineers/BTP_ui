-- 스트레칭 카테고리 데이터
INSERT INTO `stretch_category` (`id`, `title`, `valid`, `created_at`, `updated_at`) VALUES ('1', '눈', '1', NOW(),NOW());
INSERT INTO `stretch_category` (`id`, `title`, `valid`, `created_at`, `updated_at`) VALUES ('2', '목', '1', NOW(),NOW());
INSERT INTO `stretch_category` (`id`, `title`, `valid`, `created_at`, `updated_at`) VALUES ('3', '어께', '1', NOW(),NOW());
INSERT INTO `stretch_category` (`id`, `title`, `valid`, `created_at`, `updated_at`) VALUES ('4', '손목', '1', NOW(),NOW());

-- 스트레칭 컨텐츠 데이터
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('1', '스트레칭 이름1', '1', '20', '스트레칭 설명1', NOW(),NOW(),'1','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('2', '스트레칭 이름2', '1', '20', '스트레칭 설명2', NOW(),NOW(),'1','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('3', '스트레칭 이름3', '1', '30', '스트레칭 설명3', NOW(),NOW(),'1','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('4', '스트레칭 이름4', '1', '30', '스트레칭 설명4', NOW(),NOW(),'1','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('5', '스트레칭 이름5', '1', '20', '스트레칭 설명5', NOW(),NOW(),'2','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('6', '스트레칭 이름6', '1', '20', '스트레칭 설명6', NOW(),NOW(),'2','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`,`image_url`) VALUES ('7', '스트레칭 이름7', '1', '10', '스트레칭 설명7', NOW(),NOW(),'2','http://localhost:3000/stretchingfiles/sholder.svg');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('8', '스트레칭 이름8', '1', '10', '스트레칭 설명8', NOW(),NOW(),'2');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('9', '스트레칭 이름9', '1', '20', '스트레칭 설명9', NOW(),NOW(),'3');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('10', '스트레칭 이름10', '1', '20', '스트레칭 설명10', NOW(),NOW(),'3');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('11', '스트레칭 이름11', '1', '30', '스트레칭 설명11', NOW(),NOW(),'3');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('12', '스트레칭 이름12', '1', '30', '스트레칭 설명12', NOW(),NOW(),'3');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('13', '스트레칭 이름13', '1', '20', '스트레칭 설명13', NOW(),NOW(),'4');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('14', '스트레칭 이름14', '1', '20', '스트레칭 설명14', NOW(),NOW(),'4');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('15', '스트레칭 이름15', '1', '10', '스트레칭 설명15', NOW(),NOW(),'4');
INSERT INTO `stretch_contents` (`id`, `title`, `valid`, `play_time`, `description`, `created_at`, `updated_at`, `stretch_category_id`) VALUES ('16', '스트레칭 이름16', '1', '10', '스트레칭 설명16', NOW(),NOW(),'4');

-- 마이루틴 데이터
INSERT INTO `my_routine` (`id`, `repeat_count`, `contents_order`, `created_at`, `updated_at`, `user_id`, `stretch_content_id`) VALUES ('1', '1', '1', NOW(), NOW(), '1', '1');
INSERT INTO `my_routine` (`id`, `repeat_count`, `contents_order`, `created_at`, `updated_at`, `user_id`, `stretch_content_id`) VALUES ('2', '2', '3', NOW(), NOW(), '1', '2');
INSERT INTO `my_routine` (`id`, `repeat_count`, `contents_order`, `created_at`, `updated_at`, `user_id`, `stretch_content_id`) VALUES ('3', '1', '4', NOW(), NOW(), '1', '3');
INSERT INTO `my_routine` (`id`, `repeat_count`, `contents_order`, `created_at`, `updated_at`, `user_id`, `stretch_content_id`) VALUES ('4', '3', '2', NOW(), NOW(), '1', '4');
INSERT INTO `my_routine` (`id`, `repeat_count`, `contents_order`, `created_at`, `updated_at`, `user_id`, `stretch_content_id`) VALUES ('5', '1', '5', NOW(), NOW(), '1', '5');
INSERT INTO `my_routine` (`id`, `repeat_count`, `contents_order`, `created_at`, `updated_at`, `user_id`, `stretch_content_id`) VALUES ('6', '1', '6', NOW(), NOW(), '1', '6');
