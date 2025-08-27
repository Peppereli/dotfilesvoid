// PREF: disable Firefox Sync
user_pref("identity.fxaccounts.enabled", false);

// PREF: disable the Firefox View tour from popping up
user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}");
// PREF: enable HTTPS-Only Mode
// Warn me before loading sites that don't support HTTPS
// in both Normal and Private Browsing windows.
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

// PREF: hide site shortcut thumbnails on New Tab page
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

// PREF: hide weather on New Tab page
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// PREF: hide dropdown suggestions when clicking on the address bar
user_pref("browser.urlbar.suggest.topsites", false);

// PREF: ask where to save every file
user_pref("browser.download.useDownloadDir", false);
