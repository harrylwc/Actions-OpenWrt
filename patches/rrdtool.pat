--- a/feeds/packages/utils/rrdtool1/Makefile
+++ b/feeds/packages/utils/rrdtool1/Makefile
@@ -14,9 +14,8 @@
 PKG_BUILD_DIR:=$(BUILD_DIR)/rrdtool-$(PKG_VERSION)
 PKG_SOURCE:=rrdtool-$(PKG_VERSION).tar.gz
 PKG_SOURCE_URL:= \
-	http://oss.oetiker.ch/rrdtool/pub/rrdtool-1.0.x \
-	http://www.fastmirrors.org/rrdtool/rrdtool-1.0.x \
-	ftp://ftp.sunet.se/pub/network/monitoring/rrdtool/rrdtool-1.0.x
+	https://oss.oetiker.ch/rrdtool/pub/archive/rrdtool-1.0.x \
+	ftp://ftp.sunet.se/mirror/archive/ftp.sunet.se/pub/network/monitoring/rrdtool/rrdtool-1.0.x
 PKG_HASH:=42aa7c213dedbd95d33ca84d92f4187880f7e96062c6a3fb05bfb16f77ba2a91
 PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
 
