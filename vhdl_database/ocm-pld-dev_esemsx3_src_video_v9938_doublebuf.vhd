--
--  doublebuf.vhd
--    Double Buffered Line Memory.
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
-- Document
--
-- JP: ダブルバッファリング機能付きラインバッファモジュール。
-- JP: vga.vhdによるアップスキャンコンバートに使用します。
--
-- JP: xPositionWに X座標を入れ，weを 1にすると書き込みバッファに
-- JP: 書き込まれる．また，xPositionRに X座標を入れると，読み込み
-- JP: バッファから読み出した色コードが qから出力される。
-- JP: evenOdd信号によって，読み込みバッファと書き込みバッファが
-- JP: 切り替わる。

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.vdp_package.all;

entity doublebuf is
   port (
         clk        : in  std_logic;
         xPositionW : in  std_logic_vector(9 downto 0);
         xPositionR : in  std_logic_vector(9 downto 0);
         evenOdd    : in  std_logic;
         we         : in  std_logic;
         dataRin    : in  std_logic_vector(5 downto 0);
         dataGin    : in  std_logic_vector(5 downto 0);
         dataBin    : in  std_logic_vector(5 downto 0);
         dataRout   : out  std_logic_vector(5 downto 0);
         dataGout   : out  std_logic_vector(5 downto 0);
         dataBout   : out  std_logic_vector(5 downto 0)
        );
end doublebuf;

architecture RTL of doublebuf is
  signal we_e : std_logic;
  signal we_o : std_logic;
  signal addr_e : std_logic_vector(9 downto 0);
  signal addr_o : std_logic_vector(9 downto 0);
  signal outR_e : std_logic_vector(5 downto 0);
  signal outG_e : std_logic_vector(5 downto 0);
  signal outB_e : std_logic_vector(5 downto 0);
  signal outR_o : std_logic_vector(5 downto 0);
  signal outG_o : std_logic_vector(5 downto 0);
  signal outB_o : std_logic_vector(5 downto 0);
begin

  bufRe : linebuf port map(addr_e, clk, we_e, dataRin, outR_e);
  bufGe : linebuf port map(addr_e, clk, we_e, dataGin, outG_e);
  bufBe : linebuf port map(addr_e, clk, we_e, dataBin, outB_e);

  bufRo : linebuf port map(addr_o, clk, we_o, dataRin, outR_o);
  bufGo : linebuf port map(addr_o, clk, we_o, dataGin, outG_o);
  bufBo : linebuf port map(addr_o, clk, we_o, dataBin, outB_o);

  we_e <= we when evenOdd = '0' else '0';
  we_o <= we when evenOdd = '1' else '0';

  addr_e <= xPositionW when evenOdd = '0' else xPositionR;
  addr_o <= xPositionW when evenOdd = '1' else xPositionR;

  dataRout <= outR_e when evenOdd = '1' else outR_o;
  dataGout <= outG_e when evenOdd = '1' else outG_o;
  dataBout <= outB_e when evenOdd = '1' else outB_o;

end RTL;
