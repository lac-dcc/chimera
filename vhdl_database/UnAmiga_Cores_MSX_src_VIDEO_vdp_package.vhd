--
--  vdp_package.vhd
--   Package file of ESE-VDP.
--
--  Copyright (C) 2000-2006 Kunihiko Ohnaka
--  All rights reserved.
--                                     http://www.ohnaka.jp/ese-vdp/
--
--  本ソフトウェアおよび本ソフトウェアに基づいて作成された派生物は、以下の条件を
--  満たす場合に限り、再頒布および使用が許可されます。
--
--  1.ソースコード形式で再頒布する場合、上記の著作権表示、本条件一覧、および下記
--    免責条項をそのままの形で保持すること。
--  2.バイナリ形式で再頒布する場合、頒布物に付属のドキュメント等の資料に、上記の
--    著作権表示、本条件一覧、および下記免責条項を含めること。
--  3.書面による事前の許可なしに、本ソフトウェアを販売、および商業的な製品や活動
--    に使用しないこと。
--
--  本ソフトウェアは、著作権者によって「現状のまま」提供されています。著作権者は、
--  特定目的への適合性の保証、商品性の保証、またそれに限定されない、いかなる明示
--  的もしくは暗黙な保証責任も負いません。著作権者は、事由のいかんを問わず、損害
--  発生の原因いかんを問わず、かつ責任の根拠が契約であるか厳格責任であるか（過失
--  その他の）不法行為であるかを問わず、仮にそのような損害が発生する可能性を知ら
--  されていたとしても、本ソフトウェアの使用によって発生した（代替品または代用サ
--  ービスの調達、使用の喪失、データの喪失、利益の喪失、業務の中断も含め、またそ
--  れに限定されない）直接損害、間接損害、偶発的な損害、特別損害、懲罰的損害、ま
--  たは結果損害について、一切責任を負わないものとします。
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
--   JP: 日本語のコメント行は JP:を頭に付ける事にする
--
-------------------------------------------------------------------------------
-- Revision History
--
-- 29th,October,2006 modified by Kunihiko Ohnaka
--   - Insert the license text.
--   - Add the document part below.
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: ESE-VDPのパッケージファイルです。
-- JP: ESE-VDPに含まれるモジュールのコンポーネント宣言や、定数宣言、
-- JP: 型変換用の関数などが定義されています。
--

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE VDP_PACKAGE IS

	-- VDP ID
--	CONSTANT VDP_ID : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";  -- V9938
--	CONSTANT VDP_ID : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";  -- UNKNOWN
	CONSTANT VDP_ID : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";  -- V9958

	-- display start position ( when adjust=(0,0) )
	-- [from V9938 Technical Data Book]
	-- Horaizontal Display Parameters
	--  [non TEXT]
	--   * Total Display      1368 clks  - a
	--   * Right Border         59 clks  - b
	--   * Right Blanking       27 clks  - c
	--   * H-Sync Pulse Width  100 clks  - d
	--   * Left Blanking       102 clks  - e
	--   * Left Border          56 clks  - f
	-- OFFSET_X is the position when preDotCounter_x is -8. So,
	--    => (d+e+f-8*4-8*4)/4 => (100+102+56)/4 - 16 => 49
	--
	-- Vertical Display Parameters (NTSC)
	--                            [192 Lines]  [212 Lines]
	--                            [Even][Odd]  [Even][Odd]
	--   * V-Sync Pulse Width          3    3       3    3 lines - g
	--   * Top Blanking               13 13.5      13 13.5 lines - h
	--   * Top Border                 26   26      16   16 lines - i
	--   * Display Time              192  192     212  212 lines - j
	--   * Bottom Border            25.5   25    15.5   15 lines - k
	--   * Bottom Blanking             3    3       3    3 lines - l
	-- OFFSET_Y is the start line of Top Border (192 LInes Mode)
	--    => l+g+h => 3 + 3 + 13 = 19
	--
	-- CLOCK PER LINE
	-- JP: 4の倍数でなければならない
	CONSTANT CLOCKS_PER_LINE	: INTEGER := 1368;								-- = 342*4

	-- LEFT-TOP POSITION OF VISIBLE AREA
	CONSTANT OFFSET_X			: STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0101101";	-- = 45
	CONSTANT OFFSET_Y			: STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0010011";	-- = 19
END VDP_PACKAGE;
