--
--  graphic123M.vhd
--    Imprementation of Graphic Mode 1,2,3 and Multicolor Mode.
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
-- 12th,August,2006 created by Kunihiko Ohnaka
-- JP: VDPのコアの実装とスクリーンモードの実装を分離した
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: GRAPHICモード1,2,3および MULTICOLORモードのメイン処理回路です。
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vdp_package.all;

entity graphic123M is
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
end graphic123M;
architecture rtl of graphic123M is
  signal logicalVramAddrNam : std_logic_vector(16 downto 0);
  signal logicalVramAddrGen : std_logic_vector(16 downto 0);
  signal logicalVramAddrCol : std_logic_vector(16 downto 0);

  signal patternNum : std_logic_vector( 7 downto 0);
  signal prePattern : std_logic_vector( 7 downto 0);
  signal preColor : std_logic_vector( 7 downto 0);
  signal pattern : std_logic_vector( 7 downto 0);
  signal color : std_logic_vector( 7 downto 0);

begin

  -- JP: RAMは dotStateが"10","00"の時にアドレスを出して"01"でアクセスする。
  -- JP: eightDotStateで見ると、
  -- JP:  0-1    Read pattern num.
  -- JP:  1-2    Read pattern
  -- JP:  2-3    Read color.
  -- JP: となる。
  --
  -- JP: よって、以下のようなタイミングで画面の描画を行う。
  --
  -- [データリード系]
  --                     |-----------|-----------|-----------|-----------|
  -- eightDotState    0=><====1=====><====2=====><====3=====><====4=====>
  -- dotState         "10"00"01"11"10"00"01"11"10"00"01"11"10"00"01"11"10"
  --                  <ADR0>      <ADR1>      <ADR2>                  <ADRa>
  --                     <PN>        <PT>        <CO>
  --
  --                     |-----------|-----------|-----------|-----------|
  -- eightDotState    4=><====5=====><====6=====><====7=====><====0=====>
  -- dotState         "10"00"01"11"10"00"01"11"10"00"01"11"10"00"01"11"10"
  --                  <ADRa>      <ADRa>      <ADRb>      <ADRc>      <ADR4>
  --  ※ADRa～cはVDPコマンドやスプライトのY座標検査、VRAM R/Wに使われる
  --
  -- [描画系(4ドット分のみ)]
  --                     |-----------|-----------|-----------|-----------|
  -- eightDotState    7=><====0=====><====1=====><====2=====><====3=====>
  -- dotState         "10"00"01"11"10"00"01"11"10"00"01"11"10"00"01"11"10"
  -- Shift OUT               <D0>                    <D1>
  -- Palette Addr              <D0>        <D0>        <D1>        <D1>
  -- Palette Data                 <D0>        <D0>        <D1>        <D1>
  -- Display Output                  <D0========><D0========><D1=========><D1==
  --

  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------

  -- VRAM address mappings.
  logicalVramAddrNam <=  (VdpR2PtnNameTblBaseAddr & dotCounterY(7 downto 3) & dotCounterX(7 downto 3) );

  logicalVramAddrGen <= (VdpR4PtnGeneTblBaseAddr & patternNum & dotCounterY(2 downto 0)) when vdpModeGraphic1 = '1' else
                        (VdpR4PtnGeneTblBaseAddr(5 downto 2) & dotCounterY(7 downto 6) & patternNum & dotCounterY(2 downto 0) ) and
                        ("1111" & VdpR4PtnGeneTblBaseAddr(1 downto 0) & "11111111" & "111");

  logicalVramAddrCol <= (VdpR4PtnGeneTblBaseAddr & patternNum & dotCounterY(4 downto 2)) when vdpModeMulti = '1' else
                        (VdpR10R3ColorTblBaseAddr & '0' & patternNum( 7 downto 3 )) when  vdpModeGraphic1 = '1' else
                        (VdpR10R3ColorTblBaseAddr(10 downto 7) & dotCounterY(7 downto 6) & patternNum & dotCounterY(2 downto 0)) and
                        ("1111" & VdpR10R3ColorTblBaseAddr(6 downto 0) & "111111" );

  process( clk21m, reset )
  begin
    if(reset = '1' ) then
      patternNum <= (others => '0');
      pattern <= (others => '0');
      prePattern <= (others => '0');
      color <= (others => '0');
      preColor <= (others => '0');
      pRamAdr <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then

      case dotState is
        when "11" =>
          case eightDotState is
            when "000" =>
              -- read pattern name table
              pRamAdr <= logicalVramAddrNam;
            when "001" =>
              -- read pattern Generator table
              pRamAdr <= logicalVramAddrGen;
            when "010" =>
              -- read color table
              -- (or pattern of multi color)
              pRamAdr <= logicalVramAddrCol;
            when others =>
              null;
          end case;
        when "10" =>
          null;
        when "00" =>
          null;
        when "01" =>
          case eightDotState is
            when "001" =>
              -- read pattern name table
              patternNum <= pRamDat;
            when "010" =>
              -- read pattern Generator table
              prePattern <= pRamDat;
            when "011" =>
              -- read color table
              -- (color of multi color)
              preColor <= pRamDat;
            when others =>
              null;
          end case;
        when others => null;
      end case;

      -- Color code decision
      -- JP: "01"と"10"のタイミングでカラーコードを出力してあげれば、
      -- JP: VDPエンティティの方でパレットをデコードして色を出力してくれる。
      -- JP: "01"と"10"で同じ色を出力すれば横256ドットになり、違う色を
      -- JP: 出力すれば横512ドット表示となる。
      case dotState is
        when "00" =>
          if( eightDotState = "000" ) then
            -- load next 8 dot data
            pattern <= prePattern;
            color <= preColor;
          end if;
        when "01" =>
          -- パターンに応じてカラーコードを決定
          if( vdpModeMulti = '1' ) then
            if( eightDotState(2) = '0' ) then
              pColorCode <= color(7 downto 4);
            else
              pColorCode <= color(3 downto 0);
            end if;
          elsif( pattern(7) = '1' ) then
            pColorCode <= color(7 downto 4);
          else
            pColorCode <= color(3 downto 0);
          end if;
          -- パターンをシフト
          pattern <= pattern(6 downto 0) & '0';
        when "11" =>
          null;
        when "10" =>
          null;
        when others => null;
      end case;
    end if;
  end process;
end rtl;
