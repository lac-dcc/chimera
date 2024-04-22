--
--  vdp_sprite.vhd
--    Sprite module.
--
--  Copyright (C) 2004-2006 Kunihiko Ohnaka,
--  All rights reserved.
--                                     http://www.ohnaka.jp/ese-vdp/
--
--  �{�\�t�g�E�F�A����і{�\�t�g�E�F�A�Ɋ�Â��č쐬���ꂽ�h�����́A�ȉ��̏�����
--  �������ꍇ�Ɍ���A�ĔЕz����юg�p��������܂��B
--
--  1.�\�[�X�R�[�h�`���ōĔЕz����ꍇ�A��L�̒��쌠�\���A�{�����ꗗ�A����щ��L
--    �Ɛӏ��������̂܂܂̌`�ŕێ����邱�ƁB
--  2.�o�C�i���`���ōĔЕz����ꍇ�A�Еz���ɕt���̃h�L�������g���̎����ɁA��L��
--    ���쌠�\���A�{�����ꗗ�A����щ��L�Ɛӏ������܂߂邱�ƁB
--  3.���ʂɂ�鎖�O�̋��Ȃ��ɁA�{�\�t�g�E�F�A��̔��A����я��ƓI�Ȑ��i�⊈��
--    �Ɏg�p���Ȃ����ƁB
--
--  �{�\�t�g�E�F�A�́A���쌠�҂ɂ���āu����̂܂܁v�񋟂���Ă��܂��B���쌠�҂́A
--  ����ړI�ւ̓K�����̕ۏ؁A���i���̕ۏ؁A�܂�����Ɍ��肳��Ȃ��A�����Ȃ閾��
--  �I�������͈ÖقȕۏؐӔC�������܂���B���쌠�҂́A���R�̂�������킸�A���Q
--  �����̌�����������킸�A���ӔC�̍������_��ł��邩���i�ӔC�ł��邩�i�ߎ�
--  ���̑��́j�s�@�s�ׂł��邩���킸�A���ɂ��̂悤�ȑ��Q����������\����m��
--  ����Ă����Ƃ��Ă��A�{�\�t�g�E�F�A�̎g�p�ɂ���Ĕ��������i��֕i�܂��͑�p�T
--  �[�r�X�̒��B�A�g�p�̑r���A�f�[�^�̑r���A���v�̑r���A�Ɩ��̒��f���܂߁A�܂���
--  ��Ɍ��肳��Ȃ��j���ڑ��Q�A�Ԑڑ��Q�A�����I�ȑ��Q�A���ʑ��Q�A�����I���Q�A��
--  ���͌��ʑ��Q�ɂ��āA��ؐӔC�𕉂�Ȃ����̂Ƃ��܂��B
--
--  Note that above Japanese version license is the formal document.
--  The following translation is only for reference.
--
--  Redistribution and use of this software or any derivative works,
--  are permitted provided that the following conditions are met:
--
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  3. Redistributions may not be sold, nor may they be used in a 
--     commercial product or activity without specific prior written
--     permission.
--
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
--  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
--  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
--  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
--  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
--  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
--  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
--  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
--  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
--  POSSIBILITY OF SUCH DAMAGE.
--
-------------------------------------------------------------------------------
-- Memo
--   Japanese comment lines are starts with "JP:".
--   JP: ���{��̃R�����g�s�� JP:�𓪂ɕt���鎖�ɂ���
--
-------------------------------------------------------------------------------
-- Revision History
--
-- 29th,October,2006 modified by Kunihiko Ohnaka
--   - Insert the license text.
--   - Add the document part below.
--
-- 26th,August,2006 modified by Kunihiko Ohnaka
--   - latch the base addresses every eight dot cycle
--     (DRAM RAS/CAS access emulation)
-- 
-- 20th,August,2006 modified by Kunihiko Ohnaka
--   - Change the drawing algorithm.
--   - Add sprite collision checking function.
--   - Add sprite over-mapped checking function.
--   - Many bugs are fixed, and it works fine.
--   - (first release virsion)
--
-- 17th,August,2004 created by Kunihiko Ohnaka
--   - Start new sprite module implementing.
--     * This module uses Block RAMs so that shrink the
--       circuit size.
--     * Separate sprite module from vdp.vhd.
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: ���̎����ł�BLOCKRAM���g���A�����SLICE��ߖ񂷂�̂��_���B
-- JP: ���̎������g��Ȃ���Ԃł� vdp.vhd���R���p�C����������
-- JP: SLICE�g�p����1900�O��B
-- JP: 2006/8/16�B���̃X�v���C�g���g��Ȃ��ŐV��(Cyclone)�ł́A
-- JP:            2726LC������.
-- JP: 2006/8/19�B���̃X�v���C�g���g�����Ƃ���A2278LC�܂Ō����B
-- JP:
-- JP: [�p��]
-- JP: �E���[�J���v���[���ԍ�
-- JP:   ���郉�C����ɕ���ł���X�v���C�g(�v���[��)�����𔲂��o����
-- JP:   �X�v���C�g�v���[���ԍ����ɕ��ׂ����̏��ʁB
-- JP:   �Ⴆ�΂��郉�C���ɃX�v���C�g�v���[��#1,#4,#5�����݂���ꍇ�A
-- JP:   ���ꂼ��̃X�v���C�g�̃��[�J���v���[���ԍ���#0,#1,#2�ƂȂ�B
-- JP:   �X�v���C�g���[�h2�ł������ɍő�8���������΂Ȃ��̂ŁA
-- JP:   ���[�J���v���[���ԍ��͍ő��#7�ƂȂ�B
-- JP:
-- JP: �E��ʕ`��ш�
-- JP:    VDP�̎��@��8�h�b�g(32�N���b�N)�ŘA���A�h���X��̃f�[�^4�o�C�g
-- JP:    (GRAPHIC6,7�ł�RAM�̃C���^�[���[�u�A�N�Z�X�ɂ��o�C�g)
-- JP:    �̃��[�h�ɉ����A�����_���A�h���X�ւ�2�T�C�N��(2�o�C�g)��
-- JP:    �A�N�Z�X�����[
-- JP:    ������DRAM�A�N�Z�X�T�C�N���Ɉȉ��̂悤�ɖ��O��t����B
-- JP:     * ��ʕ`�惊�[�h�T�C�N��
-- JP:     * �X�v���C�gY���W�����T�C�N��
-- JP:     * �����_���A�N�Z�X�T�C�N��
-- JP:
-- JP: ������VDP�ł�VRAM�A�N�Z�X�T�C�N��
-- JP:    ����VDP�ł͋�����DRAM�ł͂Ȃ���荂���ȃ��������g�p���Ă���B
-- JP:    ���̂��߁A�S�N���b�N��1��m���Ƀ����_���A�N�Z�X�����s�ł���
-- JP:    �������������Ă��鎖��O��Ƃ��ăR�[�f�B���O���܂��B
-- JP:    �܂��ACyclone�Ŏ���MSX�ł́A16�r�b�g����SDRAM��p���Ă���
-- JP:    ���߁A���̃A�N�Z�X�ŘA������16�r�b�g�̃f�[�^��ǂގ����\
-- JP:    �ł��B
-- JP:    ����VDP�ł́AD0�`D7�̉���8�r�b�g��VRAM�̑O��64K�o�C�g�A
-- JP:    D8�`D15�̏��8�r�b�g���㔼64K�o�C�g�Ƀ}�b�s���O���Ă��܂��B
-- JP:    ���̂悤�ȕϑ��I�Ȋ��蓖�Ă�����̂́A���@��VDP�̃�����
-- JP:    �}�b�v���܂˂邽�߂ł��B���ہA4�N���b�N��2�o�C�g�̃�������
-- JP:    �ǂݏo���ш悪�K�v�ɂȂ�̂�GRAPHIC6,7�̃��[�h�����ł��B
-- JP:    ���@��VDP�́AGRAPHIC6,7�ł̓������̃C���^�[���[�u��p���A
-- JP:    (GRAPHIC7�ɂ�����)�����h�b�g��VRAM�̑O��64K�o�C�g��
-- JP:    ��肠�āA��h�b�g���㔼64K�o�C�g�Ɋ��蓖�ĂĂ��܂��B
-- JP:    ���̂��߁A����VDP�ł��O��64K�ƌ㔼64K�̓���A�h���X���
-- JP:    �f�[�^���P�T�C�N��(4�N���b�N)�œǂݏo����K�v������̂�
-- JP:    ���̂悤�ȃ}�b�s���O�ɂȂ��Ă��܂��B
-- JP:    �P���Ɍ����΁ASDRAM��16�r�b�g�A�N�Z�X���A���@��DRAM��
-- JP:    �C���^�[���[�u�A�N�Z�X�Ɍ����ĂĂ���Ƃ������Ƃł��B
-- JP:
-- JP:    ���낢��Ȍ��ۂ���AVDP�̓�����8�h�b�g�T�C�N���œ����Ă����
-- JP:    ��������Ă��܂��B8�h�b�g�A�܂�32�N���b�N�̂ǂ�����������
-- JP:    �̑ш悩�琄������ƁA�ȉ��̂悤�ɂȂ�܂��B
-- JP:
-- JP:   �@�@�h�b�g�@�F<=0=><=1=><=2=><=3=><=4=><=5=><=6=><=7=>
-- JP:   �ʏ�A�N�Z�X�F A0   A1   A2   A3   A4  (A5)  A6  (A7)
-- JP: �C���^�[���[�u�F B0   B1   B2   B3
-- JP:
-- JP:    - �`�撆
-- JP:   �@�@�EA0�`A3 (B0�`B3)
-- JP:        ��ʕ`��̂��߂Ɏg�p�BB0�`B3�̓C���^�[���[�u�œ�����
-- JP:        �ǂݏo����f�[�^�ŁAGRAPHIC6,7�ł����g��Ȃ��B
-- JP:   �@�@�EA4     �X�v���C�gY���W����
-- JP:   �@�@�EA6     VRAM R/W or VDP�R�}���h (2��Ɉ�񂸂A���݂Ɋ��蓖�Ă�)
-- JP:
-- JP:     - ��`�撆(�X�v���C�g������)
-- JP:    �@�@�EA0     �X�v���C�gX���W���[�h
-- JP:    �@�@�EA1     �X�v���C�g�p�^�[���ԍ����[�h
-- JP:    �@�@�EA2     �X�v���C�g�p�^�[�������[�h
-- JP:    �@�@�EA3     �X�v���C�g�p�^�[���E���[�h
-- JP:    �@�@�EA4     �X�v���C�g�J���[���[�h
-- JP:    �@�@�EA6     VRAM R/W or VDP�R�}���h (2��Ɉ�񂸂A���݂Ɋ��蓖�Ă�)
-- JP:
-- JP:   A5��A7�̃X���b�g�͎��ۂɂ͎g�p���邱�Ƃ��ł���̂ł����A
-- JP:   ������g���Ă��܂��Ǝ��@�����ш悪�����Ă��܂��̂ŁA
-- JP:   �����Ďg�킸�Ɏc���Ă��܂��B
-- JP:   �܂��A��`�撆�̃T�C�N���́A���@�Ƃ͈قȂ�܂��B���@�ł�
-- JP:   64�N���b�N�� 2�̃X�v���C�g���܂Ƃ߂ď������鎖�ŁADRAM��
-- JP:   �y�[�W���[�h�T�C�N����L�����p�ł���悤�ɂ��Ă��܂��B
-- JP:   �܂��A����64�N���b�N�̒��ɂ�VRAM��VDP�R�}���h�Ɋ������߂�
-- JP:   �X���b�g�������̂ŁA64�N���b�N�T�C�N���̌��Ԃ�VRAM�A�N
-- JP:   �Z�X�̂��߂̌��Ԃ��󂯂Ă���̂�������܂���B�i���m�F�j
-- JP:   ����VDP�ł����̓�������S�ɐ^�����鎖�͉\�ł����A
-- JP:   �\�[�X���K�v�ȏ�ɕ��G�Ɍ����Ă��܂��̂ƁA2��n��T�C�N��
-- JP:   ���炸��Ă��܂��̂�������҂茙�������̂ŁA��L�̂悤��
-- JP:   ���ꂢ�ȃT�C�N���ɂ��Ă��܂��B
-- JP:   �ǂ����Ă����@�Ɠ����^�C�~���O�ɂ������Ƃ�������
-- JP:   �`�������W���Ă݂Ă��������B
-- JP:  

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE WORK.VDP_PACKAGE.ALL;

ENTITY VDP_SPRITE IS
	PORT(
		-- VDP CLOCK ... 21.477MHZ
		CLK21M						: IN	STD_LOGIC;
		RESET						: IN	STD_LOGIC;

		DOTSTATE					: IN	STD_LOGIC_VECTOR(  1 DOWNTO 0 );
		EIGHTDOTSTATE				: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );

		DOTCOUNTERX	 				: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		DOTCOUNTERYP				: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		BWINDOW_Y					: IN	STD_LOGIC;

		-- VDP STATUS REGISTERS OF SPRITE
		PVDPS0SPCOLLISIONINCIDENCE	: OUT	STD_LOGIC;
		PVDPS0SPOVERMAPPED			: OUT	STD_LOGIC;
		PVDPS0SPOVERMAPPEDNUM		: OUT	STD_LOGIC_VECTOR(  4 DOWNTO 0 );
		PVDPS3S4SPCOLLISIONX		: OUT	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		PVDPS5S6SPCOLLISIONY		: OUT	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		PVDPS0RESETREQ				: IN	STD_LOGIC;
		PVDPS0RESETACK				: OUT	STD_LOGIC;
		PVDPS5RESETREQ				: IN	STD_LOGIC;
		PVDPS5RESETACK				: OUT	STD_LOGIC;
		-- VDP REGISTERS
		REG_R1_SP_SIZE				: IN	STD_LOGIC;
		REG_R1_SP_ZOOM				: IN	STD_LOGIC;
		REG_R11R5_SP_ATR_ADDR		: IN	STD_LOGIC_VECTOR(  9 DOWNTO 0 );
		REG_R6_SP_GEN_ADDR			: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		REG_R8_COL0_ON				: IN	STD_LOGIC;
		REG_R8_SP_OFF				: IN	STD_LOGIC;
		REG_R23_VSTART_LINE			: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		REG_R27_H_SCROLL			: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );
		SPMODE2						: IN	STD_LOGIC;
		VRAMINTERLEAVEMODE			: IN	STD_LOGIC;

		SPVRAMACCESSING				: OUT	STD_LOGIC;

		PRAMDAT						: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		PRAMADR						: OUT	STD_LOGIC_VECTOR( 16 DOWNTO 0 );

		-- JP: �X�v���C�g��`�悵������'1'�ɂȂ�B�J���[�R�[�h0��
		-- JP: �`�悷�鎖���ł���̂ŁA���̃r�b�g���K�v
		SPCOLOROUT					: OUT	STD_LOGIC;
		-- OUTPUT COLOR
		SPCOLORCODE					: OUT	STD_LOGIC_VECTOR(  3 DOWNTO 0 )
	);
END VDP_SPRITE;

ARCHITECTURE RTL OF VDP_SPRITE IS
	COMPONENT VDP_SPINFORAM
		PORT(
			ADDRESS		: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );
			INCLOCK		: IN	STD_LOGIC;
			WE			: IN	STD_LOGIC;
			DATA		: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Q			: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 )
		);
	END COMPONENT;

	COMPONENT RAM
		PORT(
			ADR		: IN	STD_LOGIC_VECTOR(	 7 DOWNTO 0 );
			CLK		: IN	STD_LOGIC;
			WE		: IN	STD_LOGIC;
			DBO		: IN	STD_LOGIC_VECTOR(	 7 DOWNTO 0 );
			DBI		: OUT	STD_LOGIC_VECTOR(	 7 DOWNTO 0 )
		);
	END COMPONENT;

	SIGNAL FF_SP_EN					: STD_LOGIC;
	SIGNAL FF_CUR_Y					: STD_LOGIC_VECTOR(  8 DOWNTO 0 );

	SIGNAL FF_VDPS0RESETACK			: STD_LOGIC;
	SIGNAL FF_VDPS5RESETACK			: STD_LOGIC;
	
	-- FOR SPINFORAM
	SIGNAL SPINFORAMADDR			: STD_LOGIC_VECTOR(  2 DOWNTO 0);
	SIGNAL SPINFORAMWE				: STD_LOGIC;
	SIGNAL SPINFORAMDATA_IN			: STD_LOGIC_VECTOR( 31 DOWNTO 0);
	SIGNAL SPINFORAMDATA_OUT		: STD_LOGIC_VECTOR( 31 DOWNTO 0);

	SIGNAL SPINFORAMX_IN			: STD_LOGIC_VECTOR(  8 DOWNTO 0);
	SIGNAL SPINFORAMPATTERN_IN		: STD_LOGIC_VECTOR( 15 DOWNTO 0);
	SIGNAL SPINFORAMCOLOR_IN		: STD_LOGIC_VECTOR(  3 DOWNTO 0);
	SIGNAL SPINFORAMCC_IN			: STD_LOGIC;
	SIGNAL SPINFORAMIC_IN			: STD_LOGIC;
	SIGNAL SPINFORAMX_OUT			: STD_LOGIC_VECTOR(  8 DOWNTO 0);
	SIGNAL SPINFORAMPATTERN_OUT		: STD_LOGIC_VECTOR( 15 DOWNTO 0);
	SIGNAL SPINFORAMCOLOR_OUT		: STD_LOGIC_VECTOR(  3 DOWNTO 0);
	SIGNAL SPINFORAMCC_OUT			: STD_LOGIC;
	SIGNAL SPINFORAMIC_OUT			: STD_LOGIC;
	
	TYPE TYPESPSTATE IS ( SPSTATE_IDLE, SPSTATE_YTEST_DRAW, SPSTATE_PREPARE );
	SIGNAL SPSTATE					: TYPESPSTATE;

	-- JP: �X�v���C�g�v���[���ԍ��~�������\�������̔z��
	TYPE SPRENDERPLANESTYPE IS ARRAY( 0 TO 7 ) OF STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL SPRENDERPLANES			: SPRENDERPLANESTYPE;

	SIGNAL IRAMADR					: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL FF_Y_TEST_VRAM_ADDR		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL IRAMADRPREPARE			: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	
	SIGNAL SPATTRTBLBASEADDR		: STD_LOGIC_VECTOR( REG_R11R5_SP_ATR_ADDR'LENGTH -1 DOWNTO 0);
	SIGNAL SPPTNGENETBLBASEADDR		: STD_LOGIC_VECTOR( REG_R6_SP_GEN_ADDR'LENGTH -1 DOWNTO 0);
	SIGNAL SPATTRIB_ADDR			: STD_LOGIC_VECTOR( 16 DOWNTO 2 );
	SIGNAL READVRAMADDRCREAD		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL READVRAMADDRPTREAD		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );

	-- JP: Y���W�������̃v���[���ԍ�
	SIGNAL FF_Y_TEST_SP_NUM			: STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	SIGNAL FF_Y_TEST_LISTUP_ADDR	: STD_LOGIC_VECTOR(  3 DOWNTO 0 );	 -- 0 - 8
	SIGNAL FF_Y_TEST_EN				: STD_LOGIC;
	-- JP: �������f�[�^�������̃��[�J���v���[���ԍ�
	SIGNAL SPPREPARELOCALPLANENUM	: STD_LOGIC_VECTOR(  2 DOWNTO 0 );
	-- JP: �������f�[�^�������̃v���[���ԍ�
	SIGNAL SPPREPAREPLANENUM		: STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	-- JP: �������f�[�^�������̃X�v���C�g��Y���C���ԍ�(�X�v���C�g�̂ǂ̕�����`�悷�邩)
	SIGNAL SPPREPARELINENUM			: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	-- JP: �������f�[�^�������̃X�v���C�g��X�ʒu�B0�̎���8�h�b�g�B1�̎��E8�h�b�g�B(16X16���[�h�݂̂Ŏg�p)
	SIGNAL SPPREPAREXPOS			: STD_LOGIC;
	SIGNAL SPPREPAREPATTERNNUM		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	-- JP: �����f�[�^�̏������I������
	SIGNAL SPPREPAREEND				: STD_LOGIC;
	SIGNAL SPCCD					: STD_LOGIC;

	-- JP: �����������Ă���X�v���C�g�̃��[�J���v���[���ԍ�
	SIGNAL SPPREDRAWLOCALPLANENUM	: STD_LOGIC_VECTOR(  2 DOWNTO 0 );	 -- 0 - 7
	SIGNAL SPPREDRAWEND				: STD_LOGIC;

	-- JP: ���C���o�b�t�@�ւ̕`��p
	SIGNAL SPDRAWX					: STD_LOGIC_VECTOR(  8 DOWNTO 0 );	-- -32 - 287 (=256+31)
	SIGNAL SPDRAWPATTERN			: STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	SIGNAL SPDRAWCOLOR				: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	
	-- JP: �X�v���C�g�`�惉�C���o�b�t�@�̐���M��
	SIGNAL SPLINEBUFADDR_E			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFADDR_O			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFWE_E			: STD_LOGIC;
	SIGNAL SPLINEBUFWE_O			: STD_LOGIC;
	SIGNAL SPLINEBUFDATA_IN_E		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDATA_IN_O		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDATA_OUT_E		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDATA_OUT_O		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	
	SIGNAL SPLINEBUFDISPWE			: STD_LOGIC;
	SIGNAL SPLINEBUFDRAWWE			: STD_LOGIC;
	SIGNAL SPLINEBUFDISPX			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDRAWX			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDRAWCOLOR		: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDISPDATA_OUT	: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL SPLINEBUFDRAWDATA_OUT	: STD_LOGIC_VECTOR(  7 DOWNTO 0 );

	SIGNAL SPWINDOWX				: STD_LOGIC;

	SIGNAL FF_SP_OVERMAP			: STD_LOGIC;
	SIGNAL FF_SP_OVERMAP_NUM		: STD_LOGIC_VECTOR(  4 DOWNTO 0 );

	SIGNAL W_SPLISTUPY				: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL W_TARGET_SP_EN			: STD_LOGIC;
	SIGNAL W_SP_OFF					: STD_LOGIC;
	SIGNAL W_SP_OVERMAP				: STD_LOGIC;
	SIGNAL W_ACTIVE					: STD_LOGIC;
BEGIN

	PVDPS0RESETACK			<= FF_VDPS0RESETACK;
	PVDPS5RESETACK			<= FF_VDPS5RESETACK;
	PVDPS0SPOVERMAPPED		<= FF_SP_OVERMAP;
	PVDPS0SPOVERMAPPEDNUM	<= FF_SP_OVERMAP_NUM;

	---------------------------------------------------------------------------
	-- �X�v���C�g��\�����邩�ۂ��������M�� 
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_SP_EN <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" AND DOTCOUNTERX = 0 )THEN
				FF_SP_EN <= (NOT REG_R8_SP_OFF) AND W_ACTIVE;
			END IF;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- SPRITE INFORMATION ARRAY
	-- ���ۂɕ\������X�v���C�g�̏����W�߂ċL�^���Ă���RAM 
	----------------------------------------------------------------
	ISPINFORAM: VDP_SPINFORAM
	PORT MAP(
		ADDRESS		=> SPINFORAMADDR,
		INCLOCK		=> CLK21M,
		WE			=> SPINFORAMWE,
		DATA		=> SPINFORAMDATA_IN,
		Q			=> SPINFORAMDATA_OUT
	);

	SPINFORAMDATA_IN	<=	'0' & 
							SPINFORAMX_IN & SPINFORAMPATTERN_IN &
							SPINFORAMCOLOR_IN & SPINFORAMCC_IN & SPINFORAMIC_IN;
	SPINFORAMX_OUT		<=	SPINFORAMDATA_OUT( 30 DOWNTO 22 );
	SPINFORAMPATTERN_OUT<=	SPINFORAMDATA_OUT( 21 DOWNTO  6 );
	SPINFORAMCOLOR_OUT	<=	SPINFORAMDATA_OUT(  5 DOWNTO  2 );
	SPINFORAMCC_OUT		<=	SPINFORAMDATA_OUT( 1 );
	SPINFORAMIC_OUT		<=	SPINFORAMDATA_OUT( 0 );
	
	SPINFORAMADDR <=	SPPREPARELOCALPLANENUM WHEN( SPSTATE = SPSTATE_PREPARE )ELSE
						SPPREDRAWLOCALPLANENUM;

	----------------------------------------------------------------
	-- SPRITE LINE BUFFER
	----------------------------------------------------------------
	SPLINEBUFADDR_E			<= SPLINEBUFDISPX		WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDRAWX;
	SPLINEBUFDATA_IN_E		<= "00000000"			WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDRAWCOLOR;
	SPLINEBUFWE_E			<= SPLINEBUFDISPWE		WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDRAWWE;
	SPLINEBUFDISPDATA_OUT	<= SPLINEBUFDATA_OUT_E	WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDATA_OUT_O;

	U_EVEN_LINE_BUF: RAM
	PORT MAP(
		ADR		=> SPLINEBUFADDR_E		,
		CLK		=> CLK21M				,
		WE		=> SPLINEBUFWE_E		,
		DBO		=> SPLINEBUFDATA_IN_E	,
		DBI		=> SPLINEBUFDATA_OUT_E	
	);

	SPLINEBUFADDR_O			<= SPLINEBUFDRAWX		WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDISPX;
	SPLINEBUFDATA_IN_O		<= SPLINEBUFDRAWCOLOR	WHEN( DOTCOUNTERYP(0) = '0' )ELSE "00000000";
	SPLINEBUFWE_O			<= SPLINEBUFDRAWWE		WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDISPWE;
	SPLINEBUFDRAWDATA_OUT	<= SPLINEBUFDATA_OUT_O	WHEN( DOTCOUNTERYP(0) = '0' )ELSE SPLINEBUFDATA_OUT_E;

	U_ODD_LINE_BUF: RAM
	PORT MAP(
		ADR		=> SPLINEBUFADDR_O		,
		CLK		=> CLK21M				,
		WE		=> SPLINEBUFWE_O		,
		DBO		=> SPLINEBUFDATA_IN_O	,
		DBI		=> SPLINEBUFDATA_OUT_O	
	);

	-----------------------------------------------------------------------------
	SPPREPAREXPOS		<=	'1' WHEN( EIGHTDOTSTATE = "100" )ELSE
							'0';

	-- JP: VRAM�A�N�Z�X�A�h���X�̏o��
	IRAMADR	<=	FF_Y_TEST_VRAM_ADDR			WHEN( SPSTATE = SPSTATE_YTEST_DRAW )ELSE
				IRAMADRPREPARE;
	PRAMADR	<=	IRAMADR(16 DOWNTO 0)	WHEN( VRAMINTERLEAVEMODE = '0' )ELSE
				IRAMADR(0) & IRAMADR(16 DOWNTO 1);

	-----------------------------------------------------------------------------
	-- STATE MACHINE
	-----------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			SPSTATE <= SPSTATE_IDLE;
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "10" )THEN
				CASE SPSTATE IS
				WHEN SPSTATE_IDLE =>
					IF( DOTCOUNTERX = 0 )THEN
						SPSTATE <= SPSTATE_YTEST_DRAW;
					END IF;
				WHEN SPSTATE_YTEST_DRAW =>
					IF( DOTCOUNTERX = 256+8 )THEN
						SPSTATE <= SPSTATE_PREPARE;
					END IF;
				WHEN SPSTATE_PREPARE =>
					IF( SPPREPAREEND = '1' )THEN
						SPSTATE <= SPSTATE_IDLE;
					END IF;
				WHEN OTHERS =>
					SPSTATE <= SPSTATE_IDLE;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	-----------------------------------------------------------------------------
	-- �����C���̃��C���ԍ� 
	-----------------------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( (DOTSTATE = "01") AND (DOTCOUNTERX = 0) )THEN
				--	 +1 SHOULD BE NEEDED. BECAUSE IT WILL BE DRAWN IN THE NEXT LINE.
				FF_CUR_Y <= DOTCOUNTERYP + ('0' & REG_R23_VSTART_LINE) + 1;
			END IF;
		END IF;
	END PROCESS;

	-----------------------------------------------------------------------------
	-- VRAM ADDRESS GENERATOR
	-----------------------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			-- LATCHING ADDRESS SIGNALS
			IF( (DOTSTATE = "01") AND (DOTCOUNTERX = 0) )THEN
				SPPTNGENETBLBASEADDR <= REG_R6_SP_GEN_ADDR;
				IF( SPMODE2 = '0' )THEN
					SPATTRTBLBASEADDR <= REG_R11R5_SP_ATR_ADDR( 9 DOWNTO 0 );
				ELSE
					SPATTRTBLBASEADDR <= REG_R11R5_SP_ATR_ADDR( 9 DOWNTO 2 ) & "00";
				END IF;
			END IF;
		END IF;
	END PROCESS;

	-----------------------------------------------------------------------------
	-- VRAM ACCESS MASK
	-----------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			SPVRAMACCESSING <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "10" )THEN
				CASE SPSTATE IS
				WHEN SPSTATE_IDLE =>
					IF( DOTCOUNTERX = 0 )THEN
						SPVRAMACCESSING <= (NOT REG_R8_SP_OFF) AND W_ACTIVE;
					END IF;
				WHEN SPSTATE_YTEST_DRAW =>
					IF( DOTCOUNTERX = 256+8 )THEN
						SPVRAMACCESSING <= FF_SP_EN;
					END IF;
				WHEN SPSTATE_PREPARE =>
					IF( SPPREPAREEND = '1' )THEN
						SPVRAMACCESSING <= '0';
					END IF;
				WHEN OTHERS =>
					NULL;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- [Y_TEST]Y�e�X�g�p�̐M�� 
	---------------------------------------------------------------------------
	W_SPLISTUPY		<= FF_CUR_Y(7 DOWNTO 0) - PRAMDAT;

	-- [Y_TEST]���ڃX�v���C�g�������C���ɕ\�����邩�ǂ����̐M�� 
	W_TARGET_SP_EN	<=	'1'		WHEN(	((W_SPLISTUPY(7 DOWNTO 3) = "00000") AND (REG_R1_SP_SIZE = '0' ) AND (REG_R1_SP_ZOOM='0')) OR 
										((W_SPLISTUPY(7 DOWNTO 4) = "0000" ) AND (REG_R1_SP_SIZE = '1' ) AND (REG_R1_SP_ZOOM='0')) OR 
										((W_SPLISTUPY(7 DOWNTO 4) = "0000" ) AND (REG_R1_SP_SIZE = '0' ) AND (REG_R1_SP_ZOOM='1')) OR 
										((W_SPLISTUPY(7 DOWNTO 5) = "000"  ) AND (REG_R1_SP_SIZE = '1' ) AND (REG_R1_SP_ZOOM='1')) )ELSE
						'0';

	-- [Y_TEST]����ȍ~�̃X�v���C�g�͕\���֎~���ǂ����̐M�� 
	W_SP_OFF		<=	'1'	WHEN( PRAMDAT = ("1101" & SPMODE2 & "000") )ELSE
						'0';

	-- [Y_TEST]�S�i�W�j�̃X�v���C�g������ł��邩�ǂ����̐M�� 
	W_SP_OVERMAP	<=	'1'	WHEN( (FF_Y_TEST_LISTUP_ADDR(2) = '1' AND SPMODE2 = '0') OR FF_Y_TEST_LISTUP_ADDR(3) = '1' )ELSE
						'0';

	-- [Y_TEST]�\�����̃��C�����ۂ�
	W_ACTIVE		<=	BWINDOW_Y;

	---------------------------------------------------------------------------
	-- [Y_TEST]Y�e�X�g�X�e�[�g�łȂ����Ƃ������M�� 
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_Y_TEST_EN <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 0 ) THEN
					FF_Y_TEST_EN <= FF_SP_EN;
				ELSIF( EIGHTDOTSTATE = "110" )THEN
					IF( W_SP_OFF = '1' OR (W_SP_OVERMAP AND W_TARGET_SP_EN) = '1' OR FF_Y_TEST_SP_NUM = "11111" )THEN
						FF_Y_TEST_EN <= '0';
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- [Y_TEST]�e�X�g�Ώۂ̃X�v���C�g�ԍ� (0�`31)
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_Y_TEST_SP_NUM <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 0 )THEN
					FF_Y_TEST_SP_NUM <= (OTHERS => '0');
				ELSIF( EIGHTDOTSTATE = "110" )THEN
					IF( FF_Y_TEST_EN = '1' AND FF_Y_TEST_SP_NUM /= "11111" )THEN
						FF_Y_TEST_SP_NUM <= FF_Y_TEST_SP_NUM + 1;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- [Y_TEST]�\������X�v���C�g�����X�g�A�b�v���邽�߂̃��X�g�A�b�v�������A�h���X 0�`8
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_Y_TEST_LISTUP_ADDR <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 0 )THEN
					-- INITIALIZE
					FF_Y_TEST_LISTUP_ADDR <= (OTHERS => '0');
				ELSIF( EIGHTDOTSTATE = "110" )THEN
					-- NEXT SPRITE [���X�g�A�b�v�����������t�ɂȂ�܂ŃC���N�������g] 
					IF( FF_Y_TEST_EN = '1' AND W_TARGET_SP_EN = '1' AND W_SP_OVERMAP = '0' AND W_SP_OFF = '0' )THEN
						FF_Y_TEST_LISTUP_ADDR <= FF_Y_TEST_LISTUP_ADDR + 1;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- [Y_TEST]�\������X�v���C�g�����X�g�A�b�v���邽�߂̃��X�g�A�b�v�������ւ̏�������
	---------------------------------------------------------------------------
	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 0 )THEN
					-- INITIALIZE
				ELSIF( EIGHTDOTSTATE = "110" )THEN
					-- NEXT SPRITE
					IF( FF_Y_TEST_EN = '1' AND W_TARGET_SP_EN = '1' AND W_SP_OVERMAP = '0' AND W_SP_OFF = '0' )THEN
						SPRENDERPLANES( CONV_INTEGER(FF_Y_TEST_LISTUP_ADDR) ) <= FF_Y_TEST_SP_NUM;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- [Y_TEST]�S�ځi�W�ځj�̃X�v���C�g�����񂾂��ǂ����̐M�� 
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_SP_OVERMAP		<= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( PVDPS0RESETREQ = NOT FF_VDPS0RESETACK )THEN
				-- S#0���ǂݍ��܂��܂ŃN���A���Ȃ�
				FF_SP_OVERMAP		<= '0';
			ELSIF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 0 )THEN
					-- INITIALIZE
				ELSIF( EIGHTDOTSTATE = "110" )THEN
					IF( FF_Y_TEST_EN = '1' AND W_TARGET_SP_EN = '1' AND W_SP_OVERMAP = '1' AND W_SP_OFF = '0' )THEN
						FF_SP_OVERMAP <= '1';
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- [Y_TEST]������������߂��X�v���C�g�M�� 
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_SP_OVERMAP_NUM	<= (OTHERS => '1');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( PVDPS0RESETREQ = NOT FF_VDPS0RESETACK )THEN
				FF_SP_OVERMAP_NUM	<= (OTHERS => '1');
			ELSIF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 0 )THEN
					-- INITIALIZE
				ELSIF( EIGHTDOTSTATE = "110" )THEN
					-- JP: ������������߂��X�v���C�g�ԍ����i�[�����BOVERMAP�Ƃ͌���Ȃ��B
					-- JP: �������A���ł� OVERMAP �Œl���m�肵�Ă���ꍇ�͍X�V���Ȃ��B
					IF( FF_Y_TEST_EN = '1' AND W_TARGET_SP_EN = '1' AND W_SP_OVERMAP = '1' AND W_SP_OFF = '0' AND FF_SP_OVERMAP = '0' )THEN
						FF_SP_OVERMAP_NUM <= FF_Y_TEST_SP_NUM;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- Y�e�X�g�p�� VRAM�ǂݏo���A�h���X 
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_Y_TEST_VRAM_ADDR <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "11" )THEN
				FF_Y_TEST_VRAM_ADDR <= SPATTRTBLBASEADDR & FF_Y_TEST_SP_NUM & "00";
			END IF;
		END IF;
	END PROCESS;

	-----------------------------------------------------------------------------
	-- PREPARE SPRITE
	--
	-- JP: ��ʕ`�撆			: 8�h�b�g�`�悷��Ԃ�1�v���[���A�X�v���C�g��Y���W���������A
	-- JP:						  �\�����ׂ��X�v���C�g�����X�g�A�b�v����B
	-- JP: ��ʔ�`�撆			: ���X�g�A�b�v�����X�v���C�g�̏����W�߁Ainforam�Ɋi�[
	-- JP: ���̉�ʕ`�撆		: inforam�Ɋi�[���ꂽ�������ɁA���C���o�b�t�@�ɕ`��
	-- JP: ���̎��̉�ʕ`�撆	: ���C���o�b�t�@�ɕ`�悳�ꂽ�G���o�͂��A��ʕ`��ɍ�����
	-----------------------------------------------------------------------------

	-- READ TIMING OF SPRITE ATTRIBUTE TABLE
	SPATTRIB_ADDR		<=	SPATTRTBLBASEADDR & SPPREPAREPLANENUM;
	READVRAMADDRPTREAD	<=
		SPPTNGENETBLBASEADDR & SPPREPAREPATTERNNUM( 7 DOWNTO 0 ) & SPPREPARELINENUM( 2 DOWNTO 0 )		WHEN( REG_R1_SP_SIZE = '0' )ELSE	-- 8X8 MODE
		SPPTNGENETBLBASEADDR & SPPREPAREPATTERNNUM( 7 DOWNTO 2 ) & SPPREPAREXPOS & SPPREPARELINENUM( 3 DOWNTO 0 );							-- 16X16 MODE
	READVRAMADDRCREAD	<=	SPATTRIB_ADDR & "11" WHEN( SPMODE2 = '0' )ELSE
							SPATTRTBLBASEADDR(9 DOWNTO 3) & (NOT SPATTRTBLBASEADDR(2)) & SPPREPAREPLANENUM & SPPREPARELINENUM;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			IRAMADRPREPARE <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			-- PREPAREING
			IF( DOTSTATE = "11" )THEN
				CASE EIGHTDOTSTATE IS
				WHEN "000" =>								-- Y READ
					IRAMADRPREPARE <= SPATTRIB_ADDR & "00";
				WHEN "001" =>								-- X READ
					IRAMADRPREPARE <= SPATTRIB_ADDR & "01";
				WHEN "010" =>								-- PATTERN NUM READ
					IRAMADRPREPARE <= SPATTRIB_ADDR & "10";
				WHEN "011" | "100" =>						-- PATTERN READ
					IRAMADRPREPARE <= READVRAMADDRPTREAD;
				WHEN "101" =>								-- COLOR READ
					IRAMADRPREPARE <= READVRAMADDRCREAD;
				WHEN OTHERS =>
					NULL;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			CASE DOTSTATE IS
				WHEN "11" =>
					SPINFORAMWE <= '0';
				WHEN "01" =>
					IF( SPSTATE = SPSTATE_PREPARE )THEN
						IF( EIGHTDOTSTATE = "110" )THEN
							SPINFORAMWE <= '1';
						END IF;
					ELSE
						SPINFORAMWE <= '0';
					END IF;
				WHEN OTHERS =>
					NULL;
			END CASE;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			SPPREPARELOCALPLANENUM	<= (OTHERS => '0');
			SPPREPAREEND			<= '0';

		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			-- PREPAREING
			CASE DOTSTATE IS
				WHEN "01" =>
					IF( SPSTATE = SPSTATE_PREPARE ) THEN
						CASE EIGHTDOTSTATE IS
							WHEN "001" =>								-- Y READ
								-- JP: �X�v���C�g�̉��s�ڂ��Y���������o���Ă���
								IF( REG_R1_SP_ZOOM = '0' ) THEN
									SPPREPARELINENUM	<= W_SPLISTUPY(3 DOWNTO 0);
								ELSE
									SPPREPARELINENUM	<= W_SPLISTUPY(4 DOWNTO 1);
								END IF;
							WHEN "010" =>								-- X READ
								SPINFORAMX_IN <= '0' & PRAMDAT;
							WHEN "011" =>								-- PATTERN NUM READ
								SPPREPAREPATTERNNUM <= PRAMDAT;
							WHEN "100" =>								-- PATTERN READ LEFT
								SPINFORAMPATTERN_IN(15 DOWNTO 8) <= PRAMDAT;
							WHEN "101" =>								-- PATTERN READ RIGHT
								IF( REG_R1_SP_SIZE = '0' ) THEN
									-- 8X8 MODE
									SPINFORAMPATTERN_IN( 7 DOWNTO 0) <= (OTHERS => '0');
								ELSE
									-- 16X16 MODE
									SPINFORAMPATTERN_IN( 7 DOWNTO 0) <= PRAMDAT;
								END IF;
							WHEN "110" =>								-- COLOR READ
								-- COLOR
								SPINFORAMCOLOR_IN <= PRAMDAT(3 DOWNTO 0);
								-- CC	�D�揇�ʃr�b�g (1: �D�揇�ʖ���, 0: �D�揇�ʂ���)
								IF(SPMODE2 = '1') THEN
									SPINFORAMCC_IN <= PRAMDAT(6);
								ELSE
									SPINFORAMCC_IN <= '0';
								END IF;
								-- IC	�Փˌ��m�r�b�g (1: ���m���Ȃ�, 0: ���m����)
								SPINFORAMIC_IN <= PRAMDAT(5) AND SPMODE2;
								-- EC	32�h�b�g���V�t�g (1: ����, 0: ���Ȃ�)
								IF( PRAMDAT(7) = '1' ) THEN
									SPINFORAMX_IN <= SPINFORAMX_IN - 32;
								END IF;
								
								-- IF ALL OF THE SPRITES LIST-UPED ARE READED,
								-- THE SPRITES LEFT SHOULD NOT BE DRAWN.
								IF( SPPREPARELOCALPLANENUM >= FF_Y_TEST_LISTUP_ADDR )THEN
									SPINFORAMPATTERN_IN <= (OTHERS => '0');
								END IF;
							WHEN "111" =>
								SPPREPARELOCALPLANENUM <= SPPREPARELOCALPLANENUM + 1;
								IF( SPPREPARELOCALPLANENUM = 7 ) THEN
									SPPREPAREEND <= '1';
								END IF;
							WHEN OTHERS =>
								NULL;
						END CASE;
					ELSE
						SPPREPARELOCALPLANENUM <= (OTHERS => '0');
						SPPREPAREEND <= '0';
					END IF;
				WHEN OTHERS =>
					NULL;
			END CASE;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( SPSTATE = SPSTATE_PREPARE )THEN
					IF( EIGHTDOTSTATE = "111" )THEN
						SPPREPAREPLANENUM <= SPRENDERPLANES( CONV_INTEGER( SPPREPARELOCALPLANENUM + 1 ) );
					END IF;
				ELSE
					SPPREPAREPLANENUM <= SPRENDERPLANES(0);
				END IF;
			END IF;
		END IF;
	END PROCESS;

	-------------------------------------------------------------------------
	-- DRAWING TO LINE BUFFER.
	--
	-- DOTCOUNTERX( 4 DOWNTO 0 )
	--   0... 31    DRAW LOCAL PLANE#0 TO LINE BUFFER
	--  32... 63    DRAW LOCAL PLANE#1 TO LINE BUFFER
	--     :                         :
	-- 224...255    DRAW LOCAL PLANE#7 TO LINE BUFFER
	-------------------------------------------------------------------------
	PROCESS( CLK21M, RESET )
		VARIABLE SPCC0FOUNDV						: STD_LOGIC;
		VARIABLE LASTCC0LOCALPLANENUMV				: STD_LOGIC_VECTOR(2 DOWNTO 0);
		VARIABLE SPDRAWXV							: STD_LOGIC_VECTOR(8 DOWNTO 0);	 -- -32 - 287 (=256+31)
		VARIABLE VDPS0SPCOLLISIONINCIDENCEV			: STD_LOGIC;
		VARIABLE VDPS3S4SPCOLLISIONXV				: STD_LOGIC_VECTOR(8 DOWNTO 0);
		VARIABLE VDPS5S6SPCOLLISIONYV				: STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF( RESET ='1' ) THEN
			SPLINEBUFDRAWWE				<= '0';					-- JP: ���C���o�b�t�@�ւ̏������݃C�l�[�u�� 
			SPPREDRAWEND				<= '0';
			SPDRAWPATTERN				<= (OTHERS => '0');
			SPLINEBUFDRAWCOLOR			<= (OTHERS => '0');
			SPLINEBUFDRAWX				<= (OTHERS => '0');
			SPDRAWCOLOR					<= (OTHERS => '0');

			VDPS0SPCOLLISIONINCIDENCEV	:= '0';					-- JP: �X�v���C�g���Փ˂������ǂ����������t���O 
			VDPS3S4SPCOLLISIONXV		:= (OTHERS => '0');
			VDPS5S6SPCOLLISIONYV		:= (OTHERS => '0');
			SPCC0FOUNDV					:= '0';
			LASTCC0LOCALPLANENUMV		:= (OTHERS => '0');

		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( SPSTATE = SPSTATE_YTEST_DRAW ) THEN
				CASE DOTSTATE IS
					WHEN "10" =>
						-- JP: �����P�ʂ̎n�܂� 
						SPLINEBUFDRAWWE <= '0';
					WHEN "00" =>
						-- JP: 
						IF( DOTCOUNTERX(4 DOWNTO 0) = 1 ) THEN
							SPDRAWPATTERN	<= SPINFORAMPATTERN_OUT;
							SPDRAWXV		:= SPINFORAMX_OUT;
						ELSE
							IF( (REG_R1_SP_ZOOM = '0') OR (DOTCOUNTERX(0) = '1') ) THEN
								SPDRAWPATTERN <= SPDRAWPATTERN(14 DOWNTO 0) & "0";
							END IF;
							SPDRAWXV := SPDRAWX + 1;
						END IF;
						SPDRAWX <= SPDRAWXV;
						SPLINEBUFDRAWX <= SPDRAWXV(7 DOWNTO 0);
					WHEN "01" =>
						SPDRAWCOLOR <= SPINFORAMCOLOR_OUT;
					WHEN "11" =>
						IF( SPINFORAMCC_OUT = '0' ) THEN
							LASTCC0LOCALPLANENUMV := SPPREDRAWLOCALPLANENUM;
							SPCC0FOUNDV := '1';
						END IF;
						IF( (SPDRAWPATTERN(15) = '1') AND (SPDRAWX(8) = '0') AND (SPPREDRAWEND = '0') AND
								((REG_R8_COL0_ON = '1') OR (SPDRAWCOLOR /= 0)) ) THEN
							-- JP: �X�v���C�g�̃h�b�g��`��
							-- JP: ���C���o�b�t�@��7�r�b�g�ڂ́A���炩�̐F��`�悵������'1'�ɂȂ�B
							-- JP: ���C���o�b�t�@��6-4�r�b�g�ڂ͂����ɕ`�悳��Ă���h�b�g�̃��[�J���v���[���ԍ�
							-- JP: (�F��������Ă���Ƃ��͐e�ƂȂ�CC='0'�̃X�v���C�g�̃��[�J���v���[���ԍ�)������B
							-- JP: �܂�ALASTCC0LOCALPLANENUMV�����̔ԍ��Ɠ������Ƃ���OR�������Ă悢���ɂȂ�B
							IF( (SPLINEBUFDRAWDATA_OUT(7) = '0') AND (SPCC0FOUNDV = '1') ) THEN
								-- JP: �����`����Ă��Ȃ�(�r�b�g7��'0')�Ƃ��A���̃h�b�g�ɏ��߂Ă�
								-- JP: �X�v���C�g���`�悳���B�������ACC='0'�̃X�v���C�g�����ꃉ�C����ɂ܂�
								-- JP: ����Ă��Ȃ����͕`�悵�Ȃ�
								SPLINEBUFDRAWCOLOR <= ("1" & LASTCC0LOCALPLANENUMV & SPDRAWCOLOR);
								SPLINEBUFDRAWWE <= '1';
							ELSIF( (SPLINEBUFDRAWDATA_OUT(7) = '1') AND (SPINFORAMCC_OUT = '1') AND
										 (SPLINEBUFDRAWDATA_OUT(6 DOWNTO 4) = LASTCC0LOCALPLANENUMV) ) THEN
								-- JP: ���ɊG���`����Ă��邪�ACC��'1'�ł����̃h�b�g�ɕ`����Ă���X�v���C�g��
								-- JP: LOCALPLANENUM�� LASTCC0LOCALPLANENUMV�Ɠ��������́A���C���o�b�t�@����
								-- JP: ���n�f�[�^��ǂ݁A���������F�Ƙ_���a���惊�A�����߂��B
								SPLINEBUFDRAWCOLOR <= SPLINEBUFDRAWDATA_OUT OR ("0000" & SPDRAWCOLOR);
								SPLINEBUFDRAWWE <= '1';
							ELSIF( (SPLINEBUFDRAWDATA_OUT(7) = '1') AND (SPINFORAMIC_OUT = '0') ) THEN
								SPLINEBUFDRAWCOLOR <= SPLINEBUFDRAWDATA_OUT;
								-- JP: �X�v���C�g���ՓˁB
								-- SPRITE COLISION OCCURED
								VDPS0SPCOLLISIONINCIDENCEV := '1';
								VDPS3S4SPCOLLISIONXV := SPDRAWX + 12;
								-- NOTE: DRAWING LINE IS PREVIOUS LINE.
								VDPS5S6SPCOLLISIONYV := FF_CUR_Y + 7;
							END IF;
						END IF;
						--
						IF( DOTCOUNTERX = 0 ) THEN
							SPPREDRAWLOCALPLANENUM <= (OTHERS => '0');
							SPPREDRAWEND <= '0';
							LASTCC0LOCALPLANENUMV := (OTHERS => '0');
							SPCC0FOUNDV := '0';
						ELSIF( DOTCOUNTERX(4 DOWNTO 0) = 0 ) THEN
							SPPREDRAWLOCALPLANENUM <= SPPREDRAWLOCALPLANENUM + 1;
							IF( SPPREDRAWLOCALPLANENUM = 7 ) THEN
								SPPREDRAWEND <= '1';
							END IF;
						END IF;
					WHEN OTHERS => NULL;
				END CASE;
			END IF;

			-- STATUS REGISTER
			IF( PVDPS0RESETREQ /= FF_VDPS0RESETACK ) THEN
				FF_VDPS0RESETACK <= PVDPS0RESETREQ;
				VDPS0SPCOLLISIONINCIDENCEV := '0';
			END IF;
			IF( PVDPS5RESETREQ /= FF_VDPS5RESETACK ) THEN
				FF_VDPS5RESETACK <= PVDPS5RESETREQ;
				VDPS3S4SPCOLLISIONXV := (OTHERS => '0');
				VDPS5S6SPCOLLISIONYV := (OTHERS => '0');
			END IF;

			PVDPS0SPCOLLISIONINCIDENCE <= VDPS0SPCOLLISIONINCIDENCEV;
			PVDPS3S4SPCOLLISIONX	<= VDPS3S4SPCOLLISIONXV;
			PVDPS5S6SPCOLLISIONY	<= VDPS5S6SPCOLLISIONYV;
		END IF;
	END PROCESS;

	-----------------------------------------------------------------------------
	-- JP: ��ʂւ̃����_�����O�BVDP�G���e�B�e�B��DOTSTATE="11"�̎��ɒl���擾�ł���悤�ɁA
	-- JP: "01"�̃^�C�~���O�ŏo�͂���B
	-----------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			SPLINEBUFDISPX	<= (OTHERS => '0');
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( DOTSTATE = "10" )THEN
				-- JP: DOTCOUNTER�Ǝ��ۂ̕\��(�J���[�R�[�h�̏o��)��8�h�b�g����Ă���
				IF( DOTCOUNTERX = 8 )THEN
					SPLINEBUFDISPX <= ("00000" & REG_R27_H_SCROLL);
				ELSE
					SPLINEBUFDISPX <= SPLINEBUFDISPX + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' ) THEN
			SPWINDOWX <= '0';
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( DOTSTATE = "10" )THEN
				-- JP: DOTCOUNTER�Ǝ��ۂ̕\��(�J���[�R�[�h�̏o��)��8�h�b�g����Ă���
				IF( DOTCOUNTERX = 8 )THEN
					SPWINDOWX <= '1';
				ELSIF( SPLINEBUFDISPX = X"FF" ) THEN
					SPWINDOWX <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' ) THEN
			SPLINEBUFDISPWE <= '0';
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( DOTSTATE = "10" )THEN
				SPLINEBUFDISPWE <= '0';
			ELSIF( DOTSTATE = "11" AND SPWINDOWX = '1' )THEN
				-- CLEAR DISPLAYED DOT
				SPLINEBUFDISPWE <= '1';
			END IF;
		END IF;
	END PROCESS;

	-- JP: �E�B���h�E�ŕ\�����J�b�g���� 
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' ) THEN
			SPCOLOROUT	<= '0';						-- JP:  0=����, 1=�X�v���C�g�h�b�g 
			SPCOLORCODE <= (OTHERS => '0');			-- JP:  SPCOLOROUT=1 �̎��̃X�v���C�g�h�b�g�F�ԍ�
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( DOTSTATE = "01" )THEN
				IF( SPWINDOWX = '1' ) THEN
					SPCOLOROUT	<= SPLINEBUFDISPDATA_OUT( 7 );
					SPCOLORCODE <= SPLINEBUFDISPDATA_OUT( 3 DOWNTO 0 );
				ELSE
					SPCOLOROUT	<= '0';
					SPCOLORCODE <= (OTHERS => '0');
				END IF;
			END IF;
		END IF;
	END PROCESS;

END RTL;

