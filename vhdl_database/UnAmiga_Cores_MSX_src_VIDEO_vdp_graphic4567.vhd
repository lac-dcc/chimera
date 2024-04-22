--
--  vdp_graphic4567.vhd
--    Imprementation of Graphic Mode 4,5,6 and 7.
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
-- 20th,March,2008 modified by t.hara
-- JP: ���t�@�N�^�����O, VDP_PACKAGE �̎Q�Ƃ��폜
--
-- 9th, April,2008 modified by t.hara
-- Supported YJK mode.
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: GRAPHIC���[�h4,5,6,7�̃��C��������H�ł��B
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY VDP_GRAPHIC4567 IS
	PORT(
		-- VDP CLOCK ... 21.477MHZ
		CLK21M					: IN	STD_LOGIC;
		RESET					: IN	STD_LOGIC;

		DOTSTATE				: IN	STD_LOGIC_VECTOR(  1 DOWNTO 0 );
		EIGHTDOTSTATE			: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );
		DOTCOUNTERX				: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );
		DOTCOUNTERY				: IN	STD_LOGIC_VECTOR(  8 DOWNTO 0 );

		VDPMODEGRAPHIC4			: IN	STD_LOGIC;
		VDPMODEGRAPHIC5			: IN	STD_LOGIC;
		VDPMODEGRAPHIC6			: IN	STD_LOGIC;
		VDPMODEGRAPHIC7			: IN	STD_LOGIC;

		-- REGISTERS
		REG_R2_PT_NAM_ADDR		: IN	STD_LOGIC_VECTOR(  6 DOWNTO 0 );
		REG_R26_H_SCROLL		: IN	STD_LOGIC_VECTOR(  8 DOWNTO 3 );
		REG_R27_H_SCROLL		: IN	STD_LOGIC_VECTOR(  2 DOWNTO 0 );
		REG_R25_YAE				: IN	STD_LOGIC;
		REG_R25_YJK				: IN	STD_LOGIC;
		REG_R25_SP2				: IN	STD_LOGIC;

		--
		PRAMDAT					: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		PRAMDATPAIR				: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		PRAMADR					: OUT	STD_LOGIC_VECTOR( 16 DOWNTO 0 );

		PCOLORCODE				: OUT	STD_LOGIC_VECTOR(  7 DOWNTO 0 );

		P_YJK_R					: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		P_YJK_G					: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		P_YJK_B					: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		P_YJK_EN				: OUT	STD_LOGIC
	);
END VDP_GRAPHIC4567;

ARCHITECTURE RTL OF VDP_GRAPHIC4567 IS
	COMPONENT RAM
		PORT(
			ADR		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
			CLK		: IN	STD_LOGIC;
			WE		: IN	STD_LOGIC;
			DBO		: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
			DBI		: OUT	STD_LOGIC_VECTOR(  7 DOWNTO 0 )
		);
	END COMPONENT;

	SIGNAL LOGICALVRAMADDRG45			: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL LOGICALVRAMADDRG67			: STD_LOGIC_VECTOR( 16 DOWNTO 0 );
	SIGNAL LOCALDOTCOUNTERX				: STD_LOGIC_VECTOR(  8 DOWNTO 0 );
	SIGNAL LATCHEDPTNNAMETBLBASEADDR	: STD_LOGIC_VECTOR(  6 DOWNTO 0 );

	SIGNAL FIFOADDR						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FIFOADDR_IN					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FIFOADDR_OUT					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FIFOWE						: STD_LOGIC;
	SIGNAL FIFOIN						: STD_LOGIC;
	SIGNAL FIFODATA_IN					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FIFODATA_OUT					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );

	SIGNAL FF_FIFO0						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_FIFO1						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_FIFO2						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_FIFO3						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PIX0						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PIX1						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PIX2						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL FF_PIX3						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );

	SIGNAL COLORDATA					: STD_LOGIC_VECTOR(  7 DOWNTO 0 );
	SIGNAL W_DOTCOUNTERX				: STD_LOGIC_VECTOR(  8 DOWNTO 0 );
	SIGNAL W_SP2_H_SCROLL				: STD_LOGIC;
	SIGNAL W_PIX						: STD_LOGIC_VECTOR(  7 DOWNTO 0 );

	SIGNAL	W_Y							: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL	W_K							: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	SIGNAL	W_J							: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	SIGNAL	W_R_YJK						: STD_LOGIC_VECTOR( 6 DOWNTO 0 );
	SIGNAL	W_G_YJK						: STD_LOGIC_VECTOR( 6 DOWNTO 0 );
	SIGNAL	W_B_Y						: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL	W_B_JK						: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL	W_B_YJKP					: STD_LOGIC_VECTOR( 8 DOWNTO 0 );
	SIGNAL	W_B_YJK						: STD_LOGIC_VECTOR( 6 DOWNTO 0 );
	SIGNAL	W_R							: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	SIGNAL	W_G							: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	SIGNAL	W_B							: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
