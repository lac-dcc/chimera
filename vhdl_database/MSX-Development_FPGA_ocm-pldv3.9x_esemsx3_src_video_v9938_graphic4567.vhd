--
--  graphic4567.vhd
--    Imprementation of Graphic Mode 4,5,6 and 7.
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
-- JP: GRAPHICモード4,5,6,7のメイン処理回路です。
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vdp_package.all;

entity graphic4567 is
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
end graphic4567;
architecture rtl of graphic4567 is
  signal logicalVramAddrG45 : std_logic_vector(16 downto 0);
  signal logicalVramAddrG67 : std_logic_vector(16 downto 0);
  signal localDotCounterX : std_logic_vector(8 downto 0);
  signal latchedPtnNameTblBaseAddr : std_logic_vector(6 downto 0);

  signal fifoAddr : std_logic_vector( 7 downto 0);
  signal fifoAddr_in : std_logic_vector( 7 downto 0);
  signal fifoAddr_out : std_logic_vector( 7 downto 0);
  signal fifoWe : std_logic;
  signal fifoIn : std_logic;
  signal fifoData_in : std_logic_vector( 7 downto 0);
  signal fifoData_out : std_logic_vector( 7 downto 0);

  signal colorData : std_logic_vector(7 downto 0);
begin

  -- JP: RAMは dotStateが"10","00"の時にアドレスを出して"01"でアクセスする。
  -- JP: また、"10"のタイミングではA16の異なるペアになるバイトを読み出す事ができる。
  -- JP: (実機のVDPのDRAMインターリーブに相当。GRAPHIC6,7でしか使わない。あとTEXT2もか?)
  -- JP: 実機では8ドット分のデータを4ドット分の時間でバーストで一気に読み、
  -- JP: 残りの4ドットの時間でVRAM R/Wや VDPコマンドを実行している。
  -- JP: 似非VDPでも同様に、8ドットの最初の4ドット中に描画用のデータを読み、
  -- JP: 残りの4ドットの期間でVRAM R/Wや VDPコマンドを実行する。
  --
  -- JP: よって、以下のようなタイミングで画面の描画を行う事。
  --
  -- [データリード系]
  --                     |-----------|-----------|-----------|-----------|
  -- eightDotState    0=><====1=====><====2=====><====3=====><====4=====>
  -- dotState         "10"00"01"11"10"00"01"11"10"00"01"11"10"00"01"11"10"
  --                  <ADR0>      <ADR1>      <ADR2>      <ADR3>      <ADRa>
  --                     <D0>  <P0>  <D1>  <P1>  <D2>  <P2>  <D3>  <P3>
  -- FIFO IN(G4,G5)         <D0>        <D1>        <D2>        <D3>
  -- FIFO IN(G6,G7)         <D0>  <P0>  <D1>  <P1>  <D2>  <P2>  <D3>  <P3>
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
  -- (GRAPHIC4)
  -- FIFO OUT               <D0>                    <D1>
  -- Palette Addr              <D0>        <D0>        <D1>        <D1>
  -- Palette Data                 <D0>        <D0>        <D1>        <D1>
  -- Display Output                  <D0========><D0========><D1=========><D1==
  -- (GRAPHIC5)
  -- FIFO OUT               <D0>                    <D1>
  -- Palette Addr              <D0>  <D0>  <D0>  <D0>  <D1>  <D1>  <D1>  <D1>
  -- Palette Data                 <D0>  <D0>  <D0>  <D0>  <D1>  <D1>  <D1>  <D1>
  -- Display Output                  <D0==><D0==><D0==><D0==><D1==><D1==><D1==><D1==>
  -- (GRAPHIC6)
  -- FIFO OUT               <D0>        <P0>        <D1>        <P1>
  -- Palette Addr              <D0>  <D0>  <P0>  <P0>  <D1>  <D1>  <P1>  <P1>
  -- Palette Data                 <D0>  <D0>  <P0>  <P0>  <D1>  <D1>  <P1>  <P1>
  -- Display Output                  <D0==><D0==><P0==><P0==><D1==><D1==><P1==><P1==>
  -- (GRAPHIC7)
  -- FIFO OUT               <D0>        <P0>        <D1>        <P1>
  -- Direct Color              <D0===>     <P0===>     <D1===>     <P1===>
  -- Display Output                  <D0========><P0========><D1=========><P1==
  --

  ----------------------------------------------------------------
  -- FIFO and control signals
  ----------------------------------------------------------------
  fifoAddr <= fifoAddr_in when (fifoIn = '1') else
              fifoAddr_out;
  fifoWe   <= '1' when fifoIn = '1' else '0';
  fifoData_in <= pRamDat when (dotState = "00") or (dotState = "01") else
                 pRamDatPair;

  fifoMem : ram port map(fifoAddr, clk21m, fifoWe, fifoData_in, fifoData_out);

  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------

  -- VRAM address mappings.
  logicalVramAddrG45 <=  (latchedPtnNameTblBaseAddr(6 downto 0) & "1111111111") and
                         ("11" & dotCounterY(7 downto 0) & localDotCounterX(7 downto 1));
  logicalVramAddrG67 <=  (latchedPtnNameTblBaseAddr(5 downto 0) & "11111111111") and
                         ("1" & dotCounterY(7 downto 0) & localDotCounterX(7 downto 0));

  process( clk21m, reset )
  begin
    if(reset = '1' ) then
      fifoAddr_in <= (others => '0');
      fifoAddr_out <= (others => '0');
      fifoIn <= '0';
      pRamAdr <= (others => '0');
      latchedPtnNameTblBaseAddr <= (others => '0');
      localDotCounterX <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then


      case dotState is
        when "00" =>
          if( eightDotState = "000" ) then
            localDotCounterX <= dotCounterX(8 downto 3) & "000";
            latchedPtnNameTblBaseAddr <= vdpR2PtnNameTblBaseAddr;
            fifoIn <= '0';
            if( dotCounterX = 0 ) then
              fifoAddr_in <= (others => '0');
            end if;
          elsif( (eightDotState = "001") or
                 (eightDotState = "010") or
                 (eightDotState = "011") or
                 (eightDotState = "100") ) then
            fifoIn <= '1';
            -- 倍速で読み出すので、2ずつ増える
            localDotCounterX <= localDotCounterX + 2;
          end if;
        when "01" =>
          -- 前のステートでfifoIn = '1'を出力したら、ここ(この次のクロックエッジ)で
          -- FIFOにデータが取り込まれる
          if( fifoIn = '1' ) then
              fifoIn <= '0';
              fifoAddr_in <= fifoAddr_in + 1;
          end if;
        when "11" =>
          if( ((vdpModeGraphic6 = '1') or (vdpModeGraphic7 = '1')) and
              ((eightDotState = "001") or
               (eightDotState = "010") or
               (eightDotState = "011") or
               (eightDotState = "100")) ) then
            -- GRAPHIC6,7の時はペアデータも使う
            fifoIn <= '1';
          end if;
          -- 次のデータのアドレス
          if( (vdpModeGraphic4 = '1') or (vdpModeGraphic5 = '1') ) then
            pRamAdr <= logicalVramAddrG45(16 downto 0);
          else
            pRamAdr <= logicalVramAddrG67(0) & logicalVramAddrG67(16 downto 1);
          end if;
        when "10" =>
          -- JP: 前のステートでfifoIn = '1'を出力したら、ここ(この次のクロックエッジ)で
          -- JP: FIFOにデータが取り込まれる
          -- JP: ここで取り込まれるデータはペアデータ
          if( fifoIn = '1' ) then
            fifoIn <= '0';
            fifoAddr_in <= fifoAddr_in + 1;
          end if;
        when others =>
          null;
      end case;

      -- Color code decision
      -- JP: "01"と"10"のタイミングでかラーコードを出力してあげれば、
      -- JP: VDPエンティティの方でパレットをデコードして色を出力してくれる。
      -- JP: "01"と"10"で同じ色を出力すれば横256ドットになり、違う色を
      -- JP: 出力すれば横512ドット表示となる。
      case dotState is
        when "00" =>
          null;
        when "01" =>
          -- JP: ここでFIFOのデータ出力を取り込み、最初のドットのカラーコードを決定
          if( (vdpModeGraphic4 ='1') or (vdpModeGraphic5 ='1') ) then
            -- JP: GRAPHIC5は高解像度モードだが、その処理はvdpエンティティのほうで
            -- JP: おこなっているので、ここでの動作はGRAPHIC4と全く同じで良い。
            if( eightDotState(0) = '0' ) then
              colorData <= fifoData_out;
              fifoAddr_out <= fifoAddr_out + 1;
              pColorCode(7 downto 4) <= (others => '0');
              pColorCode(3 downto 0) <= fifoData_out(7 downto 4);
            else
              pColorCode(7 downto 4) <= (others => '0');
              pColorCode(3 downto 0) <= colorData(3 downto 0);
            end if;
          elsif( vdpModeGraphic6 ='1' ) then
            colorData <= fifoData_out;
            fifoAddr_out <= fifoAddr_out + 1;
            pColorCode(7 downto 4) <= (others => '0');
            pColorCode(3 downto 0) <= fifoData_out(7 downto 4);
          else
            pColorCode <= fifoData_out;
            fifoAddr_out <= fifoAddr_out + 1;
          end if;
        when "11" =>
          null;
        when "10" =>
          -- High resolution mode .
          if( vdpModeGraphic6 = '1' ) then
            pColorCode(7 downto 4) <= (others => '0');
            pColorCode(3 downto 0) <= colorData(3 downto 0);
          end if;

          -- fifo read address reset
          -- (Note: dotCounterX(preDotCounter_x) will be count up at "11")
          if( dotCounterX = X"08") then
            fifoAddr_out <= (others => '0');
          end if;
        when others => null;
      end case;

    end if;
  end process;
end rtl;
