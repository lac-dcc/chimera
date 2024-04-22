--
--  ntsc.vhd
--   NTSC sync signal generator.
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
-- ??th,August,2006 modified by Kunihiko Ohnaka
--   - Move the equalization pulse generator from
--     vdp.vhd.
--
-- 13th,October,2003 created by Kunihiko Ohnaka
-- JP: VDPのコアの実装と表示デバイスへの出力を別ソースにした．
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: ESE-VDPコア(vdp.vhd)が生成したビデオ信号を、NTSCの
-- JP: タイミングに合った同期信号および映像信号に変換します。
-- JP: ESE-VDPコアはNTSCモード時は NTSCのタイミングで映像
-- JP: 信号や垂直同期信号を生成するため、本モジュールでは
-- JP: います。
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vdp_package.all;

entity ntsc is
  port(
    -- VDP clock ... 21.477MHz
    clk21m  : in std_logic;
    reset   : in std_logic;

    -- Video Input
    videoRin : in std_logic_vector( 5 downto 0);
    videoGin : in std_logic_vector( 5 downto 0);
    videoBin : in std_logic_vector( 5 downto 0);
    videoHSin_n : in std_logic;
    videoVSin_n : in std_logic;
    hCounterIn : in std_logic_vector(10 downto 0);
    vCounterIn : in std_logic_vector(10 downto 0);
    interlaceMode : in std_logic;

    -- Video Output
    videoRout : out std_logic_vector( 5 downto 0);
    videoGout : out std_logic_vector( 5 downto 0);
    videoBout : out std_logic_vector( 5 downto 0);
    videoHSout_n : out std_logic;
    videoVSout_n : out std_logic
    );
end ntsc;

architecture rtl of ntsc is
-- sync state register
  type typsstate is (sstate_A, sstate_B, sstate_C, sstate_D);
  signal sstate : typsstate;

  signal HS_n : std_logic;
begin

  process( clk21m, reset )
  begin
    if (reset = '1') then
      sstate <= sstate_A;
    elsif (clk21m'event and clk21m = '1') then
      if( (vCounterIn = 0) or
          (vCounterIn = 12) or
          ((vCounterIn = 524) and interlaceMode = '0') or
          ((vCounterIn = 525) and interlaceMode = '1') or
          ((vCounterIn = 524 + 12) and interlaceMode = '0') or
          ((vCounterIn = 525 + 12) and interlaceMode = '1') )then
        sstate <= sstate_A;
      elsif( (vCounterIn = 6) or
             ((vCounterIn = 524+6) and interlaceMode = '0') or
             ((vCounterIn = 525+6) and interlaceMode = '1') )then
        sstate <= sstate_B;
      elsif( (vCounterIn = 18) or
             ((vCounterIn = 524+18) and interlaceMode = '0') or
             ((vCounterIn = 525+18) and interlaceMode = '1') )then
        sstate <= sstate_C;
      end if;

      -- generate H sync pulse
      if( sstate = sstate_A ) then
        if( (hCounterIn = 1) or (hCounterIn = CLOCKS_PER_LINE/2+1) ) then
          HS_n <= '0';             -- pulse on
        elsif( (hCounterIn = 51) or (hCounterIn = CLOCKS_PER_LINE/2+51) ) then
          HS_n <= '1';             -- pulse off
        end if;
      elsif( sstate = sstate_B ) then
        if( (hCounterIn = CLOCKS_PER_LINE  -100+1) or
            (hCounterIn = CLOCKS_PER_LINE/2-100+1) ) then
          HS_n <= '0';             -- pulse on
        elsif( (hCounterIn =                   1) or
               (hCounterIn = CLOCKS_PER_LINE/2+1) ) then
          HS_n <= '1';             -- pulse off
        end if;
      elsif( sstate = sstate_C ) then
        if( hCounterIn = 1 ) then
          HS_n <= '0';             -- pulse on
        elsif( hCounterIn = 101 ) then
          HS_n <= '1';             -- pulse off
        end if;
      end if;

    end if;
  end process;

  videoHSout_n <= HS_n;
  videoVSout_n <= videoVSin_n;

  videoRout <= videoRin;
  videoGout <= videoGin;
  videoBout <= videoBin;

end rtl;



