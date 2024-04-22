--
--  VDP_NTSC.vhd
--   VDP_NTSC sync signal generator.
--
--  Copyright (C) 2006 Kunihiko Ohnaka
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
-- 13th,October,2003 created by Kunihiko Ohnaka
-- JP: VDP�̃R�A�̎����ƕ\���f�o�C�X�ւ̏o�͂�ʃ\�[�X�ɂ����D
--
-- ?th,August,2006 modified by Kunihiko Ohnaka
--   - Move the equalization pulse generator from
--     vdp.vhd.
--
-- 29th,October,2006 modified by Kunihiko Ohnaka
--   - Insert the license text.
--   - Add the document part below.
--
-- 23th,March,2008 modified by t.hara
-- JP: ���t�@�N�^�����O, NTSC �� PAL �̃^�C�~���O������H�𓝍�
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: ESE-VDP�R�A(vdp.vhd)�����������r�f�I�M�����ANTSC/PAL��
-- JP: �^�C�~���O�ɍ����������M������щf���M���ɕϊ����܂��B
-- JP: ESE-VDP�R�A��NTSC���[�h���� NTSC/PAL�̃^�C�~���O�ŉf��
-- JP: �M���␂�������M���𐶐����邽�߁A�{���W���[���ł�
-- JP: ���������M���ɓ����p���X��}�����鏈���������s����
-- JP: ���܂��B
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE WORK.VDP_PACKAGE.ALL;

ENTITY VDP_NTSC_PAL IS
	PORT(
		CLK21M				: IN	STD_LOGIC;
		RESET				: IN	STD_LOGIC;
		-- MODE
		PALMODE				: IN	STD_LOGIC;
		INTERLACEMODE		: IN	STD_LOGIC;
		-- VIDEO INPUT
		VIDEORIN			: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		VIDEOGIN			: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		VIDEOBIN			: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		VIDEOVSIN_N			: IN	STD_LOGIC;
		HCOUNTERIN			: IN	STD_LOGIC_VECTOR( 10 DOWNTO 0 );
		VCOUNTERIN			: IN	STD_LOGIC_VECTOR( 10 DOWNTO 0 );
		-- VIDEO OUTPUT
		VIDEOROUT			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		VIDEOGOUT			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		VIDEOBOUT			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		VIDEOHSOUT_N		: OUT	STD_LOGIC;
		VIDEOVSOUT_N		: OUT	STD_LOGIC
	);
END VDP_NTSC_PAL;

ARCHITECTURE RTL OF VDP_NTSC_PAL IS
	TYPE TYPSSTATE IS (SSTATE_A, SSTATE_B, SSTATE_C, SSTATE_D);
	SIGNAL FF_SSTATE		: TYPSSTATE;
	SIGNAL FF_HSYNC_N		: STD_LOGIC;

	SIGNAL W_MODE			: STD_LOGIC_VECTOR(  1 DOWNTO 0 );
	SIGNAL W_STATE_A1_FULL	: STD_LOGIC_VECTOR( 10 DOWNTO 0 );
	SIGNAL W_STATE_A2_FULL	: STD_LOGIC_VECTOR( 10 DOWNTO 0 );
	SIGNAL W_STATE_B_FULL	: STD_LOGIC_VECTOR( 10 DOWNTO 0 );
	SIGNAL W_STATE_C_FULL	: STD_LOGIC_VECTOR( 10 DOWNTO 0 );
BEGIN

	-- MODE
	W_MODE	<= PALMODE & INTERLACEMODE;
	WITH( W_MODE )SELECT W_STATE_A1_FULL <=
		"01000001100"	WHEN "00",	-- 524
		"01000001101"	WHEN "01",	-- 525
		"01001110010"	WHEN "10",	-- 626
		"01001110001"	WHEN "11",	-- 625
		(OTHERS => 'X')	WHEN OTHERS;

	WITH( W_MODE )SELECT W_STATE_A2_FULL <=
		"01000011000"	WHEN "00",	-- 524+12
		"01000011001"	WHEN "01",	-- 525+12
		"01001111110"	WHEN "10",	-- 626+12
		"01001111101"	WHEN "11",	-- 625+12
		(OTHERS => 'X')	WHEN OTHERS;

	WITH( W_MODE )SELECT W_STATE_B_FULL <=
		"01000010010"	WHEN "00",	-- 524+6
		"01000010011"	WHEN "01",	-- 525+6
		"01001111000"	WHEN "10",	-- 626+6
		"01001110111"	WHEN "11",	-- 625+6
		(OTHERS => 'X')	WHEN OTHERS;

	WITH( W_MODE )SELECT W_STATE_C_FULL <=
		"01000011110"	WHEN "00",	-- 524+18
		"01000011111"	WHEN "01",	-- 525+18
		"01010000100"	WHEN "10",	-- 626+18
		"01010000011"	WHEN "11",	-- 625+18
		(OTHERS => 'X')	WHEN OTHERS;

	-- STATE
	PROCESS( RESET, CLK21M )
	BEGIN
		IF (RESET = '1') THEN
			FF_SSTATE <= SSTATE_A;
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF(		(VCOUNTERIN = 0) OR
					(VCOUNTERIN = 12) OR
					(VCOUNTERIN = W_STATE_A1_FULL) OR
					(VCOUNTERIN = W_STATE_A2_FULL) )THEN
				FF_SSTATE <= SSTATE_A;
			ELSIF(	(VCOUNTERIN = 6) OR
					(VCOUNTERIN = W_STATE_B_FULL) )THEN
				FF_SSTATE <= SSTATE_B;
			ELSIF(	(VCOUNTERIN = 18) OR
					(VCOUNTERIN = W_STATE_C_FULL) )THEN
				FF_SSTATE <= SSTATE_C;
			END IF;
		END IF;
	END PROCESS;

	-- GENERATE H SYNC PULSE
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_HSYNC_N <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( FF_SSTATE = SSTATE_A )THEN
				IF( (HCOUNTERIN = 1) OR (HCOUNTERIN = CLOCKS_PER_LINE/2+1) ) THEN
					FF_HSYNC_N <= '0';						 -- PULSE ON
				ELSIF( (HCOUNTERIN = 51) OR (HCOUNTERIN = CLOCKS_PER_LINE/2+51) ) THEN
					FF_HSYNC_N <= '1';						 -- PULSE OFF
				END IF;
			ELSIF( FF_SSTATE = SSTATE_B )THEN
				IF( (HCOUNTERIN = CLOCKS_PER_LINE-100+1 ) OR (HCOUNTERIN = CLOCKS_PER_LINE/2-100+1) ) THEN
					FF_HSYNC_N <= '0';						 -- PULSE ON
				ELSIF( (HCOUNTERIN = 1) OR (HCOUNTERIN = CLOCKS_PER_LINE/2+1) ) THEN
					FF_HSYNC_N <= '1';						 -- PULSE OFF
				END IF;
			ELSIF( FF_SSTATE = SSTATE_C )THEN
				IF( HCOUNTERIN = 1 )THEN
					FF_HSYNC_N <= '0';						 -- PULSE ON
				ELSIF( HCOUNTERIN = 101 )THEN
					FF_HSYNC_N <= '1';						 -- PULSE OFF
				END IF;
			END IF;
		END IF;
	END PROCESS;

	VIDEOHSOUT_N	<= FF_HSYNC_N;
	VIDEOVSOUT_N	<= VIDEOVSIN_N;
	VIDEOROUT		<= VIDEORIN;
	VIDEOGOUT		<= VIDEOGIN;
	VIDEOBOUT		<= VIDEOBIN;
END RTL;
