# $NetBSD: buildlink3.mk,v 1.64 2021/04/21 11:40:36 adam Exp $

.include "../../mk/bsd.fast.prefs.mk"

BUILDLINK_TREE+=	heimdal

.if !defined(HEIMDAL_BUILDLINK3_MK)
HEIMDAL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.heimdal+=	heimdal>=0.4e
BUILDLINK_ABI_DEPENDS.heimdal+=	heimdal>=1.5.3nb28
BUILDLINK_PKGSRCDIR.heimdal?=	../../security/heimdal
BUILDLINK_INCDIRS.heimdal?=	include/krb5

BUILDLINK_FILES.heimdal+=	bin/krb5-config
BUILDLINK_FILES.heimdal+=	bin/compile_et

pkgbase := heimdal
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.heimdal:Mldap)
.  include "../../databases/openldap-client/buildlink3.mk"
.endif

CHECK_BUILTIN.heimdal:=	yes
.include "../../security/heimdal/builtin.mk"
CHECK_BUILTIN.heimdal:=	no
.if !empty(USE_BUILTIN.heimdal:M[nN][oO])
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../mk/bdb.buildlink3.mk"
.endif
.endif # HEIMDAL_BUILDLINK3_MK

BUILDLINK_TREE+=	-heimdal
