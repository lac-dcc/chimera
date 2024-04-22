--
--  osd.vhd
--   On-Screen-Display module.
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
-------------------------------------------------------------------------------
-- Document
--
-- JP: 補助的な情報を表示する為のOn-Screen-Displayモジュールです。
-- JP: 本来のVDPには存在しませんが、デバッグ目的でESE-VDPや他の
-- JP: モジュールの内部状態を視覚的に確認するために用意しています。
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.vdp_package.all;

entity osd is
  port(
    -- VDP clock ... 21.477MHz
    clk21m  : in std_logic;
    reset   : in std_logic;

    -- video timing
    h_counter   : in std_logic_vector(10 downto 0);
    dotCounterY : in std_logic_vector( 7 downto 0);

    -- pattern name table access
    locateX    : in std_logic_vector( 5 downto 0);
    locateY    : in std_logic_vector( 4 downto 0);
    charCodeIn : in std_logic_vector( 7 downto 0);
    charWrReq  : in std_logic;
    charWrAck  : out std_logic;

    -- Video Output
    videoR     : out std_logic_vector( 3 downto 0);
    videoG     : out std_logic_vector( 3 downto 0);
    videoB     : out std_logic_vector( 3 downto 0)
    );
end osd;

architecture rtl of osd is
  component font0406 is
    port (
      adr : in std_logic_vector(10 downto 0);
      clk : in std_logic;
      dbi : out std_logic_vector(3 downto 0)
      );
  end component;
  component osdnametable is
    port (
      address  : in  std_logic_vector(10 downto 0);
      inclock  : in  std_logic;
      we       : in  std_logic;
      data     : in  std_logic_vector(7 downto 0);
      q        : out std_logic_vector(7 downto 0)
      );
  end component;

  constant WINDOW_START_X : integer := 264;
  constant WINDOW_START_Y : integer := 0;

  signal charCode    : std_logic_vector(7 downto 0);
  signal fontAddr    : std_logic_vector(10 downto 0);
  signal patternOut  : std_logic_vector(3 downto 0);

  signal window   : std_logic;
  signal window_x : std_logic;
  signal window_y : std_logic;

  -- JP: OSD中の文字の座標
  signal charLocateX : std_logic_vector(6 downto 0);
  signal charLocateY : std_logic_vector(4 downto 0);
  -- JP: 文字中の座標
  signal charX : std_logic_vector(1 downto 0);
  signal charY : std_logic_vector(2 downto 0);

  signal iCharWrAck : std_logic;

  signal iVideoR     : std_logic_vector( 3 downto 0);
  signal iVideoG     : std_logic_vector( 3 downto 0);
  signal iVideoB     : std_logic_vector( 3 downto 0);

  signal pattern : std_logic_vector(3 downto 0);

  -- pattern name table signals
  signal patternNameTableAddr    : std_logic_vector(10 downto 0);
  signal patternNameTableWe      : std_logic;
  signal patternNameTableInData  : std_logic_vector(7 downto 0);
  signal patternNameTableOutData : std_logic_vector(7 downto 0);
begin

  charWrAck <= iCharWrAck;

  U1 : font0406 port map ( fontAddr, clk21m, patternOut );

  -- pattern name table
  U2 : osdnametable port map ( patternNameTableAddr, clk21m, patternNameTableWe, patternNameTableInData, patternNameTableOutData );

  process( clk21m, reset )
  begin
    if (reset = '1') then
      charCode    <= (others => '0');
      fontAddr    <= (others => '0');
      window_x    <= '0';
      window_y    <= '0';
      charLocateX <= (others => '0');
      charLocateY <= (others => '0');
      charX       <= (others => '0');
      charY       <= (others => '0');
      iVideoR     <= (others => '0');
      iVideoG     <= (others => '0');
      iVideoB     <= (others => '0');
      pattern     <= (others => '0');
      iCharWrAck  <= '0';
    elsif (clk21m'event and clk21m = '1') then

      case h_counter(1 downto 0) is
        when "00" =>
          patternNameTableWe <= '0';
          patternNameTableAddr <= charLocateY & charLocateX( 5 downto 0);

          if( h_counter(10 downto 2) = WINDOW_START_X/4 ) then
            charLocateX <= (others => '0');
            charX <= conv_std_logic_vector(1, charX'length);
            if( dotCounterY = WINDOW_START_Y ) then
              charLocateY <= (others => '0');
              charY <= (others => '0');
              window_y <= '1';
            elsif( dotCounterY = WINDOW_START_Y+6*32 ) then
              window_y <= '0';
            else
              if( charY = 5) then
                charLocateY <= charLocateY + 1;
                charY <= (others => '0');
              else
                charY <= charY + 1;
              end if;
            end if;
          else
            -- JP: カウンタが一周した
            if( charLocateX(6) = '1' ) then
              window_x <= '0';
            end if;
          end if;
        when "01" =>
          null;
        when "10" =>
          case charX is
            when "00" =>
              pattern <= patternOut;
              charX <= (others => '0');
              charCode <= charCode + 1;
            when "11" =>
              fontAddr <= patternNameTableOutData & charY;
              if( charLocateX(6) = '0' ) then
                charLocateX <= charLocateX + 1;
              end if;
              if( charLocateX = 0 ) then
                window_x <= '1';
              end if;
            when others => null;
          end case;
        when "11" =>
          if( pattern(3) = '1') then
            iVideoR <= "1111";
            iVideoG <= "1111";
            iVideoB <= "1111";
          else
            iVideoR <= "0000";
            iVideoG <= "0000";
            iVideoB <= "0000";
          end if;
          pattern <= pattern(2 downto 0) & '0';
          charX <= charX + 1;

          -- pattern name table write address
          if( charWrReq /= iCharWrAck ) then
            patternNameTableWe <= '1';
            patternNameTableAddr <= locateY & locateX;
            patternNameTableInData  <= charCodeIn;
            iCharWrAck <= not iCharWrAck;
          end if;
        when others => null;
      end case;

    end if;
  end process;

  window <= window_x and window_y;
  videoR <= iVideoR when window = '1' else (others => '0');
  videoG <= iVideoG when window = '1' else (others => '0');
  videoB <= iVideoB when window = '1' else (others => '0');

end rtl;
