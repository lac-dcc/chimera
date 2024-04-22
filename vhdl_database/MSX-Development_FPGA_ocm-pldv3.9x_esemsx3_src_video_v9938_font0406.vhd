--
--  font0406.vhd
--    4x6 dots ASCII font
--
--  Copyright (C) 2006 Kunihiko Ohnaka
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
-- Contributors
--
--   Mitsutaka Okazaki
--     - Original font designer.
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
-- JP: 4×6ドットのアスキーキャラクタフォントです。
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity font0406 is
  port (
    adr : in std_logic_vector(10 downto 0);
    clk : in std_logic;
    dbi : out std_logic_vector(3 downto 0)
  );
end font0406;

architecture RTL of font0406 is

type rom is array (0 to 1023) of std_logic_vector(3 downto 0);

constant osdfontsrom : rom := (
--  X"4",X"a",X"a",X"a",X"4",X"0",X"0",X"0",-- 0x00 '0'
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x0 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x2 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x3 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x4 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x5 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x6 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x7 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x8 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x9 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0xa ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0xb ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0xc ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0xd ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0xe ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0xf ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x10 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x11 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x12 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x13 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x14 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x15 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x16 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x17 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x18 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x19 ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1a ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1b ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1c ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1d ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1e ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x1f ' '
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x20 ' '
  X"4",X"4",X"4",X"0",X"4",X"0",X"0",X"0",-- 0x21 '!'
  X"a",X"a",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x22 '"'
  X"4",X"e",X"4",X"e",X"4",X"0",X"0",X"0",-- 0x23 '#'
  X"6",X"c",X"e",X"6",X"c",X"0",X"0",X"0",-- 0x24 '$'
  X"8",X"2",X"4",X"8",X"2",X"0",X"0",X"0",-- 0x25 '%'
  X"e",X"a",X"c",X"e",X"e",X"0",X"0",X"0",-- 0x26 '&'
  X"4",X"8",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x27 '''
  X"4",X"8",X"8",X"8",X"4",X"0",X"0",X"0",-- 0x28 '('
  X"8",X"4",X"4",X"4",X"8",X"0",X"0",X"0",-- 0x29 ')'
  X"0",X"a",X"4",X"a",X"0",X"0",X"0",X"0",-- 0x2a '*'
  X"0",X"4",X"e",X"4",X"0",X"0",X"0",X"0",-- 0x2b '+'
  X"0",X"0",X"0",X"4",X"8",X"0",X"0",X"0",-- 0x2c ','
  X"0",X"0",X"e",X"0",X"0",X"0",X"0",X"0",-- 0x2d '-'
  X"0",X"0",X"0",X"0",X"8",X"0",X"0",X"0",-- 0x2e '.'
  X"2",X"2",X"4",X"4",X"8",X"0",X"0",X"0",-- 0x2f '/'
  X"4",X"a",X"a",X"a",X"4",X"0",X"0",X"0",-- 0x30 '0'
  X"4",X"c",X"4",X"4",X"4",X"0",X"0",X"0",-- 0x31 '1'
  X"c",X"2",X"4",X"8",X"e",X"0",X"0",X"0",-- 0x32 '2'
  X"c",X"2",X"c",X"2",X"c",X"0",X"0",X"0",-- 0x33 '3'
  X"a",X"a",X"e",X"2",X"2",X"0",X"0",X"0",-- 0x34 '4'
  X"e",X"8",X"e",X"2",X"c",X"0",X"0",X"0",-- 0x35 '5'
  X"e",X"8",X"e",X"a",X"e",X"0",X"0",X"0",-- 0x36 '6'
  X"e",X"2",X"4",X"4",X"4",X"0",X"0",X"0",-- 0x37 '7'
  X"e",X"a",X"e",X"a",X"e",X"0",X"0",X"0",-- 0x38 '8'
  X"e",X"a",X"e",X"2",X"e",X"0",X"0",X"0",-- 0x39 '9'
  X"0",X"4",X"0",X"4",X"0",X"0",X"0",X"0",-- 0x3a ':'
  X"0",X"4",X"0",X"4",X"8",X"0",X"0",X"0",-- 0x3b ';'
  X"2",X"4",X"8",X"4",X"2",X"0",X"0",X"0",-- 0x3c '<'
  X"8",X"4",X"2",X"4",X"8",X"0",X"0",X"0",-- 0x3d '='
  X"0",X"e",X"0",X"e",X"0",X"0",X"0",X"0",-- 0x3e '>'
  X"e",X"a",X"6",X"0",X"4",X"0",X"0",X"0",-- 0x3f '?'
  X"6",X"a",X"e",X"e",X"6",X"0",X"0",X"0",-- 0x40 '@'
  X"4",X"a",X"e",X"a",X"a",X"0",X"0",X"0",-- 0x41 'A'
  X"c",X"a",X"c",X"a",X"c",X"0",X"0",X"0",-- 0x42 'B'
  X"6",X"8",X"8",X"8",X"6",X"0",X"0",X"0",-- 0x43 'C'
  X"c",X"a",X"a",X"a",X"c",X"0",X"0",X"0",-- 0x44 'D'
  X"e",X"8",X"e",X"8",X"e",X"0",X"0",X"0",-- 0x45 'E'
  X"e",X"8",X"e",X"8",X"8",X"0",X"0",X"0",-- 0x46 'F'
  X"6",X"8",X"a",X"a",X"6",X"0",X"0",X"0",-- 0x47 'G'
  X"a",X"a",X"e",X"a",X"a",X"0",X"0",X"0",-- 0x48 'H'
  X"e",X"4",X"4",X"4",X"e",X"0",X"0",X"0",-- 0x49 'I'
  X"2",X"2",X"2",X"a",X"4",X"0",X"0",X"0",-- 0x4a 'J'
  X"a",X"a",X"c",X"a",X"a",X"0",X"0",X"0",-- 0x4b 'K'
  X"8",X"8",X"8",X"8",X"e",X"0",X"0",X"0",-- 0x4c 'L'
  X"a",X"e",X"e",X"a",X"a",X"0",X"0",X"0",-- 0x4d 'M'
  X"a",X"e",X"e",X"e",X"a",X"0",X"0",X"0",-- 0x4e 'N'
  X"e",X"a",X"a",X"a",X"e",X"0",X"0",X"0",-- 0x4f 'O'
  X"e",X"a",X"e",X"8",X"8",X"0",X"0",X"0",-- 0x50 'P'
  X"e",X"a",X"a",X"c",X"6",X"0",X"0",X"0",-- 0x51 'Q'
  X"c",X"a",X"c",X"a",X"a",X"0",X"0",X"0",-- 0x52 'R'
  X"e",X"8",X"e",X"2",X"e",X"0",X"0",X"0",-- 0x53 'S'
  X"e",X"4",X"4",X"4",X"4",X"0",X"0",X"0",-- 0x54 'T'
  X"a",X"a",X"a",X"a",X"e",X"0",X"0",X"0",-- 0x55 'U'
  X"a",X"a",X"a",X"a",X"4",X"0",X"0",X"0",-- 0x56 'V'
  X"a",X"a",X"e",X"e",X"a",X"0",X"0",X"0",-- 0x57 'W'
  X"a",X"a",X"4",X"a",X"a",X"0",X"0",X"0",-- 0x58 'X'
  X"a",X"a",X"4",X"4",X"4",X"0",X"0",X"0",-- 0x59 'Y'
  X"e",X"2",X"4",X"8",X"e",X"0",X"0",X"0",-- 0x5a 'Z'
  X"c",X"8",X"8",X"8",X"c",X"0",X"0",X"0",-- 0x5b '['
  X"8",X"8",X"4",X"4",X"2",X"0",X"0",X"0",-- 0x5c '\'
  X"c",X"4",X"4",X"4",X"c",X"0",X"0",X"0",-- 0x5d ']'
  X"4",X"a",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x5e '^'
  X"0",X"0",X"0",X"0",X"e",X"0",X"0",X"0",-- 0x5f '_'
  X"8",X"4",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x60 '`'
  X"0",X"0",X"6",X"a",X"e",X"0",X"0",X"0",-- 0x61 'a'
  X"8",X"8",X"c",X"a",X"c",X"0",X"0",X"0",-- 0x62 'b'
  X"0",X"0",X"6",X"8",X"6",X"0",X"0",X"0",-- 0x63 'c'
  X"2",X"2",X"6",X"a",X"6",X"0",X"0",X"0",-- 0x64 'd'
  X"0",X"6",X"e",X"8",X"6",X"0",X"0",X"0",-- 0x65 'e'
  X"2",X"4",X"e",X"4",X"4",X"0",X"0",X"0",-- 0x66 'f'
  X"0",X"6",X"a",X"6",X"c",X"0",X"0",X"0",-- 0x67 'g'
  X"8",X"8",X"e",X"a",X"a",X"0",X"0",X"0",-- 0x68 'h'
  X"4",X"0",X"4",X"4",X"4",X"0",X"0",X"0",-- 0x69 'i'
  X"4",X"0",X"4",X"4",X"8",X"0",X"0",X"0",-- 0x6a 'j'
  X"8",X"8",X"a",X"c",X"a",X"0",X"0",X"0",-- 0x6b 'k'
  X"4",X"4",X"4",X"4",X"4",X"0",X"0",X"0",-- 0x6c 'l'
  X"0",X"e",X"e",X"a",X"a",X"0",X"0",X"0",-- 0x6d 'm'
  X"0",X"c",X"a",X"a",X"a",X"0",X"0",X"0",-- 0x6e 'n'
  X"0",X"4",X"a",X"a",X"4",X"0",X"0",X"0",-- 0x6f 'o'
  X"0",X"c",X"a",X"c",X"8",X"0",X"0",X"0",-- 0x70 'p'
  X"0",X"6",X"a",X"6",X"2",X"0",X"0",X"0",-- 0x71 'q'
  X"0",X"6",X"8",X"8",X"8",X"0",X"0",X"0",-- 0x72 'r'
  X"0",X"e",X"c",X"2",X"e",X"0",X"0",X"0",-- 0x73 's'
  X"4",X"e",X"4",X"4",X"6",X"0",X"0",X"0",-- 0x74 't'
  X"0",X"a",X"a",X"a",X"6",X"0",X"0",X"0",-- 0x75 'u'
  X"0",X"a",X"a",X"a",X"4",X"0",X"0",X"0",-- 0x76 'v'
  X"0",X"a",X"a",X"e",X"e",X"0",X"0",X"0",-- 0x77 'w'
  X"0",X"a",X"4",X"4",X"a",X"0",X"0",X"0",-- 0x78 'x'
  X"0",X"a",X"a",X"6",X"c",X"0",X"0",X"0",-- 0x79 'y'
  X"0",X"e",X"2",X"4",X"e",X"0",X"0",X"0",-- 0x7a 'z'
  X"6",X"4",X"8",X"4",X"6",X"0",X"0",X"0",-- 0x7b '{'
  X"4",X"4",X"0",X"4",X"4",X"0",X"0",X"0",-- 0x7c '|'
  X"c",X"4",X"2",X"4",X"c",X"0",X"0",X"0",-- 0x7d '}'
  X"a",X"4",X"0",X"0",X"0",X"0",X"0",X"0",-- 0x7e '~'
  X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0" -- 0x7f ' '
);

begin

process (clk) begin
  if (clk'event and clk = '1') then
    dbi <= osdfontsrom(conv_integer(adr(9 downto 0)));
  end if;
end process;

end RTL;
