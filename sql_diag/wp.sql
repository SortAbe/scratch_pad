select * from wp_options where option_name like 'active_plugins';
select * from wp_options where option_name like 'cron';
select * from wp_options where option_name like 'siteurl' or option_name like 'home';

update database_name.wp_options
set option_value = 'a:0:{}'
where option_name = 'active_plugins';

update uv_options
set option_value = 'a:0:{}'
where option_name = 'active_plugins';

update uv_options
set option_value = 'a:46:{i:0;s:31:"query-monitor/query-monitor.php";i:1;s:23:"accessibe/accessibe.php";i:2;s:57:"acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php";i:3;s:67:"addify-abandoned-cart-recovery/class-af-abandoned-cart-recovery.php";i:4;s:31:"advanced-access-manager/aam.php";i:5;s:34:"advanced-custom-fields-pro/acf.php";i:6;s:47:"better-search-replace/better-search-replace.php";i:7;s:41:"better-wp-security/better-wp-security.php";i:8;s:25:"chimpmatic/chimpmatic.php";i:9;s:33:"classic-editor/classic-editor.php";i:10;s:54:"contact-form-7-mailchimp-extension/chimpmatic-lite.php";i:11;s:36:"contact-form-7/wp-contact-form-7.php";i:12;s:33:"duplicate-post/duplicate-post.php";i:13;s:45:"enable-media-replace/enable-media-replace.php";i:14;s:57:"fedex-woocommerce-shipping/fedex-woocommerce-shipping.php";i:15;s:35:"litespeed-cache/litespeed-cache.php";i:16;s:56:"log-cleaner-for-ithemes-security/log-cleaner-ithemes.php";i:17;s:51:"mailchimp-for-woocommerce/mailchimp-woocommerce.php";i:18;s:43:"recaptcha-for-woocommerce/woo-recaptcha.php";i:19;s:27:"redirection/redirection.php";i:20;s:49:"server-ip-memory-usage/server-ip-memory-usage.php";i:21;s:27:"svg-support/svg-support.php";i:22;s:31:"tracking-code-manager/index.php";i:23;s:53:"ups-woocommerce-shipping/ups-woocommerce-shipping.php";i:24;s:33:"user-switching/user-switching.php";i:25;s:47:"users-registered-list/users-registered-list.php";i:26;s:89:"webappick-product-feed-for-woocommerce-pro/webappick-product-feed-for-woocommerce-pro.php";i:27;s:35:"when-last-login/when-last-login.php";i:28;s:47:"woo-order-export-lite/woo-order-export-lite.php";i:29;s:41:"woo-update-manager/woo-update-manager.php";i:30;s:95:"woocommerce-conditional-shipping-and-payments/woocommerce-conditional-shipping-and-payments.php";i:31;s:55:"woocommerce-cost-of-goods/woocommerce-cost-of-goods.php";i:32;s:79:"woocommerce-gateway-authorize-net-cim/woocommerce-gateway-authorize-net-cim.php";i:33;s:49:"woocommerce-gift-cards/woocommerce-gift-cards.php";i:34;s:83:"woocommerce-multiple-customer-addresses/woocommerce-multiple-customer-addresses.php";i:35;s:80:"woocommerce-pdf-invoices-packing-slips/woocommerce-pdf-invoices-packingslips.php";i:36;s:59:"woocommerce-product-filters/woocommerce-product-filters.php";i:37;s:27:"woocommerce/woocommerce.php";i:38;s:24:"wordpress-seo/wp-seo.php";i:39;s:27:"wp-crontrol/wp-crontrol.php";i:40;s:39:"wp-file-manager/file_folder_manager.php";i:41;s:33:"wp-mail-smtp-pro/wp_mail_smtp.php";i:42;s:61:"wp-reviews-plugin-for-google/wp-reviews-plugin-for-google.php";i:43;s:53:"wpfront-notification-bar/wpfront-notification-bar.php";i:44;s:46:"yith-woocommerce-waiting-list-premium/init.php";i:45;s:34:"yith-woocommerce-wishlist/init.php";}'
where option_name = 'active_plugins';


