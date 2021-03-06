# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit versionator

COMPRESSTYPE=".gz"
K_USEPV="yes"
UNIPATCH_STRICTORDER="yes"
CKV="$(get_version_component_range 1-2)"
ETYPE="sources"

inherit kernel-2
#detect_version
K_NOSETEXTRAVERSION="don't_set_it"

DESCRIPTION="The Liquorix Kernel Sources v3.x"
HOMEPAGE="http://liquorix.net/"
LIQUORIX_VERSION="${PV/_p[0-9]*}"
LIQUORIX_FILE="${LIQUORIX_VERSION}-3.patch${COMPRESSTYPE}"
LIQUORIX_URI="http://liquorix.net/sources/${LIQUORIX_FILE}
			  http://stuff.tazhate.com/distfiles/${LIQUORIX_FILE}"
SRC_URI="${KERNEL_URI} ${LIQUORIX_URI}";

KEYWORDS="-* ~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

KV_FULL="${PVR/_p/-pf}"
S="${WORKDIR}"/linux-"${KV_FULL}"

pkg_setup(){
	kernel-2_pkg_setup
}

src_prepare(){
	epatch "${DISTDIR}"/"${LIQUORIX_FILE}"
}

K_EXTRAEINFO="For more info on liquorix-sources and details on how to report problems, see: \
${HOMEPAGE}."
