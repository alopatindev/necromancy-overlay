# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

DESCRIPTION="Simple scripts for automatically starting commands"
HOMEPAGE="http://ck.kolivas.org/apps/toolsched/"
SRC_URI="
	http://ck.kolivas.org/apps/toolsched/toolsched-${PV}/toolsched.b
	http://ck.kolivas.org/apps/toolsched/toolsched-${PV}/toolsched.d
	http://ck.kolivas.org/apps/toolsched/toolsched-${PV}/toolsched.i
	http://ck.kolivas.org/apps/toolsched/toolsched-${PV}/toolsched.n
"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-process/schedtool"

src_unpack() { :; }

src_install() {
	dobin ${DISTDIR}/toolsched.*
}
