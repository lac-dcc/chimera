--
--  sprite.vhd
--    Sprite module.
--
--  Copyright (C) 2004-2006 Kunihiko Ohnaka
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
-- 26th,August,2006 modified by Kunihiko Ohnaka
--   - latch the base addresses every eight dot cycle
--     (DRAM RAS/CAS access emulation)
--
-- 20th,August,2006 modified by Kunihiko Ohnaka
--   - Change the drawing algorithm.
--   - Add sprite collision checking function.
--   - Add sprite over-mapped checking function.
--   - Many bugs are fixed, and it works fine.
--   - (first release virsion)
--
-- 17th,August,2004 created by Kunihiko Ohnaka
--   - Start new sprite module implementing.
--     * This module uses Block RAMs so that shrink the
--       circuit size.
--     * Separate sprite module from vdp.vhd.
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: この実装ではBLOCKRAMを使い、消費するSLICEを節約するのが狙い。
-- JP: この実装を使わない状態での vdp.vhdをコンパイルした時の
-- JP: SLICE使用数は1900前後。
-- JP: 2006/8/16。このスプライトを使わない最新版(Cyclone)では、
-- JP:            2726LCだった.
-- JP: 2006/8/19。このスプライトを使ったところ、2278LCまで減少。
-- JP:
-- JP: [用語]
-- JP: ・ローカルプレーン番号
-- JP:   あるライン上に並んでいるスプライト(プレーン)だけを抜き出して
-- JP:   スプライトプレーン番号順に並べた時の順位。
-- JP:   例えばあるラインにスプライトプレーン#1,#4,#5が存在する場合、
-- JP:   それぞれのスプライトのローカルプレーン番号は#0,#1,#2となる。
-- JP:   スプライトモード2でも横一列に最大8枚しか並ばないので、
-- JP:   ローカルプレーン番号は最大で#7となる。
-- JP:
-- JP: ・画面描画帯域
-- JP:    VDPの実機は8ドット(32クロック)で連続アドレス上のデータ4バイト
-- JP:    (GRAPHIC6,7ではRAMのインターリーブアクセスによりバイト)
-- JP:    のリードに加え、ランダムアドレスへの2サイクル(2バイト)の
-- JP:    アクセスが加納
-- JP:    それらのDRAMアクセスサイクルに以下のように名前を付ける。
-- JP:     * 画面描画リードサイクル
-- JP:     * スプライトY座標検査サイクル
-- JP:     * ランダムアクセスサイクル
-- JP:
-- JP: ○似非VDPでのVRAMアクセスサイクル
-- JP:    似非VDPでは旧式のDRAMではなくより高速なメモリを使用している。
-- JP:    そのため、４クロックに1回確実にランダムアクセスを実行できる
-- JP:    メモリを持っている事を前提としてコーディングします。
-- JP:    また、Cyclone版似非MSXでは、16ビット幅のSDRAMを用いている
-- JP:    ため、一回のアクセスで連続する16ビットのデータを読む事も可能
-- JP:    です。
-- JP:    似非VDPでは、D0～D7の下位8ビットをVRAMの前半64Kバイト、
-- JP:    D8～D15の上位8ビットを後半64Kバイトにマッピングしています。
-- JP:    このような変則的な割り当てをするのは、実機のVDPのメモリ
-- JP:    マップをまねるためです。実際、4クロックで2バイトのメモリを
-- JP:    読み出す帯域が必要になるのはGRAPHIC6,7のモードだけです。
-- JP:    実機のVDPは、GRAPHIC6,7ではメモリのインターリーブを用い、
-- JP:    (GRAPHIC7における)偶数ドットをVRAMの前半64Kバイトに
-- JP:    わりあて、奇数ドットを後半64Kバイトに割り当てています。
-- JP:    そのため、似非VDPでも前半64Kと後半64Kの同一アドレス上の
-- JP:    データを１サイクル(4クロック)で読み出せる必要があるので
-- JP:    このようなマッピングになっています。
-- JP:    単純に言えば、SDRAMの16ビットアクセスを、実機のDRAMの
-- JP:    インターリーブアクセスに見立てているということです。
-- JP:
-- JP:    いろいろな現象から、VDPの内部は8ドットサイクルで動いていると
-- JP:    推測されています。8ドット、つまり32クロックのどうさをメモリ
-- JP:    の帯域から推測すると、以下のようになります。
-- JP:
-- JP:   　　ドット　：<=0=><=1=><=2=><=3=><=4=><=5=><=6=><=7=>
-- JP:   通常アクセス： A0   A1   A2   A3   A4  (A5)  A6  (A7)
-- JP: インターリーブ： B0   B1   B2   B3
-- JP:
-- JP:    - 描画中
-- JP:   　　・A0～A3 (B0～B3)
-- JP:        画面描画のために使用。B0～B3はインターリーブで同時に
-- JP:        読み出せるデータで、GRAPHIC6,7でしか使わない。
-- JP:   　　・A4     スプライトY座標検査
-- JP:   　　・A6     VRAM R/W or VDPコマンド (2回に一回ずつ、交互に割り当てる)
-- JP:
-- JP:     - 非描画中(スプライト準備中)
-- JP:    　　・A0     スプライトX座標リード
-- JP:    　　・A1     スプライトパターン番号リード
-- JP:    　　・A2     スプライトパターン左リード
-- JP:    　　・A3     スプライトパターン右リード
-- JP:    　　・A4     スプライトカラーリード
-- JP:    　　・A6     VRAM R/W or VDPコマンド (2回に一回ずつ、交互に割り当てる)
-- JP:
-- JP:   A5とA7のスロットは実際には使用することもできるのですが、
-- JP:   これを使ってしまうと実機よりも帯域が増えてしまうので、
-- JP:   あえて使わずに残しています。
-- JP:   また、非描画中のサイクルは、実機とは異なります。実機では
-- JP:   64クロックで 2つのスプライトをまとめて処理する事で、DRAMの
-- JP:   ページモードサイクルを有効利用できるようにしています。
-- JP:   また、その64クロックの中にはVRAMやVDPコマンドに割くための
-- JP:   スロットが無いので、64クロックサイクルの隙間にVRAMアク
-- JP:   セスのための隙間を空けているのかもしれません。（未確認）
-- JP:   似非VDPでもその動作を完全に真似する事は可能ですが、
-- JP:   ソースが必要以上に複雑に見えてしまうのと、2のn乗サイクル
-- JP:   からずれてしまうのがちょっぴり嫌だったので、上記のような
-- JP:   きれいなサイクルにしています。
-- JP:   どうしても実機と同じタイミングにしたいという方は
-- JP:   チャレンジしてみてください。
-- JP:

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vdp_package.all;

