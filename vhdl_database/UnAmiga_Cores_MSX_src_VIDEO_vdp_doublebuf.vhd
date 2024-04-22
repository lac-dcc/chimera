--
--  vdp_doublebuf.vhd
--    Double Buffered Line Memory.
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
-------------------------------------------------------------------------------
-- Memo
--   Japanese comment lines are starts with "JP:".
--   JP: ���{��̃R�����g�s�� JP:�𓪂ɕt���鎖�ɂ���
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: �_�u���o�b�t�@�����O�@�\�t�����C���o�b�t�@���W���[���B
-- JP: vga.vhd�ɂ��A�b�v�X�L�����R���o�[�g�Ɏg�p���܂��B
--
-- JP: xPositionW�� X���W�����Cwe�� 1�ɂ���Ə������݃o�b�t�@��
-- JP: �������܂��D�܂��CxPositionR�� X���W������ƁC�ǂݍ���
-- JP: �o�b�t�@����ǂݏo�����F�R�[�h�� q����o�͂����B
-- JP: evenOdd�M���ɂ���āC�ǂݍ��݃o�b�t�@�Ə������݃o�b�t�@��
-- JP: �؂�ւ��B

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY VDP_DOUBLEBUF IS
	PORT (
		CLK			: IN	STD_LOGIC;
		XPOSITIONW	: IN	STD_LOGIC_VECTOR(  9 DOWNTO 0 );
		XPOSITIONR	: IN	STD_LOGIC_VECTOR(  9 DOWNTO 0 );
		EVENODD		: IN	STD_LOGIC;
		WE			: IN	STD_LOGIC;
		DATARIN		: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		DATAGIN		: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		DATABIN		: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		DATAROUT	: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		DATAGOUT	: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
		DATABOUT	: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 )
	);
END VDP_DOUBLEBUF;

ARCHITECTURE RTL OF VDP_DOUBLEBUF IS
	COMPONENT VDP_LINEBUF
		 PORT (
			ADDRESS		: IN	STD_LOGIC_VECTOR(  9 DOWNTO 0 );
			INCLOCK		: IN	STD_LOGIC;
			WE			: IN	STD_LOGIC;
			DATA		: IN	STD_LOGIC_VECTOR(  5 DOWNTO 0 );
			Q			: OUT	STD_LOGIC_VECTOR(  5 DOWNTO 0 )
		);
	END COMPONENT;

	SIGNAL WE_E		: STD_LOGIC;
	SIGNAL WE_O		: STD_LOGIC;
	SIGNAL ADDR_E	: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL ADDR_O	: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL OUTR_E	: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL OUTG_E	: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL OUTB_E	: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL OUTR_O	: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL OUTG_O	: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL OUTB_O	: STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN
	-- EVEN LINE
	U_BUF_RE: VDP_LINEBUF
	PORT MAP(
		ADDRESS		=> ADDR_E,
		INCLOCK		=> CLK,
		WE			=> WE_E,
		DATA		=> DATARIN,
		Q			=> OUTR_E
	);

	U_BUF_GE: VDP_LINEBUF
	PORT MAP(
		ADDRESS		=> ADDR_E,
		INCLOCK		=> CLK,
		WE			=> WE_E,
		DATA		=> DATAGIN,
		Q			=> OUTG_E
	);

	U_BUF_BE: VDP_LINEBUF
	PORT MAP(
		ADDRESS		=> ADDR_E,
		INCLOCK		=> CLK,
		WE			=> WE_E,
		DATA		=> DATABIN,
		Q			=> OUTB_E
	);
	-- ODD LINE
	U_BUF_RO: VDP_LINEBUF
	PORT MAP(
		ADDRESS		=> ADDR_O,
		INCLOCK		=> CLK,
		WE			=> WE_O,
		DATA		=> DATARIN,
		Q			=> OUTR_O
	);

	U_BUF_GO: VDP_LINEBUF
	PORT MAP(
		ADDRESS		=> ADDR_O,
		INCLOCK		=> CLK,
		WE			=> WE_O,
		DATA		=> DATAGIN,
		Q			=> OUTG_O
	);

	U_BUF_BO: VDP_LINEBUF
	PORT MAP(
		ADDRESS		=> ADDR_O,
		INCLOCK		=> CLK,
		WE			=> WE_O,
		DATA		=> DATABIN,
		Q			=> OUTB_O
	);

	WE_E		<= WE WHEN( EVENODD = '0' )ELSE '0';
	WE_O		<= WE WHEN( EVENODD = '1' )ELSE '0';
	
	ADDR_E		<= XPOSITIONW WHEN( EVENODD = '0' )ELSE XPOSITIONR;
	ADDR_O		<= XPOSITIONW WHEN( EVENODD = '1' )ELSE XPOSITIONR;

	DATAROUT	<= OUTR_E WHEN( EVENODD = '1' )ELSE OUTR_O;
	DATAGOUT	<= OUTG_E WHEN( EVENODD = '1' )ELSE OUTG_O;
	DATABOUT	<= OUTB_E WHEN( EVENODD = '1' )ELSE OUTB_O;
END RTL;
