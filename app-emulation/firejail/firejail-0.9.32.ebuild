# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

#inherit 

DESCRIPTION="a SUID sandbox program using linux namespaces"
HOMEPAGE="https://l3net.wordpress.com/projects/firejail/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bind +chroot +seccomp"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	local -a EXTRA_ECONF;
	sed \
		-e '/\tstrip/d' \
		-i Makefile.in
	sed \
		-e 's#/usr/bin/zsh#/bin/zsh#g' \
		-i \
			src/man/${PN}.txt \
			src/${PN}/usage.c \
			src/${PN}/sandbox.c \
			src/${PN}/main.c
}

src_configure() {
	for flag in ${IUSE}; do
		EXTRA_ECONF+=( $(use_enable "${flag/+}") )
	done
	EXTRA_ECONF="${EXTRA_ECONF[@]}"
	default
}
