--
--  vdp_colordec.vhd
--
--  Copyright (C) 2000-2006 Kunihiko Ohnaka
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
------------------------------------------------------------------------------
--	21th,March,2008
--		JP: VDP.VHD ���番�� by t.hara
--
--	22th,March,2008
--		JP: �s�v�ȐM���Ԃ̑��ւ����� by t.hara

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY VDP_COLORDEC IS
	PORT(
		RESET				: IN	STD_LOGIC;
		CLK21M				: IN	STD_LOGIC;

		DOTSTATE			: IN	STD_LOGIC_VECTOR(  1 DOWNTO 0 );

		PPALETTEADDR_OUT	: OUT	STD_LOGIC_VECTOR(  3 DOWNTO 0 );
		PALETTEDATARB_OUT	: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		PALETTEDATAG_OUT	: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );

		VDPMODETEXT1		: IN	STD_LOGIC;
		VDPMODETEXT2		: IN	STD_LOGIC;
		VDPMODEMULTI		: IN	STD_LOGIC;
		VDPMODEGRAPHIC1		: IN	STD_LOGIC;
		VDPMODEGRAPHIC2		: IN	STD_LOGIC;
		VDPMODEGRAPHIC3		: IN	STD_LOGIC;
		VDPMODEGRAPHIC4		: IN	STD_LOGIC;
		VDPMODEGRAPHIC5		: IN	STD_LOGIC;
		VDPMODEGRAPHIC6		: IN	STD_LOGIC;
		VDPMODEGRAPHIC7		: IN	STD_LOGIC;

		WINDOW				: IN	STD_LOGIC;							-- JP: �L���\���̈悾�� 1 �ɂȂ� 
		SPRITECOLOROUT		: IN	STD_LOGIC;							-- JP: �X�v���C�g�̉�f�ʒu���� 1 �ɂȂ� 
		COLORCODET12		: IN	STD_LOGIC_VECTOR(  3 DOWNTO 0 );	-- JP: TEXT1, 2 �̐F 
		COLORCODEG123M		: IN	STD_LOGIC_VECTOR(  3 DOWNTO 0 );	-- JP: GRAPHIC1,2,3,MOSAIC �̐F 
		COLORCODEG4567		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );	-- JP: GRAPHIC4,5,6,7 �̐F 
		COLORCODESPRITE		: IN	STD_LOGIC_VECTOR(  3 DOWNTO 0 );	-- JP: �X�v���C�g�̐F 
		P_YJK_R				: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		P_YJK_G				: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		P_YJK_B				: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		P_YJK_EN			: IN	STD_LOGIC;

		PVIDEOR_VDP			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );	-- JP: ���j�^�֏o�͂���F 
		PVIDEOG_VDP			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		PVIDEOB_VDP			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		-- REGISTERS 
		REG_R1_DISP_ON		: IN	STD_LOGIC;
		REG_R7_FRAME_COL	: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		REG_R8_COL0_ON		: IN	STD_LOGIC;
		REG_R25_YJK			: IN	STD_LOGIC
	);
END VDP_COLORDEC;

ARCHITECTURE RTL OF VDP_COLORDEC IS
	-- D-FLIPFLOP
	SIGNAL FF_VIDEO_R 			: STD_LOGIC_VECTOR(  5 DOWNTO 0 );
	SIGNAL FF_VIDEO_G			: STD_LOGIC_VECTOR(  5 DOWNTO 0 );
	SIGNAL FF_VIDEO_B			: STD_LOGIC_VECTOR(  5 DOWNTO 0 );
	SIGNAL FF_GRP7_COLOR_CODE	: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PALETTE_ADDR		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL FF_PALETTE_ADDR_G5	: STD_LOGIC_VECTOR(  1 DOWNTO 0 );
	SIGNAL FF_YJK_R				: STD_LOGIC_VECTOR(  5 DOWNTO 0 );
	SIGNAL FF_YJK_G				: STD_LOGIC_VECTOR(  5 DOWNTO 0 );
	SIGNAL FF_YJK_B				: STD_LOGIC_VECTOR(  5 DOWNTO 0 );
	SIGNAL FF_YJK_EN			: STD_LOGIC;
	SIGNAL FF_SPRITECOLOROUT	: STD_LOGIC;
	-- WIRE
	SIGNAL W_EVEN_DOTSTATE		: STD_LOGIC;
	SIGNAL W_GRP7_SPRITE_COLOR	: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL W_FORE_COLOR			: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL W_BACK_COLOR			: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL W_GRP7_COLOR			: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL W_PALETTE_ADDR		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
