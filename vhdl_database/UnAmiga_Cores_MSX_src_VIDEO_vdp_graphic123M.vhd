--
--  vdp_graphic123M.vhd
--    Imprementation of Graphic Mode 1,2,3 and Multicolor Mode.
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
-- 12th,August,2006 created by Kunihiko Ohnaka
-- JP: VDP�̃R�A�̎����ƃX�N���[�����[�h�̎����𕪗�����
--
-- 29th,October,2006 modified by Kunihiko Ohnaka
--   - Insert the license text.
--   - Add the document part below.
--
-- 16th, March, 2008 Refactoring by t.hara
-- JP: ���t�@�N�^�����O, VDP_PACKAGE �̎Q�Ƃ��폜
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: GRAPHIC���[�h1,2,3����� MULTICOLOR���[�h�̃��C��������H�ł��B
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY VDP_GRAPHIC123M IS
	PORT(
		CLK21M						: IN	STD_LOGIC;		--	21.477MHZ
		RESET						: IN	STD_LOGIC;

		-- CONTROLL SIGNALS
		DOTSTATE					: IN	STD_LOGIC_VECTOR(  1 DOWNTO 0 );
		EIGHTDOTSTATE				: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );
		DOTCOUNTERX					: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		DOTCOUNTERY					: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );

		VDPMODEMULTI				: IN	STD_LOGIC;
		VDPMODEGRAPHIC1				: IN	STD_LOGIC;
		VDPMODEGRAPHIC2				: IN	STD_LOGIC;
		VDPMODEGRAPHIC3				: IN	STD_LOGIC;

		-- REGISTERS
		REG_R2_PT_NAM_ADDR			: IN	STD_LOGIC_VECTOR(  6 DOWNTO 0 );
		REG_R4_PT_GEN_ADDR			: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		REG_R10R3_COL_ADDR			: IN	STD_LOGIC_VECTOR( 10 DOWNTO 0 );
		REG_R26_H_SCROLL			: IN	STD_LOGIC_VECTOR(  8 DOWNTO 3 );
		REG_R27_H_SCROLL			: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );
		--
		PRAMDAT						: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		PRAMADR						: OUT	STD_LOGIC_VECTOR( 16 DOWNTO 0 );

		PCOLORCODE					: OUT	STD_LOGIC_VECTOR(  3 DOWNTO 0 )
	);
END VDP_GRAPHIC123M;

ARCHITECTURE RTL OF VDP_GRAPHIC123M IS
	SIGNAL FF_REQ_ADDR				: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL FF_COL_CODE				: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL FF_PAT_NUM				: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PRE_PAT_GEN			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PRE_PAT_COL			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PAT_GEN				: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PAT_COL				: STD_LOGIC_VECTOR(  7 DOWNTO 0 );

	SIGNAL REQ_PAT_NAME_TBL_ADDR	: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL REQ_PAT_GEN_TBL_ADDR		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL REQ_PAT_COL_TBL_ADDR		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL REQ_ADDR					: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL COL_HL_SEL				: STD_LOGIC;
	SIGNAL COL_CODE					: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL EIGHTDOTSTATE_DEC		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL W_DOTCOUNTERX			: STD_LOGIC_VECTOR(  7 DOWNTO 3 );
BEGIN

	W_DOTCOUNTERX <= REG_R26_H_SCROLL( 7 DOWNTO 3 ) + DOTCOUNTERX(7 DOWNTO 3);

	-- ADDRESS DECODE
	REQ_PAT_NAME_TBL_ADDR<=	(REG_R2_PT_NAM_ADDR & DOTCOUNTERY(7 DOWNTO 3) & W_DOTCOUNTERX );

	REQ_PAT_GEN_TBL_ADDR <=	(REG_R4_PT_GEN_ADDR & FF_PAT_NUM & DOTCOUNTERY(2 DOWNTO 0))	WHEN( VDPMODEGRAPHIC1 = '1' )ELSE
							(REG_R4_PT_GEN_ADDR(5 DOWNTO 2) & DOTCOUNTERY(7 DOWNTO 6) & FF_PAT_NUM & DOTCOUNTERY(2 DOWNTO 0) ) AND
							("1111" & REG_R4_PT_GEN_ADDR(1 DOWNTO 0) & "11111111" & "111");

	REQ_PAT_COL_TBL_ADDR <=	(REG_R4_PT_GEN_ADDR & FF_PAT_NUM & DOTCOUNTERY(4 DOWNTO 2))	WHEN( VDPMODEMULTI = '1' )ELSE
							(REG_R10R3_COL_ADDR & '0' & FF_PAT_NUM( 7 DOWNTO 3 ))			WHEN( VDPMODEGRAPHIC1 = '1' )ELSE
							(REG_R10R3_COL_ADDR(10 DOWNTO 7) & DOTCOUNTERY(7 DOWNTO 6) & FF_PAT_NUM & DOTCOUNTERY(2 DOWNTO 0)) AND
							("1111" & REG_R10R3_COL_ADDR(6 DOWNTO 0) & "111111" );

	-- DRAM READ REQUEST
	WITH( EIGHTDOTSTATE ) SELECT EIGHTDOTSTATE_DEC <=
		"0001"	WHEN "000",
		"0010"	WHEN "001",
		"0100"	WHEN "010",
		"1000"	WHEN "011",
		"0000"	WHEN OTHERS;

	WITH( EIGHTDOTSTATE ) SELECT REQ_ADDR <=
		REQ_PAT_NAME_TBL_ADDR	WHEN "000",
		REQ_PAT_GEN_TBL_ADDR	WHEN "001",
		REQ_PAT_COL_TBL_ADDR	WHEN "010",
		FF_REQ_ADDR				WHEN OTHERS;

	-- GENERATE PIXEL COLOR NUMBER
	COL_HL_SEL	<=	NOT EIGHTDOTSTATE(2)		WHEN( VDPMODEMULTI = '1' )ELSE
					FF_PAT_GEN(7);
	COL_CODE	<=	FF_PAT_COL( 7 DOWNTO 4 )	WHEN( COL_HL_SEL = '1' )ELSE
					FF_PAT_COL( 3 DOWNTO 0 );

	-- OUT ASSIGNMENT
	PRAMADR		<= FF_REQ_ADDR;
	PCOLORCODE	<= FF_COL_CODE;

	-- FF
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PAT_COL <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "00" AND EIGHTDOTSTATE_DEC(0) = '1' )THEN
				FF_PAT_COL <= FF_PRE_PAT_COL;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PAT_GEN <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "00" AND EIGHTDOTSTATE_DEC(0) = '1' )THEN
				FF_PAT_GEN <= FF_PRE_PAT_GEN;
			ELSIF( DOTSTATE = "01" )THEN
				FF_PAT_GEN <= FF_PAT_GEN( 6 DOWNTO 0 ) & '0';
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PAT_NUM <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" AND EIGHTDOTSTATE_DEC(1) = '1' )THEN
				FF_PAT_NUM <= PRAMDAT;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PRE_PAT_GEN <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" AND EIGHTDOTSTATE_DEC(2) = '1' )THEN
				FF_PRE_PAT_GEN <= PRAMDAT;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PRE_PAT_COL <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" AND EIGHTDOTSTATE_DEC(3) = '1' )THEN
				FF_PRE_PAT_COL <= PRAMDAT;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_COL_CODE <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				FF_COL_CODE <= COL_CODE;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_REQ_ADDR <= ( OTHERS => '0' );
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "11" )THEN
				FF_REQ_ADDR <= REQ_ADDR;
			END IF;
		END IF;
	END PROCESS;

END RTL;
