# $NetBSD: Makefile,v 1.42 2020/08/17 20:19:14 leot Exp $
#

DISTNAME=		gcin-1.1.7
PKGREVISION=		29
CATEGORIES=		inputmethod
#MASTER_SITES=		http://www.csie.nctu.edu.tw/~cp76/gcin/download/
MASTER_SITES=		http://cle.linux.org.tw/gcin/download/gcin-old/gcin-1.1.x/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		rxg@NetBSD.org
#HOMEPAGE=		http://www.csie.nctu.edu.tw/~cp76/gcin/
COMMENT=		Gtk Chinese INput application in X

MAKE_JOBS_SAFE=		no

USE_LIBTOOL=		yes
HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX:Q}
CONFIGURE_ARGS+=	--x11base=${X11BASE:Q}
CONFIGURE_ARGS+=	--use_xim=Y
CONFIGURE_ARGS+=	--new_gtk_im=Y
USE_TOOLS+=		pkg-config gmake
GTK2_IMMODULES=		yes
.include "../../x11/gtk2/modules.mk"

REPLACE_SH=	configure
REPLACE_SH+=	scripts/gcin-user-setup
REPLACE_SH+=	scripts/modify-XIM
REPLACE_SH+=	scripts/utf8-edit

.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
