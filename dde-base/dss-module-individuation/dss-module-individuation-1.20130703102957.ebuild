# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit fdo-mime versionator eutils

DSS="deepin-system-settings"
MY_VER="$(get_version_component_range 1)+git$(get_version_component_range 2)~7295fcb0a0"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/main/d/${DSS}/${DSS}_${MY_VER}.tar.gz"

DESCRIPTION="Deepin System Settings module for configuring individuation"
HOMEPAGE="http://www.linuxdeepin.com"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="dde-base/deepin-system-settings
		dev-python/pystorm"
DEPEND=""
S="${WORKDIR}/${DSS}-${MY_VER}/modules/individuation"

src_install() {
	
	insinto "/usr/share/${DSS}/modules/individuation"
	doins -r ${S}/src ${S}/data ${S}/backgrounds ${S}/theme ${S}/locale ${S}/__init__.py ${S}/config.ini

	rm ${D}/usr/share/${DSS}/modules/individuation/locale/*.po*
	fperms 0755 -R /usr/share/${DSS}/modules/individuation/src/{main.py,messager.py,xdg_support.py,ui/{delete_page.py,detail_page.py,status_box.py,theme_page.py}}

}