entity sprite is
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

    -- JP: スプライトを描画した時に'1'になる。カラーコード0で
    -- JP: 描画する事もできるので、このビットが必要
    spColorOut  : out std_logic;
    -- output color
    spColorCode : out std_logic_vector(3 downto 0)
    );
end sprite;

architecture rtl of sprite is
  constant SpMode1_nSprites: integer := 4;
  constant SpMode2_nSprites: integer := 8;

  signal spOffLatched : std_logic;
  signal dotCounterYLatched : std_logic_vector(8 downto 0);

  signal vdpS0ResetAck : std_logic;
  signal vdpS5ResetAck : std_logic;

  -- for spinforam
  signal spInfoRamAddr     : std_logic_vector(2 downto 0);
  signal spInfoRamWe       : std_logic;
  signal spInfoRamData_in  : std_logic_vector(31 downto 0);
  signal spInfoRamData_out : std_logic_vector(31 downto 0);

  signal spInfoRamX_in        : std_logic_vector( 8 downto 0);
  signal spInfoRamPattern_in  : std_logic_vector(15 downto 0);
  signal spInfoRamColor_in    : std_logic_vector( 3 downto 0);
  signal spInfoRamCC_in       : std_logic;
  signal spInfoRamIC_in       : std_logic;
  signal spInfoRamX_out       : std_logic_vector( 8 downto 0);
  signal spInfoRamPattern_out : std_logic_vector(15 downto 0);
  signal spInfoRamColor_out   : std_logic_vector( 3 downto 0);
  signal spInfoRamCC_out      : std_logic;
  signal spInfoRamIC_out      : std_logic;

  type typeSpState is (spstate_idle, spstate_ytest_draw, spstate_prepare);
  signal spState : typeSpState;

  -- JP: スプライトプレーン番号型
  subtype spPlaneNumType is std_logic_vector(4 downto 0);
  -- JP: スプライトプレーン番号×横方向表示枚数の配列
  type spRenderPlanesType is array( 0 to SpMode2_nSprites-1) of spPlaneNumType;
  signal spRenderPlanes : spRenderPlanesType;

  signal iRamAdr        : std_logic_vector(16 downto 0);
  signal iRamAdrYTest   : std_logic_vector(16 downto 0);
  signal iRamAdrPrepare : std_logic_vector(16 downto 0);

  signal spAttrTblBaseAddr   : std_logic_vector( vdpR11R5SpAttrTblBaseAddr'length -1 downto 0);
  signal spPtnGeneTblBaseAddr: std_logic_vector( vdpR6SpPtnGeneTblBaseAddr'length -1 downto 0);
  signal readVramAddrYRead   : std_logic_vector(16 downto 0);
  signal readVramAddrXRead   : std_logic_vector(16 downto 0);
  signal readVramAddrPNRead  : std_logic_vector(16 downto 0);
  signal readVramAddrCRead   : std_logic_vector(16 downto 0);
  signal readVramAddrPTRead  : std_logic_vector(16 downto 0);

  -- JP: Y座標検査中のプレーン番号
  signal spYTestPlaneNum     : std_logic_vector( 4 downto 0);
  signal spYTestListUpCounter : std_logic_vector(3 downto 0);  -- 0 - 8
  signal spYTestEnd          : std_logic;
  -- JP: 下書きデータ準備中のローカルプレーン番号
  signal spPrepareLocalPlaneNum   : std_logic_vector( 2 downto 0);
  -- JP: 下書きデータ準備中のプレーン番号
  signal spPreparePlaneNum   : std_logic_vector( 4 downto 0);
  -- JP: 下書きデータ準備中のスプライトのYライン番号(スプライトのどの部分を描画するか)
  signal spPrepareLineNum    : std_logic_vector( 3 downto 0);
  -- JP: 下書きデータ準備中のスプライトのX位置。0の時左8ドット。1の時右8ドット。(16x16モードのみで使用)
  signal spPrepareXPos       : std_logic;
  signal spPreparePatternNum : std_logic_vector( 7 downto 0);
  -- JP: 下書データの準備が終了した
  signal spPrepareEnd        : std_logic;
  signal spCcD : std_logic;

  -- JP: 下書きをしているスプライトのローカルプレーン番号
  signal spPreDrawLocalPlaneNum : std_logic_vector(2 downto 0);  -- 0 - 7
  signal spPreDrawEnd           : std_logic;

  -- JP: ラインバッファへの描画用
  signal spDrawX : std_logic_vector(8 downto 0);  -- -32 - 287 (=256+31)
  signal spDrawPattern :std_logic_vector(15 downto 0);
  signal spDrawColor :std_logic_vector(3 downto 0);

  -- JP: スプライト描画ラインバッファの制御信号
  signal spLineBufAddr_e : std_logic_vector( 7 downto 0);
  signal spLineBufAddr_o : std_logic_vector( 7 downto 0);
  signal spLineBufWe_e : std_logic;
  signal spLineBufWe_o : std_logic;
  signal spLineBufData_in_e : std_logic_vector( 7 downto 0);
  signal spLineBufData_in_o : std_logic_vector( 7 downto 0);
  signal spLineBufData_out_e : std_logic_vector( 7 downto 0);
  signal spLineBufData_out_o : std_logic_vector( 7 downto 0);

  signal spLineBufDispWe : std_logic;
  signal spLineBufDrawWe : std_logic;
  signal spLineBufDispX : std_logic_vector( 7 downto 0);
  signal spLineBufDrawX : std_logic_vector( 7 downto 0);
  signal spLineBufDrawColor : std_logic_vector(7 downto 0);
  signal spLineBufDispData_out : std_logic_vector( 7 downto 0);
  signal spLineBufDrawData_out : std_logic_vector( 7 downto 0);

  signal spWindowX   : std_logic;

begin
  pVdpS0ResetAck <= vdpS0ResetAck;
  pVdpS5ResetAck <= vdpS5ResetAck;

  ----------------------------------------------------------------
  -- SPRITE information array
  ----------------------------------------------------------------
  iSpinforam : spinforam port map(spInfoRamAddr, clk21m, spInfoRamWe,
                                  spInfoRamData_in, spInfoRamData_out);

  spInfoRamData_in <= "0" &
                      spInfoRamX_in & spInfoRamPattern_in &
                      spInfoRamColor_in & spInfoRamCC_in & spInfoRamIC_in;
  spInfoRamX_out       <= spInfoRamData_out(30 downto 22);
  spInfoRamPattern_out <= spInfoRamData_out(21 downto  6);
  spInfoRamColor_out   <= spInfoRamData_out( 5 downto  2);
  spInfoRamCC_out      <= spInfoRamData_out(1);
  spInfoRamIC_out      <= spInfoRamData_out(0);

  spInfoRamAddr <= spPrepareLocalPlaneNum when spState = spstate_prepare else
                   spPreDrawLocalPlaneNum;

  ----------------------------------------------------------------
  -- SPRITE Line Buffer
  ----------------------------------------------------------------
  spLineBuf_e : ram port map(spLineBufAddr_e, clk21m, spLineBufWe_e,
                             spLineBufData_in_e, spLineBufData_out_e);
  spLineBuf_o : ram port map(spLineBufAddr_o, clk21m, spLineBufWe_o,
                             spLineBufData_in_o, spLineBufData_out_o);

  spLineBufAddr_e       <= spLineBufDispX      when dotCounterYp(0) = '0' else spLineBufDrawX;
  spLineBufData_in_e    <= "00000000"          when dotCounterYp(0) = '0' else spLineBufDrawColor;
  spLineBufWe_e         <= spLineBufDispWe     when dotCounterYp(0) = '0' else spLineBufDrawWe;
  spLineBufDispData_out <= spLineBufData_out_e when dotCounterYp(0) = '0' else spLineBufData_out_o;

  spLineBufAddr_o       <= spLineBufDrawX      when dotCounterYp(0) = '0' else spLineBufDispX;
  spLineBufData_in_o    <= spLineBufDrawColor  when dotCounterYp(0) = '0' else "00000000";
  spLineBufWe_o         <= spLineBufDrawWe     when dotCounterYp(0) = '0' else spLineBufDispWe;
  spLineBufDrawData_out <= spLineBufData_out_o when dotCounterYp(0) = '0' else spLineBufData_out_e;



  -----------------------------------------------------------------------------

  readVramAddrYread <= spAttrTblBaseAddr & spPreparePlaneNum & "00";
  readVramAddrXread <= spAttrTblBaseAddr & spPreparePlaneNum & "01";
  readVramAddrPNread <= spAttrTblBaseAddr & spPreparePlaneNum & "10";
  readVramAddrCread <= spAttrTblBaseAddr & spPreparePlaneNum & "11" when spMode2 = '0' else
                       spAttrTblBaseAddr(9 downto 3) & not spAttrTblBaseAddr(2) & spPreparePlaneNum & spPrepareLineNum;

  readVramAddrPTread <=
    -- 8x8 mode
    spPtnGeneTblBaseAddr & spPreparePatternNum(7 downto 0) & spPrepareLineNum( 2 downto 0) when vdpR1SpSize = '0' else
    -- 16x16 mode
    spPtnGeneTblBaseAddr & spPreparePatternNum(7 downto 2) & spPrepareXPos & spPrepareLineNum( 3 downto 0);

  spPrepareXPos <= '1' when eightDotState = "100" else
                   '0';

  -- JP: VRAMアクセスアドレスの出力
  iRamAdr <= iRamAdrYTest when spState = spstate_ytest_draw else
             iRamAdrPrepare;
  pRamAdr <= iRamAdr(16 downto 0)  when vramInterleaveMode = '0' else
             iRamAdr(0) & iRamAdr(16 downto 1);

  -----------------------------------------------------------------------------
  -- SPRITE main process.
  -----------------------------------------------------------------------------
  process( clk21m, reset )
    variable spYTestEndV : std_logic;
    variable spListUpY : std_logic_vector( 7 downto 0);
    variable spCC0FoundV : std_logic;
    variable lastCC0LocalPlaneNumV : std_logic_vector(2 downto 0);
    variable spDrawXV : std_logic_vector(8 downto 0);  -- -32 - 287 (=256+31)
    variable vdpS0SpCollisionIncidenceV : std_logic;
    variable vdpS0SpOverMappedV         : std_logic;
    variable vdpS0SpOverMappedNumV      : std_logic_vector(4 downto 0);
    variable vdpS3S4SpCollisionXV       : std_logic_vector(8 downto 0);
    variable vdpS5S6SpCollisionYV       : std_logic_vector(8 downto 0);
  begin
    if( reset ='1' ) then
      spState <= spstate_idle;
      spOffLatched <= '1';
      iRamAdrPrepare <= (others => '0');
      iRamAdrYTest   <= (others => '0');
      spYTestPlaneNum <= (others => '0');
      spPrepareLocalPlaneNum <= (others => '0');
      spPrepareEnd <= '0';
      spVramAccessing <= '0';
      for i in 0 to SpMode2_nSprites -1 loop
        spRenderPlanes(i) <= (others => '0');
      end loop;
      vdpS0SpCollisionIncidenceV := '0';
      vdpS0SpOverMappedV := '0';
      vdpS0SpOverMappedNumV := (others => '0');
      vdpS3S4SpCollisionXV := (others => '0');
      vdpS5S6SpCollisionYV := (others => '0');
      spCC0FoundV := '0';
      lastCC0LocalPlaneNumV := (others => '0');
    elsif (clk21m'event and clk21m = '1') then

      -- latching address signals
      if( (dotCounterX = 0) and (dotState = "01") ) then
        --   +1 should be needed. Because it will be drawn in the next line.
        dotCounterYLatched <= dotCounterYp + ('0' & vdpR23VStartLine) + 1;

        spPtnGeneTblBaseAddr <= vdpR6SpPtnGeneTblBaseAddr;
        if( spMode2 = '0' ) then
          spAttrTblBaseAddr <= vdpR11R5SpAttrTblBaseAddr(9 downto 0);
        else
          spAttrTblBaseAddr <= vdpR11R5SpAttrTblBaseAddr(9 downto 2) & "00";
        end if;
      end if;

      ---------------------------------------------------------------------------
      -- JP: 画面描画中        : 8ドット描画する間に1プレーン、スプライトのY座標を検査し、
      -- JP:                    表示すべきスプライトをリストアップする。
      -- JP: 画面非描画中      : リストアップしたスプライトの情報を集め、inforamに格納
      -- JP: 次の画面描画中    : inforamに格納された情報を元に、ラインバッファに描画
      -- JP: 次の次の画面描画中: ラインバッファに描画された絵を出力し、画面描画に混ぜる
      ---------------------------------------------------------------------------
      -- Timing generation
      if( dotState = "10") then
        case spState is
          when spstate_idle =>
            if( dotCounterX = 0 ) then
              spState <= spstate_ytest_draw;
              if( vdpR8SpOff = '0' ) then
                spVramAccessing <= '1';
              else
                spVramAccessing <= '0';
              end if;
            end if;
          when spstate_ytest_draw =>
            if( dotCounterX = 256+8 ) then
              spState <= spstate_prepare;
              if( spOffLatched = '0' ) then
                spVramAccessing <= '1';
              else
                spVramAccessing <= '0';
              end if;
            end if;
          when spstate_prepare =>
            if( spPrepareEnd = '1' ) then
              spState <= spstate_idle;
              spVramAccessing <= '0';
            end if;
          when others =>
            spState <= spstate_idle;
        end case;
      end if;

      -- Y-testing
      case dotState is
        when "11" =>
          iRamAdrYTest <= spAttrTblBaseAddr & spYTestPlaneNum & "00";
        when "10" =>
            null;
        when "00" =>
          null;
        when "01" =>
          if( dotCounterX = 0 ) then
            -- initialize
            spYTestPlaneNum  <= (others => '0');
            spYTestListUpCounter  <= (others => '0');
            spYTestEnd <= '0';
            spOffLatched <= vdpR8SpOff;
          elsif( (eightDotState = "110") and (spYTestEnd = '0') ) then
            -- JP: Y座標のアドレスはdotStae="10"の時に出ている。
            spYTestPlaneNum <= spYTestPlaneNum + 1;
            if( spYTestPlaneNum = 31 ) then
              spYTestEndV := '1';
            else
              spYTestEndV := '0';
            end if;
            spListUpY := dotCounterYLatched(7 downto 0) - pRamDat;
            -- JP: Y座標が 208の時、それ以降のスプライトを OFF (SpMode2ではY=216)
            if( (spMode2 = '0' and pRamDat = "11010000") or       -- Y = 208
                (spMode2 = '1' and pRamDat = "11011000") ) then   -- Y = 216
              spYTestEndV := '1';
            elsif( ((spListUpY( 7 downto 3) = "00000") and
                    (VdpR1SpSize = '0' ) and (VdpR1SpZoom='0')) or
                   ((spListUpY( 7 downto 4) = "0000" ) and
                    (VdpR1SpSize = '1' ) and (VdpR1SpZoom='0')) or
                   ((spListUpY( 7 downto 4) = "0000" ) and
                    (VdpR1SpSize = '0' ) and (VdpR1SpZoom='1')) or
                   ((spListUpY( 7 downto 5) = "000"  ) and
                    (VdpR1SpSize = '1' ) and (VdpR1SpZoom='1')) ) then
              -- JP: このライン上に乗っているプレーンを発見した！
              if( ((spYTestListUpCounter < 4) and (spMode2 = '0')) or
                  ((spYTestListUpCounter < 8) and (spMode2 = '1')) ) then
                -- JP: まだ横4枚(モード2では8枚)読んでない時
                -- JP: プレーン番号だけ覚えておく
                spRenderPlanes(conv_integer(spYTestListUpCounter)) <= spYTestPlaneNum;
                spYTestListUpCounter <= spYTestListUpCounter + 1;
              else
                spYTestEndV := '1';
                -- SPRITE was over mapped.
                if( vdpS0SpOverMappedV = '0' ) then
                  vdpS0SpOverMappedV := '1';
                  vdpS0SpOverMappedNumV := spYTestPlaneNum;
                end if;
              end if;
            end if;
            spYTestEnd <= spYTestEndV;
          end if;
        when others => null;
      end case;

      -- prepareing
      case dotState is
        when "11" =>
          spInfoRamWe <= '0';
          case eightDotState is
            -- Sprite Attribute Table
            --        7 6 5 4 3 2 1 0
            --  +0 : |       Y       |
            --  +1 : |       X       |
            --  +2 : | Pattern Num   |
            --  +3 : |EC0 0 0| Color | (mode 1)
            when "000" =>               -- Y read
              iRamAdrPrepare <= readVramAddrYread;
            when "001" =>               -- X read
              iRamAdrPrepare <= readVramAddrXread;
            when "010" =>               -- Pattern Num read
              iRamAdrPrepare <= readVramAddrPNread;
            when "011" | "100" =>       -- Pattern read
              iRamAdrPrepare <= readVramAddrPTread;
            when "101" =>               -- Color read
              iRamAdrPrepare <= readVramAddrCread;
            when others => null;
          end case;
        when "10" =>
          null;
        when "00" =>
          null;
        when "01" =>
          if( spState = spstate_prepare ) then
            case eightDotState is
              when "001" =>               -- Y read
                -- JP: スプライトの何行目が該当したか覚えておく
                spListUpY := dotCounterYLatched(7 downto 0) - pRamDat;
                if( VdpR1SpZoom = '0' ) then
                  spPrepareLineNum  <= spListUpY(3 downto 0);
                else
                  spPrepareLineNum  <= spListUpY(4 downto 1);
                end if;
              when "010" =>               -- X read
                spInfoRamX_in <= '0' & pRamDat;
              when "011" =>               -- Pattern Num read
                spPreparePatternNum <= pRamDat;
              when "100" =>               -- Pattern read left
                spInfoRamPattern_in(15 downto 8) <= pRamDat;
              when "101" =>               -- Pattern read right
                if( VdpR1SpSize = '0' ) then
                  -- 8x8 mode
                  spInfoRamPattern_in( 7 downto 0) <= (others => '0');
                else
                  -- 16x16 mode
                  spInfoRamPattern_in( 7 downto 0) <= pRamDat;
                end if;
              when "110" =>               -- Color read
                -- color
                spInfoRamColor_in <= pRamDat(3 downto 0);
                -- CC
                if(spMode2 = '1') then
                  spInfoRamCC_in <= pRamDat(6);
                else
                  spInfoRamCC_in <= '0';
                end if;
                -- IC
                spInfoRamIC_in <= pRamDat(5) and spMode2;
                -- EC
                if( pRamDat(7) = '1' ) then
                  -- EC = '1';
                  spInfoRamX_in <= spInfoRamX_in - 32;
                end if;

                -- If all of the sprites list-uped are readed,
                -- the sprites left should not be drawn.
                if( (spPrepareLocalPlaneNum >= spYTestListUpCounter) or
                    (spOffLatched = '1') ) then
                  spInfoRamPattern_in <= (others => '0');
                end if;

                -- Write sprite informations to spInfoRam.
                spInfoRamWe <= '1';
              when "111" =>
                spPrepareLocalPlaneNum <= spPrepareLocalPlaneNum + 1;
                if( spPrepareLocalPlaneNum = 7 ) then
                  spPrepareEnd <= '1';
                end if;
                spPreparePlaneNum <= spRenderPlanes(conv_integer(spPrepareLocalPlaneNum+1));

              when others => null;
            end case;
          else
            spPreparePlaneNum <= spRenderPlanes(0);
            spPrepareLocalPlaneNum <= (others => '0');
            spPrepareEnd <= '0';
            spInfoRamWe <= '0';
          end if;
        when others => null;
      end case;


      -------------------------------------------------------------------------
      -- Drawing to line buffer.
      --
      -- JP: この回路は dotCounterXのカウンタを利用して下書きする。
      -- JP:   0から31 　ローカルプレーン0の描画
      -- JP:  32から63 　ローカルプレーン1の描画
      -- JP:     :               :
      -- JP:    から255　ローカルプレーン1の描画
      -------------------------------------------------------------------------
      if( spState = spstate_ytest_draw ) then
        case dotState is
          when "10" =>
            spLineBufDrawWe <= '0';
          when "00" =>
            if( dotCounterX(4 downto 0) = 1 ) then
              spDrawPattern <= spInfoRamPattern_out;
              spDrawXV      := spInfoRamX_out;
            else
              if( (VdpR1SpZoom = '0') or (dotCounterX(0) = '1') ) then
                spDrawPattern <= spDrawPattern(14 downto 0) & "0";
              end if;
              spDrawXV := spDrawX + 1;
            end if;
            spDrawX        <= spDrawXV;
            spLineBufDrawX <= spDrawXV(7 downto 0);
          when "01" =>
            spDrawColor <= spInfoRamColor_out;
          when "11" =>
            if( spInfoRamCC_out = '0' ) then
              lastCC0LocalPlaneNumV := spPreDrawLocalPlaneNum;
              spCC0FoundV := '1';
            end if;
            if( (spDrawPattern(15) = '1') and (spDrawX(8) = '0') and (spPreDrawEnd = '0') and
                ((vdpR8Color0On = '1') or (spDrawColor /= 0)) ) then
              -- JP: スプライトのドットを描画
              -- JP: ラインバッファの7ビット目は、何らかの色を描画した時に'1'になる。
              -- JP: ラインバッファの6-4ビット目はそこに描画されているドットのローカルプレーン番号
              -- JP: (色合成されているときは親となるCC='0'のスプライトのローカルプレーン番号)が入る。
              -- JP: つまり、lastCC0LocalPlaneNumVがこの番号と等しいときはOR合成してよい事になる。
              if( (spLineBufDrawData_out(7) = '0') and (spCC0FoundV = '1') ) then
                -- JP: 何も描かれていない(ビット7が'0')とき、このドットに初めての
                -- JP: スプライトが描画される。ただし、CC='0'のスプライトが同一ライン上にまだ
                -- JP: 現れていない時は描画しない
                spLineBufDrawColor <= ("1" & lastCC0LocalPlaneNumV & spDrawColor);
                spLineBufDrawWe <= '1';
              elsif( (spLineBufDrawData_out(7) = '1') and (spInfoRamCC_out = '1') and
                     (spLineBufDrawData_out(6 downto 4) = lastCC0LocalPlaneNumV) ) then
                -- JP: 既に絵が描かれているが、CCが'1'でかつこのドットに描かれているスプライトの
                -- JP: localPlaneNumが lastCC0LocalPlaneNumVと等しい時は、ラインバッファから
                -- JP: 下地データを読み、書きたい色と論理和を取リ、書き戻す。
                spLineBufDrawColor <= spLineBufDrawData_out or ("0000" & spDrawColor);
                spLineBufDrawWe <= '1';
              elsif( (spLineBufDrawData_out(7) = '1') and
                     (spInfoRamCC_out = '0') ) then
                spLineBufDrawColor <= spLineBufDrawData_out;
                -- JP: スプライトが衝突。
                -- SPRITE colision occured
                vdpS0SpCollisionIncidenceV := '1';
                vdpS3S4SpCollisionXV := spDrawX + 12;
                -- Note: Drawing line is previous line.
                vdpS5S6SpCollisionYV := dotCounterYLatched + 7;
              end if;
            end if;
            --
            if( dotCounterX = 0 ) then
              spPreDrawLocalPlaneNum <= (others => '0');
              spPreDrawEnd <= '0';
              lastCC0LocalPlaneNumV := (others => '0');
              spCC0FoundV := '0';
            elsif( dotCounterX(4 downto 0) = 0 ) then
              spPreDrawLocalPlaneNum <= spPreDrawLocalPlaneNum + 1;
              if( spPreDrawLocalPlaneNum = 7 ) then
                spPreDrawEnd <= '1';
              end if;
            end if;
          when others => null;
        end case;
      end if;

      -- status register
      if( pVdpS0ResetReq /= vdpS0ResetAck ) then
        vdpS0ResetAck <= pVdpS0ResetReq;
        vdpS0SpCollisionIncidenceV := '0';
        vdpS0SpOverMappedV := '0';
        vdpS0SpOverMappedNumV := (others => '0');
      end if;
      if( pVdpS5ResetReq /= vdpS5ResetAck ) then
        vdpS5ResetAck <= pVdpS5ResetReq;
        vdpS3S4SpCollisionXV := (others => '0');
        vdpS5S6SpCollisionYV := (others => '0');
      end if;

      pVdpS0SpCollisionIncidence <= vdpS0SpCollisionIncidenceV;
      pVdpS0SpOverMapped    <= vdpS0SpOverMappedV;
      pVdpS0SpOverMappedNum <= vdpS0SpOverMappedNumV;
      pVdpS3S4SpCollisionX  <= vdpS3S4SpCollisionXV;
      pVdpS5S6SpCollisionY  <= vdpS5S6SpCollisionYV;

    end if;
  end process;


  -----------------------------------------------------------------------------
  -- JP: 画面へのレンダリング。vdpエンティティがdotState="11"の時に値を取得できるように、
  -- JP: "01"のタイミングで出力する。
  -----------------------------------------------------------------------------
  process( clk21m, reset )
  begin
    if( reset = '1' ) then
      spLineBufDispWe <= '0';
      spLineBufDispX  <= (others => '0');
      spWindowX <= '0';
    elsif (clk21m'event and clk21m = '1') then
      case dotState is
        when "10" =>
          spLineBufDispWe <= '0';
          if( dotCounterX = 8) then
            -- JP: dotCounterと実際の表示(カラーコードの出力)は8ドットずれている
            spWindowX <= '1';
            spLineBufDispX <= (others => '0');
          else
            spLineBufDispX <= spLineBufDispX + 1;
            if( spLineBufDispX = X"FF" ) then
              spWindowX <= '0';
            end if;
          end if;
        when "00" =>
          null;
        when "01" =>
          if( spWindowX = '1' ) then
            spColorOut  <= spLineBufDispData_out(7);
            spColorCode <= spLineBufDispData_out(3 downto 0);
          else
            spColorOut  <= '0';
            spColorCode <= (others => '0');
          end if;
        when "11" =>
          -- clear displayed dot
          if( spWindowX = '1' ) then
            spLineBufDispWe <= '1';
          end if;
        when others => null;
      end case;

    end if;
  end process;

end rtl;

