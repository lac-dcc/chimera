--
--  vdp_interrupt.vhd
--   Interrupt controller of ESE-VDP.
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
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY VDP_INTERRUPT IS
	PORT(
		RESET					: IN	STD_LOGIC;
		CLK21M					: IN	STD_LOGIC;

		H_CNT					: IN	STD_LOGIC_VECTOR( 10 DOWNTO 0 );
		Y_CNT					: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 );
		ACTIVE_LINE				: IN	STD_LOGIC;
		V_BLANKING_START		: IN	STD_LOGIC;
		CLR_VSYNC_INT			: IN	STD_LOGIC;
		CLR_HSYNC_INT			: IN	STD_LOGIC;
		REQ_VSYNC_INT_N			: OUT	STD_LOGIC;
		REQ_HSYNC_INT_N			: OUT	STD_LOGIC;
		REG_R19_HSYNC_INT_LINE	: IN	STD_LOGIC_VECTOR(  7 DOWNTO 0 )
	);
END VDP_INTERRUPT;

ARCHITECTURE RTL OF VDP_INTERRUPT IS

	SIGNAL FF_VSYNC_INT_N			: STD_LOGIC;
	SIGNAL FF_HSYNC_INT_N			: STD_LOGIC;
	SIGNAL W_VSYNC_INTR_TIMING		: STD_LOGIC;
BEGIN

	REQ_VSYNC_INT_N <= FF_VSYNC_INT_N;
	REQ_HSYNC_INT_N <= FF_HSYNC_INT_N;

	-----------------------------------------------------------------------------
	-- VSYNC INTERRUPT REQUEST
	-----------------------------------------------------------------------------
	W_VSYNC_INTR_TIMING <=	'1' WHEN( H_CNT = 235 )ELSE
							'0';

	PROCESS( RESET, CLK21M )
	BEGIN
		IF( RESET = '1' )THEN
			FF_VSYNC_INT_N <= '1';
		ELSIF( CLK21M'EVENT AND CLK21M = '1' )THEN
			IF( CLR_VSYNC_INT = '1' )THEN
				-- V-BLANKING INTERRUPT CLEAR
				FF_VSYNC_INT_N <= '1';
			ELSIF( W_VSYNC_INTR_TIMING = '1' AND V_BLANKING_START = '1' )THEN
				-- V-BLANKING INTERRUPT REQUEST
				FF_VSYNC_INT_N <= '0';
			END IF;
		END IF;
	END PROCESS;

	--------------------------------------------------------------------------
	--	W_HSYNC INTERRUPT REQUEST
	--------------------------------------------------------------------------
	PROCESS( RESET, CLK21M )
	BEGIN
		IF (RESET = '1') THEN
			FF_HSYNC_INT_N <= '1';
		ELSIF (CLK21M'EVENT AND CLK21M = '1') THEN
			IF( CLR_HSYNC_INT = '1' OR (W_VSYNC_INTR_TIMING = '1' AND V_BLANKING_START = '1') )THEN
				-- H-BLANKING INTERRUPT CLEAR
				FF_HSYNC_INT_N <= '1';
			ELSIF( H_CNT = 1235 AND ACTIVE_LINE = '1' AND Y_CNT = REG_R19_HSYNC_INT_LINE )THEN
				-- H-BLANKING INTERRUPT REQUEST
				FF_HSYNC_INT_N <= '0';
			END IF;
		END IF;
	END PROCESS;

END RTL;
