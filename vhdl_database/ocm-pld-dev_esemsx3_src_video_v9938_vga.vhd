--
--  vga.vhd
--   VGA up-scan converter.
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
-- 20th,August,2006 modified by Kunihiko Ohnaka
--  - Change field mapping algorithm when interlace
--    mode is enabled.
--        even field  -> even line (odd  line is black)
--        odd  field  -> odd line  (even line is black)
--
-- 13th,October,2003 created by Kunihiko Ohnaka
-- JP: VDPのコアの実装と表示デバイスへの出力を別ソースにした．
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: ESE-VDPコア(vdp.vhd)が生成したビデオ信号を、VGAタイミングに
-- JP: 変換するアップスキャンコンバータです。
-- JP: NTSCは水平同期周波数が15.7kHz、垂直同期周波数が60Hzですが、
-- JP: VGAの水平同期周波数は31.5kHz、垂直同期周波数は60Hzであり、
-- JP: ライン数だけがほぼ倍になったようなタイミングになります。
-- JP: そこで、vdpを ntscモードで動かし、各ラインを倍の速度で
-- JP: 二度描画することでスキャンコンバートを実現しています。
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vdp_package.all;

entity vga is
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
end vga;

architecture rtl of vga is
  -- video output enable
  signal videoOutX : std_logic;
--  signal videoOutY : std_logic;

  -- double buffer signal
  signal xPositionW : std_logic_vector(9 downto 0);
  signal xPositionR : std_logic_vector(9 downto 0);
  signal evenOdd    : std_logic;
  signal we_buf     : std_logic;
  signal dataRout   : std_logic_vector(5 downto 0);
  signal dataGout   : std_logic_vector(5 downto 0);
  signal dataBout   : std_logic_vector(5 downto 0);

  -- DISP_START_X + DISP_WIDTH < CLOCKS_PER_LINE/2 = 684
  constant DISP_WIDTH : integer := 562;  -- 30 + 512 + 20
  constant DISP_START_X : integer := 120;
begin

  videoRout <= dataRout when videoOutX = '1' else (others => '0');
  videoGout <= dataGout when videoOutX = '1' else (others => '0');
  videoBout <= dataBout when videoOutX = '1' else (others => '0');

  dbuf : doublebuf port map(clk21m, xPositionW, xPositionR, evenOdd, we_buf,
                            videoRin, videoGin, videoBin,
                            dataRout, dataGout, dataBout);

  xPositionW <= hCounterIn(10 downto 1) - (CLOCKS_PER_LINE/2 - DISP_WIDTH - 10);
  evenOdd <= vCounterIn(1);
  we_buf <= '1';

  process( clk21m, reset )
  begin
    if (reset = '1') then
      videoHSout_n <= '1';
      videoVSout_n <= '1';
      videoOutX <= '0';
      xPositionR <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then

      -- Generate V-SYNC signal.
      -- The videoVSin_n signal is not used.
      if( interlaceMode = '0' ) then
        if( (vCounterIn = 3*2) or (vCounterIn = 524+3*2) )then
          videoVSout_n <= '0';
        elsif( (vCounterIn = 6*2) or (vCounterIn = 524+6*2) ) then
          videoVSout_n <= '1';
        end if;
      else
        if( (vCounterIn = 3*2) or (vCounterIn = 525+3*2) )then
          videoVSout_n <= '0';
        elsif( (vCounterIn = 6*2) or (vCounterIn = 525+6*2) ) then
          videoVSout_n <= '1';
        end if;
      end if;

      -- Generate H-SYNC signal.
      -- The videoHSin_n signal is not used.
      if( (hCounterIn = 0) or (hCounterIn = (CLOCKS_PER_LINE/2)) ) then
        videoHSout_n <= '0';
      elsif( (hCounterIn = 40) or (hCounterIn = (CLOCKS_PER_LINE/2) + 40) ) then
        videoHSout_n <= '1';
      end if;

      -- Generate data read timing.
      if( (hCounterIn = DISP_START_X) or
          (hCounterIn = DISP_START_X + (CLOCKS_PER_LINE/2)) ) then
        xPositionR <= (others => '0');
      else
        xPositionR <= xPositionR + 1;
      end if;

      -- Generate video output timing.
      if( (hCounterIn = DISP_START_X) or
          ((hCounterIn = DISP_START_X + (CLOCKS_PER_LINE/2)) and interlaceMode = '0') ) then
        videoOutX <= '1';
      elsif( (hCounterIn = DISP_START_X+DISP_WIDTH) or
             (hCounterIn = DISP_START_X+DISP_WIDTH + (CLOCKS_PER_LINE/2)) ) then
        videoOutX <= '0';
      end if;

    end if;

  end process;
end rtl;




