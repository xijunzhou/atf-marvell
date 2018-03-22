#
# ***************************************************************************
# Copyright (C) 2018 Marvell International Ltd.
# ***************************************************************************
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# Neither the name of Marvell nor the names of its contributors may be used
# to endorse or promote products derived from this software without specific
# prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

MARVELL_DRV_BASE	:=	drivers/marvell
PLAT_MARVELL		:= 	plat/marvell
A8KP_MSS_SOURCE		:= 	$(PLAT_MARVELL)/a8k-p/common/mss


BL2_SOURCES		+=	$(A8KP_MSS_SOURCE)/mss_bl2_setup.c	\
				$(MARVELL_DRV_BASE)/mochi/ap810_setup.c

PLAT_INCLUDES           +=      -I$(A8KP_MSS_SOURCE)

ifneq (${SCP_BL2},)
# Subsystems require a SCP_BL2 image
$(eval $(call FIP_ADD_IMG,SCP_BL2,--scp-fw))

# This define is used to inidcate the SCP image is present
$(eval $(call add_define,SCP_IMAGE))
endif