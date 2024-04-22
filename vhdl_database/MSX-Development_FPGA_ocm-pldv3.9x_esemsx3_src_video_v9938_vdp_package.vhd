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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package vdp_package is

  -- VDP ID
  constant VDP_ID : std_logic_vector(4 downto 0) := "00000";  -- V9938
--  constant VDP_ID : std_logic_vector(4 downto 0) := "00001";  -- unknown
--  constant VDP_ID : std_logic_vector(4 downto 0) := "00010";  -- V9958

  -- switch the default display mode (NTSC or VGA)
--  constant DISPLAY_MODE : std_logic := '0';  -- NTSC
  constant DISPLAY_MODE : std_logic := '1';  -- VGA

  -- JP: 1ラインのクロック数
  -- JP: 4の倍数でなければならない
  constant CLOCKS_PER_LINE : integer := 1368;  -- 342x4
  shared variable OFFSET_Y : std_logic_vector( 6 downto 0);

  constant ADJUST0_X_NTSC : std_logic_vector( 6 downto 0) := "0110110";    -- = 220/4;
  constant ADJUST0_X_VGA  : std_logic_vector( 6 downto 0) := "0011011";    -- = 220/4/2;
  constant ADJUST0_Y : std_logic_vector( 6 downto 0) := "0101110";     -- = 3+3+13+26+1 = 46
  constant ADJUST0_Y_212 : std_logic_vector( 6 downto 0) := "0100100"; -- = 3+3+13+16+1 = 36

  component ram
    port(
      adr     : in  std_logic_vector(7 downto 0);
      clk     : in  std_logic;
      we      : in  std_logic;
      dbo     : in  std_logic_vector(7 downto 0);
      dbi     : out std_logic_vector(7 downto 0)
      );
  end component;

  component ntsc
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
  end component;

  component pal
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
  end component;

  component vga
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
  end component;

  component doublebuf
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
  end component;

  component linebuf
    port (
         address  : in  std_logic_vector(9 downto 0);
         inclock  : in  std_logic;
         we       : in  std_logic;
         data     : in  std_logic_vector(5 downto 0);
         q        : out std_logic_vector(5 downto 0)
        );
  end component;

  component text12
    port(
      -- VDP clock ... 21.477MHz
      clk21m  : in std_logic;
      reset   : in std_logic;

      dotState : in std_logic_vector(1 downto 0);
      dotCounterX : in std_logic_vector(8 downto 0);
      dotCounterY : in std_logic_vector(8 downto 0);

      vdpModeText1: in std_logic;
      vdpModeText2: in std_logic;

      -- registers
      vdpR7FrameColor : in std_logic_vector( 7 downto 0);
      vdpR12BlinkColor : in std_logic_vector( 7 downto 0);
      vdpR13BlinkPeriod : in std_logic_vector( 7 downto 0);

      vdpR2PtnNameTblBaseAddr : in std_logic_vector(6 downto 0);
      vdpR4PtnGeneTblBaseAddr : in std_logic_vector(5 downto 0);
      vdpR10R3ColorTblBaseAddr : in std_logic_vector(10 downto 0);

      --
      pRamDat : in std_logic_vector(7 downto 0);
      pRamAdr : out std_logic_vector(16 downto 0);
      txVramReadEn : out std_logic;

      pColorCode : out std_logic_vector(3 downto 0)
      );
  end component;

  component graphic123M
    port(
      -- VDP clock ... 21.477MHz
      clk21m  : in std_logic;
      reset   : in std_logic;

      dotState : in std_logic_vector(1 downto 0);
      eightDotState : in std_logic_vector(2 downto 0);
      dotCounterX : in std_logic_vector(8 downto 0);
      dotCounterY : in std_logic_vector(8 downto 0);

      vdpModeMulti: in std_logic;
      vdpModeGraphic1: in std_logic;
      vdpModeGraphic2: in std_logic;
      vdpModeGraphic3: in std_logic;

      -- registers
      VdpR2PtnNameTblBaseAddr : in std_logic_vector(6 downto 0);
      VdpR4PtnGeneTblBaseAddr : in std_logic_vector(5 downto 0);
      VdpR10R3ColorTblBaseAddr : in std_logic_vector(10 downto 0);
      --
      pRamDat : in std_logic_vector(7 downto 0);
      pRamAdr : out std_logic_vector(16 downto 0);

      pColorCode : out std_logic_vector(3 downto 0)
      );
  end component;

  component graphic4567
    port(
      -- VDP clock ... 21.477MHz
      clk21m  : in std_logic;
      reset   : in std_logic;

      dotState : in std_logic_vector(1 downto 0);
      eightDotState : in std_logic_vector(2 downto 0);
      dotCounterX : in std_logic_vector(8 downto 0);
      dotCounterY : in std_logic_vector(8 downto 0);

      vdpModeGraphic4: in std_logic;
      vdpModeGraphic5: in std_logic;
      vdpModeGraphic6: in std_logic;
      vdpModeGraphic7: in std_logic;

      -- registers
      VdpR2PtnNameTblBaseAddr : in std_logic_vector(6 downto 0);

      --
      pRamDat     : in std_logic_vector(7 downto 0);
      pRamDatPair : in std_logic_vector(7 downto 0);
      pRamAdr     : out std_logic_vector(16 downto 0);

      pColorCode : out std_logic_vector(7 downto 0)
      );
  end component;

  component sprite
    port(
      -- VDP clock ... 21.477MHz
      clk21m  : in std_logic;
      reset   : in std_logic;

      dotState : in std_logic_vector( 1 downto 0);
      eightDotState : in std_logic_vector( 2 downto 0);

      dotCounterX  : in std_logic_vector( 8 downto 0);
      dotCounterYp : in std_logic_vector( 8 downto 0);

      -- VDP Status Registers of SPRITE
      pVdpS0SpCollisionIncidence : out std_logic;
      pVdpS0SpOverMapped         : out std_logic;
      pVdpS0SpOverMappedNum      : out std_logic_vector(4 downto 0);
      pVdpS3S4SpCollisionX       : out std_logic_vector(8 downto 0);
      pVdpS5S6SpCollisionY       : out std_logic_vector(8 downto 0);
      pVdpS0ResetReq             : in  std_logic;
      pVdpS0ResetAck             : out std_logic;
      pVdpS5ResetReq             : in  std_logic;
      pVdpS5ResetAck             : out std_logic;
      -- VDP Registers
      vdpR1SpSize : in std_logic;
      vdpR1SpZoom : in std_logic;
      vdpR11R5SpAttrTblBaseAddr : in std_logic_vector(9 downto 0);
      vdpR6SpPtnGeneTblBaseAddr : in std_logic_vector( 5 downto 0);
      vdpR8Color0On : in std_logic;
      vdpR8SpOff : in std_logic;
      vdpR23VStartLine : in std_logic_vector(7 downto 0);
      spMode2 : in std_logic;
      vramInterleaveMode : in std_logic;

      spVramAccessing : out std_logic;

      pRamDat : in std_logic_vector( 7 downto 0);
      pRamAdr : out std_logic_vector(16 downto 0);

      spColorOut  : out std_logic;
      -- output color
      spColorCode : out std_logic_vector(3 downto 0)
      );
  end component;

  component spinforam
   port (
         address  : in  std_logic_vector(2 downto 0);
         inclock  : in  std_logic;
         we       : in  std_logic;
         data     : in  std_logic_vector(31 downto 0);
         q        : out std_logic_vector(31 downto 0)
        );
  end component;

  component osd
    port(
      -- VDP clock ... 21.477MHz
      clk21m  : in std_logic;
      reset   : in std_logic;

      -- video timing
      h_counter  : in std_logic_vector(10 downto 0);
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
  end component;

  -- convert character to 8 bit signed
  function char_to_std_logic_vector (char : character) return std_logic_vector;

end vdp_package;


-------------------------------------------------------------------------------
--
--  Package Body
--
-------------------------------------------------------------------------------
package body vdp_package is
function char_to_std_logic_vector (char : character) return std_logic_vector is
    variable result: std_logic_vector(7 downto 0);
  begin
    case char is
      when ' ' =>  result := X"20";
      when '!' =>  result := X"21";
      when '"' =>  result := X"22";
      when '#' =>  result := X"23";
      when '$' =>  result := X"24";
      when '%' =>  result := X"25";
      when '&' =>  result := X"26";
      when ''' =>  result := X"27";
      when '(' =>  result := X"28";
      when ')' =>  result := X"29";
      when '*' =>  result := X"2a";
      when '+' =>  result := X"2b";
      when ',' =>  result := X"2c";
      when '-' =>  result := X"2d";
      when '.' =>  result := X"2e";
      when '/' =>  result := X"2f";
      when '0' =>  result := X"30";
      when '1' =>  result := X"31";
      when '2' =>  result := X"32";
      when '3' =>  result := X"33";
      when '4' =>  result := X"34";
      when '5' =>  result := X"35";
      when '6' =>  result := X"36";
      when '7' =>  result := X"37";
      when '8' =>  result := X"38";
      when '9' =>  result := X"39";
      when ':' =>  result := X"3a";
      when ';' =>  result := X"3b";
      when '<' =>  result := X"3c";
      when '>' =>  result := X"3d";
      when '=' =>  result := X"3e";
      when '?' =>  result := X"3f";
      when '@' =>  result := X"40";
      when 'A' =>  result := X"41";
      when 'B' =>  result := X"42";
      when 'C' =>  result := X"43";
      when 'D' =>  result := X"44";
      when 'E' =>  result := X"45";
      when 'F' =>  result := X"46";
      when 'G' =>  result := X"47";
      when 'H' =>  result := X"48";
      when 'I' =>  result := X"49";
      when 'J' =>  result := X"4a";
      when 'K' =>  result := X"4b";
      when 'L' =>  result := X"4c";
      when 'M' =>  result := X"4d";
      when 'N' =>  result := X"4e";
      when 'O' =>  result := X"4f";
      when 'P' =>  result := X"50";
      when 'Q' =>  result := X"51";
      when 'R' =>  result := X"52";
      when 'S' =>  result := X"53";
      when 'T' =>  result := X"54";
      when 'U' =>  result := X"55";
      when 'V' =>  result := X"56";
      when 'W' =>  result := X"57";
      when 'X' =>  result := X"58";
      when 'Y' =>  result := X"59";
      when 'Z' =>  result := X"5a";
      when '[' =>  result := X"5b";
      when '\' =>  result := X"5c";
      when ']' =>  result := X"5d";
      when '^' =>  result := X"5e";
      when '_' =>  result := X"5f";
      when '`' =>  result := X"60";
      when 'a' =>  result := X"61";
      when 'b' =>  result := X"62";
      when 'c' =>  result := X"63";
      when 'd' =>  result := X"64";
      when 'e' =>  result := X"65";
      when 'f' =>  result := X"66";
      when 'g' =>  result := X"67";
      when 'h' =>  result := X"68";
      when 'i' =>  result := X"69";
      when 'j' =>  result := X"6a";
      when 'k' =>  result := X"6b";
      when 'l' =>  result := X"6c";
      when 'm' =>  result := X"6d";
      when 'n' =>  result := X"6e";
      when 'o' =>  result := X"6f";
      when 'p' =>  result := X"70";
      when 'q' =>  result := X"71";
      when 'r' =>  result := X"72";
      when 's' =>  result := X"73";
      when 't' =>  result := X"74";
      when 'u' =>  result := X"75";
      when 'v' =>  result := X"76";
      when 'w' =>  result := X"77";
      when 'x' =>  result := X"78";
      when 'y' =>  result := X"79";
      when 'z' =>  result := X"7a";
      when '{' =>  result := X"7b";
      when '|' =>  result := X"7c";
      when '}' =>  result := X"7d";
      when '~' =>  result := X"7e";
--      when ' ' =>  result := X"7f";
      when others =>  result := X"20";
    end case;

    return result;
  end;

end vdp_package;