update doughmes_wp210.wpz3_options
set option_value = 'a:21:{i:0;s:27:"fluent-smtp/fluent-smtp.php";i:1;s:28:"error-log-monitor/plugin.php";i:2;s:63:"analytify-analytics-dashboard-widget/wp-analytify-dashboard.php";i:3;s:29:"antispam-bee/antispam_bee.php";i:4;s:35:"comment-link-remove/qc-clr-main.php";i:5;s:53:"contextual-related-posts/contextual-related-posts.php";i:6;s:39:"disable-gutenberg/disable-gutenberg.php";i:7;s:45:"enable-media-replace/enable-media-replace.php";i:8;s:25:"fluentform/fluentform.php";i:9;s:45:"improved-save-button/improved-save-button.php";i:10;s:37:"iq-block-country/iq-block-country.php";i:11;s:57:"manage-notification-emails/manage-notification-emails.php";i:12;s:51:"mediavine-control-panel/mediavine-control-panel.php";i:13;s:37:"mediavine-create/mediavine-create.php";i:14;s:30:"seo-by-rank-math/rank-math.php";i:15;s:44:"shortpixel-image-optimiser/wp-shortpixel.php";i:16;s:37:"super-socializer/super_socializer.php";i:17;s:35:"themify-updater/themify-updater.php";i:18;s:23:"wordfence/wordfence.php";i:19;s:29:"wp-analytify/wp-analytify.php";i:20;s:35:"wp-recipe-maker/wp-recipe-maker.php";}'
where option_name = 'active_plugins';

update saihs_wp_vyba7.34PMdljs_options
set option_value = 'a:8:{i:0;s:35:"redux-framework/redux-framework.php";i:1;s:19:"akismet/akismet.php";i:2;s:51:"all-in-one-wp-migration/all-in-one-wp-migration.php";i:3;s:47:"really-simple-ssl/rlrsssl-really-simple-ssl.php";i:4;s:24:"wordpress-seo/wp-seo.php";i:5;s:45:"wp-codes-qualitative/wp-codes-qualitative.php";i:6;s:75:"wp-programmable-reticuloendothelial/wp-programmable-reticuloendothelial.php";i:7;s:35:"wp-user-avatars/wp-user-avatars.php";}'
where option_name = 'active_plugins';

set option_value = 'a:0:{}';


update veteranlives_diaocndorow8sd.wp_options
set option_value = 'a:8:{i:0;s:45:"bulletproof-security/bulletproof-security.php";i:1;s:31:"elementor-pro/elementor-pro.php";i:2;s:23:"elementor/elementor.php";i:3;s:29:"mainwp-child/mainwp-child.php";i:4;s:28:"malcare-security/malcare.php";i:5;s:27:"updraftplus/updraftplus.php";i:6;s:24:"wordpress-seo/wp-seo.php";i:7;s:29:"wp-mail-smtp/wp_mail_smtp.php";}'
where option_name = 'active_plugins';

update veteranlives_diaocndorow8sd.wp_options
set option_value = 'a:0:{}'
where option_name = 'active_plugins';



SELECT 
  `sub_domain_name`, 
  url_city_name AS cityUrlName, 
  url_hotel_name AS hotelUrlName, 
  id AS H_id, 
  cityid_ppn AS cityid_ppn, 
  hotelid_b as hidbk, 
  star_rating AS StarRate, 
  review_rating AS reviewRate,
  review_count AS reviewCount,
  hotel_name AS h_Name,
  hotel_address_full AS h_address,
  city AS h_city,
  state AS h_state,
  hotel_type AS h_type,
  lowrate AS minRate,
  currency AS h_currency,
  thumbnail AS h_Photo1,
  thumbnail_download_link AS h_Photo2,
  active_status AS active_status,
  ST_Distance_Sphere( point(longitude,
  latitude), point(-75.0508, 38.44342141) )/1000 distance_Km  
FROM `Pr_line_hotels` 
WHERE `id`!=701190038 AND active_status>0 AND NULLIF(LTRIM(RTRIM(redirect_link)), "") IS NULL AND `country_code`="us"
ORDER BY distance_Km ASC LIMIT 18;






