Server settings for [smokeday.com](https://smokeday.com) (Magento 2.4.7-p10) on Nexcess:
- **Production**: `f3fa7e4327.nxcli.io` (`/chroot/home/aabd032f/f3fa7e4327.nxcli.io`, origin IP `209.87.149.81`)
- **Staging**: `310bcdbdef.nxcli.io` (`/home/a6676c35/310bcdbdef.nxcli.io`)

# The server's software
- PHP 8.2.35
- Magento 2.4.7-p10
- MariaDB 10.6.25
- Redis (DB 0: `default` cache, DB 1: `page_cache` FPC, DB 2: `session`)

# Server & Edge Optimizations (2026-10-26)
- [smokeday-com/s#1](https://github.com/smokeday-com/s/issues/1): Configured SSH public key authentication on the staging server (`310bcdbdef.nxcli.io`) and ignored `.ssh`/`.my.cnf` secrets.
- [smokeday-com/s#2](https://github.com/smokeday-com/s/issues/2): Optimized `Magento\Framework\Cache\Backend\Redis` options in `app/etc/env.php` (`persistent` socket identifiers `cache_default`/`cache_fpc`, `preload_keys` for core config/EAV/event/route hashes, and `compress_tags = 1`) and updated the `amasty_mostviewed_build_together_index` database cron expression to `5 9 * * *`.
- [smokeday-com/s#3](https://github.com/smokeday-com/s/issues/3): Replaced the legacy Cloudflare `Cache Everything` Page Rule (`083debaf0e643f2a80889aab57270501`) with a two-rule session-aware Cloudflare Pro `Cache Rules` (`http_request_cache_settings`) configuration on zone `9f7c4c46b1ea1554eb27294236a3a262`.
- [smokeday-com/s#4](https://github.com/smokeday-com/s/issues/4): Restarted the stale `queue:consumers:start` process under PHP 8.2.35, removed the vulnerable user-level Composer 2.7.7 binary (`CVE-2026-59944`) from `~/.local/bin/composer` so `/usr/bin/composer` (`2.10.3`) is used, and removed `pub/errors/processor.php.orig` and `pub/modsec-shared-collections` from the public `pub/` webroot.
