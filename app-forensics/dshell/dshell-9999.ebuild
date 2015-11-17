# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ necrose99

EAPI=5

PYTHON_COMPAT=( >=python2_0  =<python3_0 ) # Any python Greater than 2.x however NOT >=3.0 Curently. 
inherit distutils-r1 git-r3 eutils
USE="doc" #Documentaion IS recomended. However Alow Users to kill if not wanted. 

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/USArmyResearchLab/Dshell.git"
	EGIT_BRANCH="master"
	EGIT_CHECKOUT_DIR="${WORKDIR}/refpolicy"

	inherit git-r3


#else
#	SRC_URI="https://github.com/USArmyResearchLab/Dshell/archive/v${PV}.tar.gz -> dhell-${PV}.tar.gz""
	KEYWORDS="~*" #~amd64 ~x86 
fi


DESCRIPTION="Dshell is a network modular forensic analysis framework From USArmyResearchLab"
HOMEPAGE="https://github.com/USArmyResearchLab/Dshell"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/python/python-2.*
 dev-python/pygeoip
 dev-python/ipy
 dev-python/dpkt
 dev-python/pypcap
 dev-python/pycrypto 
 doc? (dev-python/epydoc)"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}/"

src_install() {
	distutils-r1_src_install
	emake rc
	emake initpy
	if use doc; then
cd ${WORKDIR}/${PN}/doc && ./generate-doc.sh
	fi
}