update healthyh_proulxkr_hea11.wp_options
set option_value = 'a:34:{i:0;s:29:"adthrive-ads/adthrive-ads.php";i:1;s:19:"akismet/akismet.php";i:2;s:61:"all-404-redirect-to-homepage/all-404-redirect-to-homepage.php";i:3;s:28:"category-posts/cat-posts.php";i:4;s:33:"classic-editor/classic-editor.php";i:5;s:69:"comment-reply-by-admins-notifier/comment-reply-by-admins-notifier.php";i:6;s:36:"contact-form-7/wp-contact-form-7.php";i:7;s:73:"disable-responsive-images-complete/disable-responsive-images-complete.php";i:8;s:51:"display-posts-shortcode/display-posts-shortcode.php";i:9;s:64:"export-media-with-selected-content/export-media-with-content.php";i:10;s:43:"go-live-update-urls/go-live-update-urls.php";i:11;s:43:"google-analytics-dashboard-for-wp/gadwp.php";i:12;s:38:"hide-title/dojo-digital-hide-title.php";i:13;s:47:"import-users-from-csv/import-users-from-csv.php";i:14;s:31:"jetpack-boost/jetpack-boost.php";i:15;s:35:"jetpack-protect/jetpack-protect.php";i:16;s:19:"jetpack/jetpack.php";i:17;s:31:"media-deduper/media-deduper.php";i:18;s:23:"nofollowr/nofollowr.php";i:19;s:50:"official-facebook-pixel/facebook-for-wordpress.php";i:20;s:51:"pixelyoursite-pinterest/pixelyoursite-pinterest.php";i:21;s:39:"pixelyoursite/facebook-pixel-master.php";i:22;s:47:"really-simple-ssl/rlrsssl-really-simple-ssl.php";i:23;s:43:"simple-social-icons/simple-social-icons.php";i:24;s:20:"social-pug/index.php";i:25;s:44:"stops-core-theme-and-plugin-updates/main.php";i:26;s:31:"tasty-recipes/tasty-recipes.php";i:27;s:33:"w3-total-cache/w3-total-cache.php";i:28;s:41:"wordpress-importer/wordpress-importer.php";i:29;s:24:"wordpress-seo/wp-seo.php";i:30;s:49:"wp-cron-status-checker/wp-cron-status-checker.php";i:31;s:27:"wp-crontrol/wp-crontrol.php";i:32;s:16:"wp-edit/main.php";i:33;s:43:"wp-maintenance-mode/wp-maintenance-mode.php";}'
where option_name = 'active_plugins';

update healthyh_proulxkr_hea11.wp_options
set option_value = 'a:34:{i:0;s:29:"adthrive-ads/adthrive-ads.php";i:1;s:19:"akismet/akismet.php";i:2;s:61:"all-404-redirect-to-homepage/all-404-redirect-to-homepage.php";i:3;s:28:"category-posts/cat-posts.php";i:4;s:33:"classic-editor/classic-editor.php";i:5;s:69:"comment-reply-by-admins-notifier/comment-reply-by-admins-notifier.php";i:6;s:36:"contact-form-7/wp-contact-form-7.php";i:7;s:73:"disable-responsive-images-complete/disable-responsive-images-complete.php";i:8;s:51:"display-posts-shortcode/display-posts-shortcode.php";i:9;s:64:"export-media-with-selected-content/export-media-with-content.php";i:10;s:43:"go-live-update-urls/go-live-update-urls.php";i:11;s:43:"google-analytics-dashboard-for-wp/gadwp.php";i:12;s:38:"hide-title/dojo-digital-hide-title.php";i:13;s:47:"import-users-from-csv/import-users-from-csv.php";i:14;s:31:"jetpack-boost/jetpack-boost.php";i:15;s:35:"jetpack-protect/jetpack-protect.php";i:16;s:19:"jetpack/jetpack.php";i:17;s:31:"media-deduper/media-deduper.php";i:18;s:23:"nofollowr/nofollowr.php";i:19;s:50:"official-facebook-pixel/facebook-for-wordpress.php";i:20;s:39:"pixelyoursite/facebook-pixel-master.php";i:21;s:47:"really-simple-ssl/rlrsssl-really-simple-ssl.php";i:22;s:43:"simple-social-icons/simple-social-icons.php";i:23;s:20:"social-pug/index.php";i:24;s:44:"stops-core-theme-and-plugin-updates/main.php";i:25;s:31:"tasty-recipes/tasty-recipes.php";i:26;s:33:"w3-total-cache/w3-total-cache.php";i:27;s:41:"wordpress-importer/wordpress-importer.php";i:28;s:24:"wordpress-seo/wp-seo.php";i:30;s:49:"wp-cron-status-checker/wp-cron-status-checker.php";i:31;s:26:"wp-crontrol/wp-crontrol.php";i:32;s:16:"wp-edit/main.php";i:33;s:43:"wp-maintenance-mode/wp-maintenance-mode.php";}'
where option_name = 'active_plugins';