BEGIN

	PPALETTEADDR_OUT	<=	FF_PALETTE_ADDR		WHEN( VDPMODEGRAPHIC5 = '0' )ELSE
							"00" & FF_PALETTE_ADDR_G5;

	PVIDEOR_VDP			<= FF_VIDEO_R;
	PVIDEOG_VDP			<= FF_VIDEO_G;
	PVIDEOB_VDP			<= FF_VIDEO_B;

	W_EVEN_DOTSTATE		<= '1' WHEN( DOTSTATE = "00" OR DOTSTATE = "11" )ELSE
						   '0';

	-- OUTPUT DATA LATCH
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_VIDEO_R <= "000000";
			FF_VIDEO_G <= "000000";
			FF_VIDEO_B <= "000000";
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_EVEN_DOTSTATE = '1' )THEN
				IF( VDPMODEGRAPHIC7 = '1' AND FF_YJK_EN = '1' AND FF_SPRITECOLOROUT = '0' )THEN
					--	YJK MODE
					FF_VIDEO_R <= FF_YJK_R;
					FF_VIDEO_G <= FF_YJK_G;
					FF_VIDEO_B <= FF_YJK_B;
				ELSIF( VDPMODEGRAPHIC7 = '0' OR REG_R25_YJK = '1' )THEN
					--	PALETTE COLOR (NOT GRAPHIC7, SPRITE ON YJK MODE, YAE COLOR ON YJK MODE)
					FF_VIDEO_R <= PALETTEDATARB_OUT( 6 DOWNTO 4 ) & "000";
					FF_VIDEO_B <= PALETTEDATARB_OUT( 2 DOWNTO 0 ) & "000";
					FF_VIDEO_G <= PALETTEDATAG_OUT(  2 DOWNTO 0 ) & "000";
				ELSE
					--	GRAPHIC7
					FF_VIDEO_R <= FF_GRP7_COLOR_CODE( 4 DOWNTO 2 ) & "000";
					FF_VIDEO_G <= FF_GRP7_COLOR_CODE( 7 DOWNTO 5 ) & "000";
					FF_VIDEO_B <= FF_GRP7_COLOR_CODE( 1 DOWNTO 0 ) & FF_GRP7_COLOR_CODE(1) & "000";
				END IF;
			END IF;
		END IF;
	END PROCESS;

	-- FOR GRAPHIC7
	WITH( COLORCODESPRITE )SELECT W_GRP7_SPRITE_COLOR <=
		"000" & "000" & "00"	WHEN "0000",
		"000" & "000" & "01"	WHEN "0001",
		"000" & "011" & "00"	WHEN "0010",
		"000" & "011" & "01"	WHEN "0011",
		"011" & "000" & "00"	WHEN "0100",
		"011" & "000" & "01"	WHEN "0101",
		"011" & "011" & "00"	WHEN "0110",
		"011" & "011" & "01"	WHEN "0111",
		"100" & "111" & "01"	WHEN "1000",
		"000" & "000" & "11"	WHEN "1001",
		"000" & "111" & "00"	WHEN "1010",
		"000" & "111" & "11"	WHEN "1011",
		"111" & "000" & "00"	WHEN "1100",
		"111" & "000" & "11"	WHEN "1101",
		"111" & "111" & "00"	WHEN "1110",
		"111" & "111" & "11"	WHEN "1111",
		(OTHERS => '0')			WHEN OTHERS;

	-- FOR OTHERS
	W_FORE_COLOR	<=	COLORCODET12							WHEN( (VDPMODETEXT1 OR VDPMODETEXT2) = '1' )ELSE
						COLORCODESPRITE							WHEN( SPRITECOLOROUT = '1' )ELSE
						COLORCODEG123M							WHEN( (VDPMODEGRAPHIC1 OR VDPMODEGRAPHIC2 OR VDPMODEGRAPHIC3 OR VDPMODEMULTI) = '1' )ELSE
						COLORCODEG4567( 3 DOWNTO 0 );
	W_BACK_COLOR	<=	REG_R7_FRAME_COL( 3 DOWNTO 0 );

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PALETTE_ADDR		<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_EVEN_DOTSTATE = '1' )THEN
				IF( WINDOW = '0' OR REG_R1_DISP_ON = '0' OR (W_FORE_COLOR = "0000" AND REG_R8_COL0_ON = '0') )THEN
					FF_PALETTE_ADDR		<= W_BACK_COLOR;
				ELSE
					FF_PALETTE_ADDR		<= W_FORE_COLOR;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_PALETTE_ADDR_G5	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_EVEN_DOTSTATE = '1' )THEN
				IF( WINDOW = '0' OR REG_R1_DISP_ON = '0' OR 
						(DOTSTATE(1) = '0' AND W_FORE_COLOR( 1 DOWNTO 0 ) = "00" AND REG_R8_COL0_ON = '0') OR 
						(DOTSTATE(1) = '1' AND W_FORE_COLOR( 3 DOWNTO 2 ) = "00" AND REG_R8_COL0_ON = '0') )THEN
					IF( DOTSTATE(1) = '0' )THEN
						FF_PALETTE_ADDR_G5	<= W_BACK_COLOR( 1 DOWNTO 0 );
					ELSE
						FF_PALETTE_ADDR_G5	<= W_BACK_COLOR( 3 DOWNTO 2 );
					END IF;
				ELSE
					IF( DOTSTATE(1) = '0' )THEN
						FF_PALETTE_ADDR_G5	<= W_FORE_COLOR( 1 DOWNTO 0 );
					ELSE
						FF_PALETTE_ADDR_G5	<= W_FORE_COLOR( 3 DOWNTO 2 );
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_GRP7_COLOR_CODE	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_EVEN_DOTSTATE = '1' )THEN
				IF( SPRITECOLOROUT = '1' )THEN
					FF_GRP7_COLOR_CODE	<= W_GRP7_SPRITE_COLOR;
				ELSE
					FF_GRP7_COLOR_CODE	<= COLORCODEG4567;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_SPRITECOLOROUT	<= '0';
			FF_YJK_R			<= (OTHERS => '0');
			FF_YJK_G			<= (OTHERS => '0');
			FF_YJK_B			<= (OTHERS => '0');
			FF_YJK_EN			<= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( W_EVEN_DOTSTATE = '1' )THEN
				FF_SPRITECOLOROUT <= SPRITECOLOROUT AND WINDOW;
				IF( WINDOW = '1' AND REG_R1_DISP_ON = '1' )THEN
					FF_YJK_R			<= P_YJK_R;
					FF_YJK_G			<= P_YJK_G;
					FF_YJK_B			<= P_YJK_B;
					FF_YJK_EN			<= P_YJK_EN;
				ELSE
					FF_YJK_R			<= REG_R7_FRAME_COL( 4 DOWNTO 2 ) & "000";
					FF_YJK_G			<= REG_R7_FRAME_COL( 7 DOWNTO 5 ) & "000";
					FF_YJK_B			<= REG_R7_FRAME_COL( 1 DOWNTO 0 ) & REG_R7_FRAME_COL(1) & "000";
					FF_YJK_EN			<= '1';
				END IF;
			END IF;
		END IF;
	END PROCESS;
END RTL;
