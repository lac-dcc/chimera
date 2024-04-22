--
--  vdp_text12.vhd
--    Imprementation of Text Mode 1,2.
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
-- Contributors
--  
--   Alex Wulms
--     - Improvement of the TEXT2 mode such as 'blink function'.
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
-- 12th,August,2006 created by Kunihiko Ohnaka
-- JP: VDP�̃R�A�̎����ƃX�N���[�����[�h�̎����𕪗�����
--
-- 13th,March,2008
-- Fixed Blink by caro
--
-- 22th,March,2008
-- JP: �^�C�~���O�ɘa�ƁA���t�@�N�^�����O by t.hara
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: TEXT���[�h1,2�̃��C��������H�ł��B
--
-------------------------------------------------------------------------------

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE WORK.VDP_PACKAGE.ALL;

ENTITY VDP_TEXT12 IS
	PORT(
		-- VDP CLOCK ... 21.477MHZ
		CLK21M						: IN	STD_LOGIC;
		RESET	 					: IN	STD_LOGIC;

		DOTSTATE					: IN	STD_LOGIC_VECTOR(  1 DOWNTO 0 );
		DOTCOUNTERX					: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		DOTCOUNTERY					: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );

		VDPMODETEXT1				: IN	STD_LOGIC;
		VDPMODETEXT2				: IN	STD_LOGIC;

		-- REGISTERS
		REG_R7_FRAME_COL			: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		REG_R12_BLINK_MODE			: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		REG_R13_BLINK_PERIOD		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		
		REG_R2_PT_NAM_ADDR			: IN	STD_LOGIC_VECTOR(  6 DOWNTO 0 );
		REG_R4_PT_GEN_ADDR			: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		REG_R10R3_COL_ADDR			: IN	STD_LOGIC_VECTOR( 10 DOWNTO 0 );
		--
		PRAMDAT						: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		PRAMADR						: OUT	STD_LOGIC_VECTOR( 16 DOWNTO 0 );
		TXVRAMREADEN				: OUT	STD_LOGIC;

		PCOLORCODE					: OUT	STD_LOGIC_VECTOR(  3 DOWNTO 0 )
	);
END VDP_TEXT12;

ARCHITECTURE RTL OF VDP_TEXT12 IS
	SIGNAL ITXVRAMREADEN			: STD_LOGIC;
	SIGNAL ITXVRAMREADEN2			: STD_LOGIC;
	SIGNAL DOTCOUNTER24				: STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	SIGNAL TXWINDOWX				: STD_LOGIC;
	SIGNAL TXPREWINDOWX				: STD_LOGIC;

	SIGNAL LOGICALVRAMADDRNAM		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL LOGICALVRAMADDRGEN		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL LOGICALVRAMADDRCOL		: STD_LOGIC_VECTOR( 16 DOWNTO 0 );

	SIGNAL TXCHARCOUNTER			: STD_LOGIC_VECTOR( 11 DOWNTO 0 );
	SIGNAL TXCHARCOUNTERX			: STD_LOGIC_VECTOR(  6 DOWNTO 0 );
	SIGNAL TXCHARCOUNTERSTARTOFLINE	: STD_LOGIC_VECTOR( 11 DOWNTO 0 );

	SIGNAL PATTERNNUM				: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL PREPATTERN				: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL PREBLINK					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL PATTERN					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL BLINK					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL TXCOLORCODE				: STD_LOGIC;			 -- ONLY 2 COLORS
	SIGNAL TXCOLOR					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );

	SIGNAL FF_BLINK_FRAME_CNT		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL FF_BLINK_STATE			: STD_LOGIC;
	SIGNAL FF_BLINK_PERIOD_CNT		: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL W_BLINK_CNT_MAX			: STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL W_FRAME_SYNC				: STD_LOGIC;

BEGIN

	-- JP: RAM�� DOTSTATE��"10","00"�̎��ɃA�h���X���o����"01"�ŃA�N�Z�X����B
	-- JP: EIGHTDOTSTATE�Ō���ƁA
	-- JP:	0-1		READ PATTERN NUM.
	-- JP:	1-2		READ PATTERN
	-- JP: �ƂȂ�B
	--

	----------------------------------------------------------------
	-- 
	----------------------------------------------------------------
	TXCHARCOUNTER		<=	TXCHARCOUNTERSTARTOFLINE + TXCHARCOUNTERX;

	LOGICALVRAMADDRNAM	<=	(REG_R2_PT_NAM_ADDR & TXCHARCOUNTER(9 DOWNTO 0)) WHEN( VDPMODETEXT1 = '1' )ELSE
							(REG_R2_PT_NAM_ADDR(6 DOWNTO 2) & TXCHARCOUNTER);

	LOGICALVRAMADDRGEN	<=	REG_R4_PT_GEN_ADDR & PATTERNNUM & DOTCOUNTERY(2 DOWNTO 0);

	LOGICALVRAMADDRCOL	<=	REG_R10R3_COL_ADDR(10 DOWNTO 3) & TXCHARCOUNTER(11 DOWNTO 3);

	TXVRAMREADEN		<=	ITXVRAMREADEN					WHEN( VDPMODETEXT1 = '1' )ELSE
							ITXVRAMREADEN OR ITXVRAMREADEN2	WHEN( VDPMODETEXT2 = '1' )ELSE
							'0';

	TXCOLOR				<=	REG_R12_BLINK_MODE		WHEN( ( VDPMODETEXT2 = '1') AND (FF_BLINK_STATE = '1') AND (BLINK(7) = '1') )ELSE
						 	REG_R7_FRAME_COL;
	PCOLORCODE			<=	TXCOLOR(7 DOWNTO 4)		WHEN( (TXWINDOWX = '1') AND (TXCOLORCODE = '1') )ELSE
							TXCOLOR(3 DOWNTO 0)		WHEN( (TXWINDOWX = '1') AND (TXCOLORCODE = '0') )ELSE
							REG_R7_FRAME_COL(3 DOWNTO 0);

	---------------------------------------------------------------------------
	-- TIMING GENERATOR
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			DOTCOUNTER24	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "10" )THEN
				IF( DOTCOUNTERX = 12 )THEN
					-- JP: DOTCOUNTER��"10"�̃^�C�~���O�ł͊��ɃJ�E���g�A�b�v���Ă���̂Œ���
					DOTCOUNTER24 <= (OTHERS => '0');
				ELSE
					-- THE DOTCOUNTER24(2 DOWNTO 0) COUNTS UP 0 TO 5,
					-- AND THE DOTCOUNTER24(4 DOWNTO 3) COUNTS UP 0 TO 3.
					IF( DOTCOUNTER24(2 DOWNTO 0) = "101" ) THEN
						DOTCOUNTER24(4 DOWNTO 3) <= DOTCOUNTER24(4 DOWNTO 3) + 1;
						DOTCOUNTER24(2 DOWNTO 0) <= "000";
					ELSE
						DOTCOUNTER24(2 DOWNTO 0) <= DOTCOUNTER24(2 DOWNTO 0) + 1;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			TXPREWINDOWX	<= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "10" )THEN
				IF( DOTCOUNTERX = 12 )THEN
					TXPREWINDOWX <= '1';
				ELSIF( DOTCOUNTERX = 240+12 )THEN
					TXPREWINDOWX <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			TXWINDOWX		<= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( DOTCOUNTERX = 16 )THEN
					TXWINDOWX <= '1';
				ELSIF( DOTCOUNTERX = 240+16 )THEN
					TXWINDOWX <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	---------------------------------------------------------------------------
	-- 
	---------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			PATTERNNUM					<= (OTHERS => '0');
			PRAMADR						<= (OTHERS => '0');
			ITXVRAMREADEN				<= '0';
			ITXVRAMREADEN2				<= '0';
			TXCHARCOUNTERX				<= (OTHERS => '0');
			PREBLINK					<= (OTHERS => '0');
			TXCHARCOUNTERSTARTOFLINE	<= (OTHERS => '0');
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			CASE DOTSTATE IS
				WHEN "11" =>
					IF( TXPREWINDOWX = '1' ) THEN
						-- VRAM READ ADDRESS OUTPUT.
						CASE DOTCOUNTER24(2 DOWNTO 0) IS
							WHEN "000" =>
								IF( DOTCOUNTER24(4 DOWNTO 3) = "00" ) THEN
									-- READ COLOR TABLE(TEXT2 BLINK)
									-- IT IS USED ONLY ONE TIME PER 8 CHARACTERS.
									PRAMADR <= LOGICALVRAMADDRCOL;
									ITXVRAMREADEN2 <= '1';
								END IF;
							WHEN "001" =>
								-- READ PATTERN NAME TABLE
								PRAMADR <= LOGICALVRAMADDRNAM;
								ITXVRAMREADEN <= '1';
								TXCHARCOUNTERX <= TXCHARCOUNTERX + 1;
							WHEN "010" =>
								-- READ PATTERN GENERATOR TABLE
								PRAMADR <= LOGICALVRAMADDRGEN;
								ITXVRAMREADEN <= '1';
							WHEN "100" =>
								-- READ PATTERN NAME TABLE
								-- IT IS USED IF VDPMODE IS TEST2.
								PRAMADR <= LOGICALVRAMADDRNAM;
								ITXVRAMREADEN2 <= '1';
								IF( VDPMODETEXT2 = '1' ) THEN
									TXCHARCOUNTERX <= TXCHARCOUNTERX + 1;
								END IF;
							WHEN "101" =>
								-- READ PATTERN GENERATOR TABLE
								-- IT IS USED IF VDPMODE IS TEST2.
								PRAMADR <= LOGICALVRAMADDRGEN;
								ITXVRAMREADEN2 <= '1';
							WHEN OTHERS =>
								NULL;
						END CASE;
					END IF;
				WHEN "10" =>
					ITXVRAMREADEN <= '0';
					ITXVRAMREADEN2 <= '0';
				WHEN "00" =>
					IF( DOTCOUNTERX = 11) THEN
						TXCHARCOUNTERX <= (OTHERS => '0');
						IF( DOTCOUNTERY = 0 )	THEN
							TXCHARCOUNTERSTARTOFLINE <= (OTHERS => '0');
						END IF;
					ELSIF( (DOTCOUNTERX = 240+11) AND (DOTCOUNTERY(2 DOWNTO 0) = "111") ) THEN
							TXCHARCOUNTERSTARTOFLINE <= TXCHARCOUNTERSTARTOFLINE + TXCHARCOUNTERX;
					END IF;
				WHEN "01" =>
					CASE DOTCOUNTER24(2 DOWNTO 0) IS
						WHEN "001" =>
							-- READ COLOR TABLE(TEXT2 BLINK)
							-- IT IS USED ONLY ONE TIME PER 8 CHARACTERS.
							IF( DOTCOUNTER24(4 DOWNTO 3) = "00" ) THEN
								PREBLINK <= PRAMDAT;
							END IF;
						WHEN "010" =>
							-- READ PATTERN NAME TABLE
							PATTERNNUM <= PRAMDAT;
						WHEN "011" =>
							-- READ PATTERN GENERATOR TABLE
							PREPATTERN <= PRAMDAT;
						WHEN "101" =>
							-- READ PATTERN NAME TABLE
							-- IT IS USED IF VDPMODE IS TEST2.
							PATTERNNUM <= PRAMDAT;
						WHEN "000" =>
							-- READ PATTERN GENERATOR TABLE
							-- IT IS USED IF VDPMODE IS TEST2.
							IF( VDPMODETEXT2 = '1' ) THEN
								PREPATTERN <= PRAMDAT;
							END IF;
						WHEN OTHERS =>
							NULL;
					END CASE;
				WHEN OTHERS => NULL;
			END CASE;
		END IF;
	END PROCESS;

	----------------------------------------------------------------
	-- 
	----------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF(RESET = '1' ) THEN
			PATTERN			<= (OTHERS => '0');
			TXCOLORCODE		<= '0';
			BLINK			<= (OTHERS => '0');
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			-- COLOR CODE DECISION
			-- JP: "01"��"10"�̃^�C�~���O�ł����[�R�[�h���o�͂��Ă�����΁A
			-- JP: VDP�G���e�B�e�B�̕��Ńp���b�g���f�R�[�h���ĐF���o�͂��Ă����B
			-- JP: "01"��"10"�œ����F���o�͂���Ή�256�h�b�g�ɂȂ�A�Ⴄ�F��
			-- JP: �o�͂���Ή�512�h�b�g�\���ƂȂ�B
			CASE DOTSTATE IS
				WHEN "00" =>
					IF( DOTCOUNTER24(2 DOWNTO 0) = "100" ) THEN
						-- LOAD NEXT 8 DOT DATA
						-- JP: �L�����N�^�̕`��� DOTCOUNTER24���A
						-- JP:	 "0:4"����"1:3"��6�h�b�g
						-- JP:	 "1:4"����"2:3"��6�h�b�g
						-- JP:	 "2:4"����"3:3"��6�h�b�g
						-- JP:	 "3:4"����"0:3"��6�h�b�g
						-- JP: �ōs����̂�"100"�̃^�C�~���O�Ń��[�h����
						PATTERN <= PREPATTERN;
					ELSIF( (DOTCOUNTER24(2 DOWNTO 0) = "001") AND (VDPMODETEXT2 = '1') ) THEN
						-- JP: TEXT2�ł�"001"�̃^�C�~���O�ł����[�h����B
						PATTERN <= PREPATTERN;
					END IF;
					IF( (DOTCOUNTER24(2 DOWNTO 0) = "100") OR
							(DOTCOUNTER24(2 DOWNTO 0) = "001") ) THEN
						-- EVALUATE BLINK SIGNAL
						IF(DOTCOUNTER24(4 DOWNTO 0) = "00100") THEN
							BLINK <= PREBLINK;
						ELSE
							BLINK <= BLINK(6 DOWNTO 0) & "0";
						END IF;
					END IF;
				WHEN "01" =>
					-- �p�^�[���ɉ����ăJ���[�R�[�h������
					TXCOLORCODE <= PATTERN(7);
					-- �p�^�[�����V�t�g
					PATTERN <= PATTERN(6 DOWNTO 0) & '0';
				WHEN "11" =>
					NULL;
				WHEN "10" =>
					IF( VDPMODETEXT2 = '1' ) THEN
						TXCOLORCODE <= PATTERN(7);
						-- �p�^�[�����V�t�g
						PATTERN <= PATTERN(6 DOWNTO 0) & '0';
					END IF;

				WHEN OTHERS => NULL;
			END CASE;
		END IF;
	END PROCESS;

	--------------------------------------------------------------------------
	-- BLINK TIMING GENERATION FIXED BY CARO AND T.HARA
	--------------------------------------------------------------------------
	W_BLINK_CNT_MAX	<=	REG_R13_BLINK_PERIOD( 3 DOWNTO 0 )	WHEN( FF_BLINK_STATE = '0' )ELSE
						REG_R13_BLINK_PERIOD( 7 DOWNTO 4 );
	W_FRAME_SYNC	<=	'1'	WHEN( (DOTCOUNTERX = 0) AND (DOTCOUNTERY = 0) AND (DOTSTATE = "00") )ELSE
						'0';

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_BLINK_FRAME_CNT <= (OTHERS => '0');
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( W_FRAME_SYNC = '1' )THEN
				IF (FF_BLINK_FRAME_CNT = "1001") THEN
					FF_BLINK_FRAME_CNT <= (OTHERS => '0');
				ELSE
					FF_BLINK_FRAME_CNT <= FF_BLINK_FRAME_CNT + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_BLINK_STATE <= '0';
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( (W_FRAME_SYNC = '1') AND (FF_BLINK_FRAME_CNT = "1001") )THEN
				IF(    REG_R13_BLINK_PERIOD( 7 DOWNTO 4 ) = "0000" )THEN
					-- WHEN ON PERIOD IS 0, THE BLINK COLOR IS ALWAYS OFF
					FF_BLINK_STATE <= '0';
				ELSIF( REG_R13_BLINK_PERIOD( 3 DOWNTO 0 ) = "0000" )THEN
					-- WHEN OFF PERIOD IS 0, THE BLINK COLOR IS ALWAYS ON
					FF_BLINK_STATE <= '1';
				ELSIF( FF_BLINK_PERIOD_CNT >= W_BLINK_CNT_MAX )THEN
					FF_BLINK_STATE <= NOT FF_BLINK_STATE;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_BLINK_PERIOD_CNT <= (OTHERS => '0');
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( (W_FRAME_SYNC = '1') AND (FF_BLINK_FRAME_CNT = "1001") )THEN
				IF( FF_BLINK_PERIOD_CNT >= W_BLINK_CNT_MAX )THEN
					FF_BLINK_PERIOD_CNT <= (OTHERS => '0');
				ELSE
					FF_BLINK_PERIOD_CNT <= FF_BLINK_PERIOD_CNT + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END RTL;