BEGIN

	----------------------------------------------------------------
	-- FIFO AND CONTROL SIGNALS
	----------------------------------------------------------------
	FIFOADDR		<=	FIFOADDR_IN	WHEN( FIFOIN = '1' )ELSE
						FIFOADDR_OUT;
	FIFOWE			<=	'1'			WHEN( FIFOIN = '1' )ELSE
						'0';
	FIFODATA_IN		<=	PRAMDAT		WHEN( (DOTSTATE = "00") OR (DOTSTATE = "01") )ELSE
						PRAMDATPAIR;

	U_FIFOMEM: RAM
	PORT MAP(
		ADR		=> FIFOADDR,
		CLK		=> CLK21M,
		WE		=> FIFOWE,
		DBO		=> FIFODATA_IN,
		DBI		=> FIFODATA_OUT
	);

	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				CASE EIGHTDOTSTATE( 1 DOWNTO 0 ) IS
				WHEN "00" =>	FF_FIFO0	<= FIFODATA_OUT;
				WHEN "01" =>	FF_FIFO1	<= FIFODATA_OUT;
				WHEN "10" =>	FF_FIFO2	<= FIFODATA_OUT;
				WHEN "11" =>	FF_FIFO3	<= FIFODATA_OUT;
				END CASE;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( CLK21M )
	BEGIN
		IF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "00" AND EIGHTDOTSTATE( 1 DOWNTO 0 ) = "00" )THEN
				FF_PIX0	<= FF_FIFO0;
				FF_PIX1	<= FF_FIFO1;
				FF_PIX2	<= FF_FIFO2;
				FF_PIX3	<= FF_FIFO3;
			END IF;
		END IF;
	END PROCESS;

	WITH EIGHTDOTSTATE( 1 DOWNTO 0 ) SELECT W_PIX <=
		FF_PIX0			WHEN "00",
		FF_PIX1			WHEN "01",
		FF_PIX2			WHEN "10",
		FF_PIX3			WHEN "11",
		(OTHERS => 'X')	WHEN OTHERS;

	-- TWO SCREEN H-SCROLL MODE (R#25 SP2 = '1')
	W_SP2_H_SCROLL		<=	LOCALDOTCOUNTERX(8) WHEN( (REG_R25_SP2 AND LATCHEDPTNNAMETBLBASEADDR(5)) = '1' )ELSE
							LATCHEDPTNNAMETBLBASEADDR(5);

	-- VRAM ADDRESS MAPPINGS.
	LOGICALVRAMADDRG45	<=	LATCHEDPTNNAMETBLBASEADDR(6) & W_SP2_H_SCROLL & 
							(LATCHEDPTNNAMETBLBASEADDR(4 DOWNTO 0) AND DOTCOUNTERY(7 DOWNTO 3)) &
							DOTCOUNTERY(2 DOWNTO 0) & LOCALDOTCOUNTERX(7 DOWNTO 1);

	LOGICALVRAMADDRG67	<=	W_SP2_H_SCROLL & 
							(LATCHEDPTNNAMETBLBASEADDR(4 DOWNTO 0) AND DOTCOUNTERY(7 DOWNTO 3)) &
							DOTCOUNTERY(2 DOWNTO 0) & LOCALDOTCOUNTERX(7 DOWNTO 0);

	-- FIFO CONTROL
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FIFOADDR_IN <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "00" )THEN
				IF( EIGHTDOTSTATE = "000" AND DOTCOUNTERX = 0 ) THEN
					FIFOADDR_IN <= (OTHERS => '0');
				END IF;
			ELSIF( FIFOIN = '1' ) THEN
				FIFOADDR_IN <= FIFOADDR_IN + 1;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FIFOADDR_OUT	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			CASE DOTSTATE IS
			WHEN "00" =>
				NULL;
			WHEN "01" =>
				IF( (VDPMODEGRAPHIC4 = '0') AND (VDPMODEGRAPHIC5 = '0') )THEN
					FIFOADDR_OUT <= FIFOADDR_OUT + 1;
				ELSIF( EIGHTDOTSTATE(0) = '0' )THEN
					-- GRAPHIC4, 5
					FIFOADDR_OUT <= FIFOADDR_OUT + 1;
				END IF;
			WHEN "11" =>
				NULL;
			WHEN "10" =>
				IF( DOTCOUNTERX = X"04" )THEN
					FIFOADDR_OUT <= (OTHERS => '0');
				END IF;
			WHEN OTHERS =>
				NULL;
			END CASE;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FIFOIN <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			CASE DOTSTATE IS
			WHEN "00" =>
				IF(		EIGHTDOTSTATE = "000" ) THEN
					FIFOIN <= '0';
				ELSIF(	(EIGHTDOTSTATE = "001") OR
						(EIGHTDOTSTATE = "010") OR
						(EIGHTDOTSTATE = "011") OR
						(EIGHTDOTSTATE = "100") )THEN
					FIFOIN <= '1';
				END IF;
			WHEN "01" =>
				FIFOIN <= '0';
			WHEN "11" =>
				IF( ((VDPMODEGRAPHIC6 = '1') OR (VDPMODEGRAPHIC7 = '1')) AND
					(	(EIGHTDOTSTATE = "001") OR
						(EIGHTDOTSTATE = "010") OR
						(EIGHTDOTSTATE = "011") OR
						(EIGHTDOTSTATE = "100")) )THEN
					FIFOIN <= '1';
				END IF;
			WHEN "10" =>
				FIFOIN <= '0';
			WHEN OTHERS =>
				NULL;
			END CASE;
		END IF;
	END PROCESS;

	-- FIFO OUT LATCH
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			COLORDATA	<= (OTHERS => '0');
			PCOLORCODE	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			CASE DOTSTATE IS
			WHEN "00" =>
				NULL;
			WHEN "01" =>
				IF( (VDPMODEGRAPHIC4 = '1') OR (VDPMODEGRAPHIC5 = '1') )THEN
					IF( EIGHTDOTSTATE(0) = '0' )THEN
						COLORDATA <= W_PIX;
						PCOLORCODE( 7 DOWNTO 4 ) <= (OTHERS => '0');
						PCOLORCODE( 3 DOWNTO 0 ) <= W_PIX( 7 DOWNTO 4 );
					ELSE
						PCOLORCODE( 7 DOWNTO 4 ) <= (OTHERS => '0');
						PCOLORCODE( 3 DOWNTO 0 ) <= COLORDATA( 3 DOWNTO 0 );
					END IF;
				ELSIF( VDPMODEGRAPHIC6 = '1' OR REG_R25_YAE = '1' )THEN
					COLORDATA <= W_PIX;
					PCOLORCODE( 7 DOWNTO 4 ) <= (OTHERS => '0');
					PCOLORCODE( 3 DOWNTO 0 ) <= W_PIX( 7 DOWNTO 4 );
				ELSE
					-- GRAPHIC7
					PCOLORCODE <= W_PIX;
				END IF;
			WHEN "11" =>
				NULL;
			WHEN "10" =>
				-- HIGH RESOLUTION MODE .
				IF( VDPMODEGRAPHIC6 = '1' )THEN
					PCOLORCODE( 7 DOWNTO 4 ) <= (OTHERS => '0');
					PCOLORCODE( 3 DOWNTO 0 ) <= COLORDATA( 3 DOWNTO 0 );
				END IF;
			WHEN OTHERS =>
				NULL;
			END CASE;
		END IF;
	END PROCESS;

	-- YJK COLOR CONVERT
	W_Y		<=	W_PIX( 7 DOWNTO 3 );												--	Y ( 0...31)
	W_K		<=	FF_PIX1( 2 DOWNTO 0 ) & FF_PIX0( 2 DOWNTO 0 );						--	K (-32...31)
	W_J		<=	FF_PIX3( 2 DOWNTO 0 ) & FF_PIX2( 2 DOWNTO 0 );						--	J (-32...31)

	W_R_YJK	<=	("00" & W_Y) + (W_J(5) & W_J);										--	R (-32...62)
	W_G_YJK	<=	("00" & W_Y) + (W_K(5) & W_K);										--	B (-32...62)
	W_B_Y	<=	('0' & W_Y & "00") + ("000" & W_Y);									--	Y * 5				( 0...155 )
	W_B_JK	<=	(W_J(5) & W_J & '0') + (W_K(5) & W_K(5) & W_K);						--	J * 2 + K			( -96...93 )
	W_B_YJKP<=	('0' & W_B_Y) - (W_B_JK(7) & W_B_JK);								--	(Y * 5 - (J * 2 + K))	(-93...251)
	W_B_YJK	<=	W_B_YJKP( 8 DOWNTO 2 );												--	(Y * 5 - (J * 2 + K))/4	(-23...62)

	W_R		<=	(OTHERS => '0')			WHEN( W_R_YJK(6) = '1' )ELSE	-- UNDER LIMIT
				(OTHERS => '1')			WHEN( W_R_YJK(5) = '1' )ELSE	-- OVER LIMIT
				W_R_YJK( 4 DOWNTO 0 ) & '0';
	W_G		<=	(OTHERS => '0')			WHEN( W_G_YJK(6) = '1' )ELSE	-- UNDER LIMIT
				(OTHERS => '1')			WHEN( W_G_YJK(5) = '1' )ELSE	-- OVER LIMIT
				W_G_YJK( 4 DOWNTO 0 ) & '0';
	W_B		<=	(OTHERS => '0')			WHEN( W_B_YJK(6) = '1' )ELSE	-- UNDER LIMIT
				(OTHERS => '1')			WHEN( W_B_YJK(5) = '1' )ELSE	-- OVER LIMIT
				W_B_YJK( 4 DOWNTO 0 ) & '0';

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			P_YJK_R	<=	(OTHERS => '0');
			P_YJK_G	<=	(OTHERS => '0');
			P_YJK_B	<=	(OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				P_YJK_R <= W_R;
				P_YJK_G <= W_G;
				P_YJK_B <= W_B;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			P_YJK_EN <= '0';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "01" )THEN
				IF( REG_R25_YAE = '1' AND W_PIX(3) = '1' )THEN
					-- PALETTE COLOR ON SCREEN10/SCREEN11
					P_YJK_EN <= '0';
				ELSE
					P_YJK_EN <= REG_R25_YJK;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	-- VRAM READ ADDRESS
	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			PRAMADR <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "11" )THEN
				IF( (VDPMODEGRAPHIC4 = '1') OR (VDPMODEGRAPHIC5 = '1') ) THEN
					PRAMADR <= LOGICALVRAMADDRG45( 16 DOWNTO 0 );
				ELSE
					PRAMADR <= LOGICALVRAMADDRG67(0) & LOGICALVRAMADDRG67( 16 DOWNTO 1 );
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			LATCHEDPTNNAMETBLBASEADDR	<= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "00" AND EIGHTDOTSTATE = "000" )THEN
				LATCHEDPTNNAMETBLBASEADDR <= REG_R2_PT_NAM_ADDR;
			END IF;
		END IF;
	END PROCESS;

	W_DOTCOUNTERX	<=	(DOTCOUNTERX(8 DOWNTO 3) + REG_R26_H_SCROLL) & "000";

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			LOCALDOTCOUNTERX <= (OTHERS => '0');
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( DOTSTATE = "00" )THEN
				IF( EIGHTDOTSTATE = "000" ) THEN
					LOCALDOTCOUNTERX <= W_DOTCOUNTERX;
				ELSIF(	(EIGHTDOTSTATE = "001") OR
						(EIGHTDOTSTATE = "010") OR
						(EIGHTDOTSTATE = "011") OR
						(EIGHTDOTSTATE = "100") ) THEN
					LOCALDOTCOUNTERX <= LOCALDOTCOUNTERX + 2;
				END IF;
			END IF;
		END IF;
	END PROCESS;

END RTL;
