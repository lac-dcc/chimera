--
--  vdp.vhd
--   Top VHDL Source of ESE-VDP.
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
-- Contributors
--
--   Kazuhiro Tsujikawa
--     - Bug fixes
--   Alex Wulms
--     - Bug fixes
--     - Expansion and improvement of the VDP-Command engine
--     - Improvement of the TEXT2 mode.
--
-------------------------------------------------------------------------------
-- Memo
--   Japanese comment lines are starts with "JP:".
--   JP: 日本語のコメント行は JP:を頭に付ける事にする
--
-------------------------------------------------------------------------------
-- Todo
--   * support VdpCmdMXS, VdpCmdMXD bits in command engine
--
-------------------------------------------------------------------------------
-- Revision History
--
-- 25th,December,2010 modified by KdL
--   - OSD Debug Window disabled.
--
-- 13th,April,2008 modified by KdL
--   - Forced VGA mode to 60Hz.
--
-- 29th,October,2006 modified by Kunihiko Ohnaka
--   - Insert the license text.
--   - Add the document part below.
--
-- 03rd,Sep,2006 modified by Kunihiko Ohnaka
--  - fix several UNKNOWN REALITY problems
--    - Horizontal Sprites problem
--    - Overscan problem
--    - [NOP] zoom demo problem
--    - 'Star Wars Scroll' demo problem
--
-- 20th,Aug,2006 modified by Kunihiko Ohnaka
--  - Separate SPRITE module.
--  - Fix the palette rewriting timing problem.
--  - Add interlace double resolution function. (Two page mode)
--
-- 15th,Aug,2006 modified by Kunihiko Ohnaka
--  - Separate ntsc sync generator module.
--  - Separate screen mode modules.
--  - Fix the sprite posision problem on GRAPHIC6.
--
-- 15th,Jan,2006 modified by Alex Wulms
-- text 2 mode  : debug blink function
-- high-res modi: debug 'screen off'
-- text 1&2 mode: debug VdpR23 scroll and color "0000" handling
-- all modi     : precalculate adjustx, adjusty once per line

-- 01st,Jan,2006 modified by Alex Wulms
-- Add blink support to text 2 mode
--
-- 16th,Aug,2005 modified by Kazuhiro Tsujikawa
-- JP: TMS9918モードでVRAMインクリメントを下位14ビットに限定
--
-- 08th,May,2005 modified by Kunihiko Ohnaka
-- JP: VGAコンポーネントにInerlaceMode信号を伝えるようにした
--
-- 26th,April,2005 modified by Kazuhiro Tsujikawa
-- JP: VRAMとのデータバス(pRamDbi/pRamDbo)を単方向バス化(SDRAM対応)
--
-- 08th,November,2004 modified by Kazuhiro Tsujikawa
-- JP: Vsync/Hsync割り込み修正ミス訂正
--
-- 03rd,November,2004 modified by Kazuhiro Tsujikawa
-- JP: SCREEN6画面周辺色修正→MSX2タイトルロゴ対応
--
-- 19th,September,2004 modified by Kazuhiro Tsujikawa
-- JP: パターンネームテーブルのマスクを実装→ANMAデモ対応
-- JP: MultiColorMode(SCREEN3)実装→マジラビデモ対応
--
-- 12th,September,2004 modified by Kazuhiro Tsujikawa
-- JP: VdpR0DispNum等をライン単位で反映→スペースマンボウでのチラツキ対策
--
-- 11th,September,2004 modified by Kazuhiro Tsujikawa
-- JP: 水平帰線割り込み修正→MGSEL(テンポ早送り)対策
--
-- 22nd,August,2004 modified by Kazuhiro Tsujikawa
-- JP: パレットのRead/Write衝突を修正→ガゼルでのチラツキ対策
--
-- 21st,August,2004 modified by Kazuhiro Tsujikawa
-- JP: R1/IE0(垂直帰線割り込み許可)の動作を修正→GALAGA対策
--
-- 02nd,August,2004 modified by Kazuhiro Tsujikawa
-- JP: Screen7/8でのスプライト読み込みアドレスを修正→Snatcher対策
--
-- 31st,July,2004 modified by Kazuhiro Tsujikawa
-- JP: Screen7/8でのVRAM読み込みアドレスを修正→Snatcher対策
--
-- 24th,July,2004 modified by Kazuhiro Tsujikawa
-- JP: スプライト32枚同時表示時の乱れを修正(248=256-8->preDotCounter_x_end)
--
-- 18th,July,2004 modified by Kazuhiro Tsujikawa
-- JP: Screen6のレンダリング部を作成
--
-- 17th,July,2004 modified by Kazuhiro Tsujikawa
-- JP: Screen7のレンダリング部を作成
--
-- 29th,June,2004 modified by Kazuhiro Tsujikawa
-- JP: Screen8のレンダリング部を修正
--
-- 26th,June,2004 modified by Kazuhiro Tsujikawa
-- JP: WebPackでコンパイルするとHMMC/LMMC/LMCMが動作しない不具合を修正
-- JP: onehot sequencer(VdpCmdState) must be initialized by asyncronus reset
--
-- 22nd,June,2004 modified by Kazuhiro Tsujikawa
-- JP: R1/IE0(垂直帰線割り込み許可)の動作を修正
-- JP: Ys2でバノアの家に入れる様になった
--
-- 13th,June,2004 modified by Kazuhiro Tsujikawa
-- JP: 拡大スプライトが右に1ドットずれる不具合を修正
-- JP: SCREEN5でスプライト右端32ドットが表示されない不具合を修正
-- JP: SCREEN5で211ライン(最下)のスプライトが表示されない不具合を修正
-- JP: 画面消去フラグ(VdpR1DispOn)を1ライン単位で反映する様に修正
--
-- 21st,March,2004 modified by Alex Wulms
-- Several enhancements to command engine:
--   Add PSET,LINE,SRCH,POINT
--   Add screen 6,7,8 support
--   Improve existing commands
--
-- 15th,January,2004 modified by Kunihiko Ohnaka
-- JP: VDPコマンドの実装を開始
-- JP: HMMC,HMMM,YMMM,HMMV,LMMC,LMMM,LMMVを実装.まだ不具合あり.
--
-- 12th,January,2004 modified by Kunihiko Ohnaka
-- JP: コメントの修正
--
-- 30th,December,2003 modified by Kazuhiro Tsujikawa
-- JP: 起動時の画面モードをNTSCと VGAのどちらにするかを，外部入力で切替
-- JP: DHClk/DLClkを一時的に復活させた
--
-- 16th,December,2003 modified by Kunihiko Ohnaka
-- JP: 起動時の画面モードをNTSCと VGAのどちらにするかを，vdp_package.vhd
-- JP: 内で定義された定数で切替えるようにした．
--
-- 10th,December,2003 modified by Kunihiko Ohnaka
-- JP: TEXT MODE 2 (SCREEN0 WIDTH80)をサポート．
-- JP: 初の横方向倍解像度モードである．一応将来対応できるように作って
-- JP: きたつもりだったが，少し収まりが悪い部分があり，あまりきれいな
-- JP: 対応になっていない部分もあります．
--
-- 13th,October,2003 modified by Kunihiko Ohnaka
-- JP: ESE-MSX基板では 2S300Eを複数用いる事ができるようにり，VDP単体で
-- JP: 2S300Eや SRAMを占有する事が可能となった．
-- JP: これに伴い以下のような変更を行う．
-- JP: ・VGA出力対応(アップスキャンコンバート)
-- JP: ・SCREEN7,8のタイミングを実機と同じに
--
-- 15th,June,2003 modified by Kunihiko Ohnaka
-- JP:水平帰線期間割り込みを実装してスペースマンボウを遊べるようにした．
-- JP:GraphicMode3(Screen4)でYライン数が 212ラインにならなかったのを
-- JP:修正したりした．
-- JP:ただし，スペースマンボウで set adjust機能が動いていないような
-- JP:感じで，表示がガクガクしてしまう．横方向の同時表示スプライト数も
-- JP:足りていないように見える．原因不明．
--
-- 15th,June,2003 modified by Kunihiko Ohnaka
-- JP:長いブランクが空いてしまったが，Spartan-II E + IO基板でスプライトが
-- JP:表示されるようになった．原因はおそらくコンパイラのバグで，ISE 5.2に
-- JP:バージョンアップしたら表示されるようになった．
-- JP:ついでに，スプライトモード2で横 8枚並ぶようにした(つもり)．
-- JP:その他細かな修正が入っています．
--
-- 15th,July,2002 modified by Kazuhiro Tsujikawa
-- no comment;
--
-------------------------------------------------------------------------------
-- Document
--
-- JP: ESE-VDPのトップエンティティです。CPUとのインターフェース、
-- JP: 画面描画タイミングの生成、VDPレジスタの実装などが含まれて
-- JP: います。
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.vdp_package.all;

entity vdp is
  port(
    -- VDP clock ... 21.477MHz
    clk21m  : in std_logic;
    reset   : in std_logic;
    req     : in std_logic;
    ack     : out std_logic;
    wrt     : in std_logic;
    adr     : in std_logic_vector(15 downto 0);
    dbi     : out std_logic_vector(7 downto 0);
    dbo     : in std_logic_vector(7 downto 0);

    int_n   : out std_logic;

    pRamOe_n: out std_logic;
    pRamWe_n: out std_logic;
    pRamAdr : out std_logic_vector(16 downto 0);
    pRamDbi : in  std_logic_vector(15 downto 0);
    pRamDbo : out std_logic_vector(7 downto 0);

    -- Video Output
    pVideoR : out std_logic_vector( 5 downto 0);
    pVideoG : out std_logic_vector( 5 downto 0);
    pVideoB : out std_logic_vector( 5 downto 0);

    pVideoHS_n : out std_logic;
    pVideoVS_n : out std_logic;
    pVideoCS_n : out std_logic;

    pVideoDHClk : out std_logic;
    pVideoDLClk : out std_logic;

    -- CXA1645(RGB->NTSC encoder) signals
    pVideoSC : out std_logic;
    pVideoSYNC : out std_logic;

    -- Display resolution (0=15kHz, 1=31kHz)
    DispReso : in std_logic;
    ntsc_pal_type : in std_logic;
    forced_v_mode : in std_logic;
    legacy_vga : in std_logic   -- behaves like vAllow_n

    -- Debug window signals
--    debugWindowToggle : in std_logic;
--    osdLocateX    : in std_logic_vector( 5 downto 0);
--    osdLocateY    : in std_logic_vector( 4 downto 0);
--    osdCharCodeIn : in std_logic_vector( 7 downto 0);
--    osdCharWrReq  : in std_logic;
--    osdCharWrAck  : out std_logic

    );
end vdp;

architecture rtl of vdp is
  -- H counter
  signal h_counter  : std_logic_vector(10 downto 0);
  -- V counter (This counter will return to zero every two fields)
  signal v_counter  : std_logic_vector(10 downto 0);
  -- This is a field local counter
  signal v_counter2 : std_logic_vector(10 downto 0);

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
  constant OFFSET_X : std_logic_vector( 6 downto 0) := "0110001";

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
  constant OFFSET_Y : std_logic_vector( 6 downto 0) := "0010011";       -- = 3+3+13=19

  -- display positions, adapted for adjust(x,y)
  signal adjust_x : std_logic_vector( 6 downto 0);

  -- dot state register
  signal dotState : std_logic_vector( 1 downto 0);
  signal eightDotState : std_logic_vector( 2 downto 0);

  -- display field signal
  signal field  : std_logic;

  -- for vsync interrupt
  signal vsyncInt_n : std_logic;
  signal vsyncIntReq : std_logic;
  signal vsyncIntAck : std_logic;
  signal vsWindow_y : std_logic;
  signal dVsWindow_y : std_logic;

  -- for hsync interrupt
  signal hsyncInt_n : std_logic;
  signal hsyncIntReq : std_logic;
  signal hsyncIntAck : std_logic;
  signal dVideoHS_n : std_logic;
  signal enaHsync : std_logic;

  -- display area flags
  signal window_x :std_logic;
  signal window :std_logic;
  signal preWindow_x :std_logic;
  signal preWindow_y :std_logic;
  signal preWindow_y_sp :std_logic;
  signal preWindow :std_logic;
  signal preWindow_sp :std_logic;
  -- for frame zone
  signal bwindow_x :std_logic;
  signal bwindow_y :std_logic;
  signal bwindow :std_logic;

-- dot counter
  signal dotCounter_x : std_logic_vector( 8 downto 0);

  -- dot counter - 8 ( reading addr )
  signal preDotCounter_x : std_logic_vector( 8 downto 0);
  signal preDotCounter_y : std_logic_vector( 8 downto 0);
  -- Y counters independent of virtical scroll register
  signal preDotCounter_yp : std_logic_vector( 8 downto 0);

  -- 3.58MHz generator
  signal cpuClockCounter :std_logic_vector( 2 downto 0);

  -- VDP register access
  signal registerRamAddr     : std_logic_vector( 7 downto 0);
  signal registerRamAddr_in  : std_logic_vector( 7 downto 0);
  signal registerRamAddr_out : std_logic_vector( 7 downto 0);
  signal registerRamWe       : std_logic;
  signal registerRamWeD      : std_logic;
  signal registerRamReadData : std_logic_vector( 7 downto 0);
  signal registerRamData_out : std_logic_vector( 7 downto 0);
  signal registerRamData_in  : std_logic_vector( 7 downto 0);

  signal VdpP1Is1stByte : std_logic;
  signal VdpP2Is1stByte : std_logic;
  signal VdpP0Data : std_logic_vector( 7 downto 0);
  signal VdpP1Data : std_logic_vector( 7 downto 0);
  signal VdpRegPtr : std_logic_vector( 5 downto 0);
  signal VdpRegWrPulse : std_logic;
  signal VdpVramAccessAddr : std_logic_vector( 16 downto 0);
  signal VdpVramAccessData : std_logic_vector( 7 downto 0);
  signal VdpVramAccessAddrTmp : std_logic_vector( 16 downto 0);
  signal VdpVramAddrSetReq : std_logic;
  signal VdpVramAddrSetAck : std_logic;
  signal VdpVramAccessRw : std_logic;
  signal VdpVramWrReq : std_logic;
  signal VdpVramWrAck : std_logic;
  signal VdpVramReadingR : std_logic;
  signal VdpVramReadingA : std_logic;
  signal VdpVramRdData : std_logic_vector(7 downto 0);
  signal VdpVramRdReq : std_logic;
  signal VdpVramRdAck : std_logic;
  signal dispModeVGA : std_logic;
  signal VdpR0DispNum : std_logic_vector(3 downto 1);
  signal VdpR0DispNumX : std_logic_vector(3 downto 1);
  signal VdpR0HSyncIntEn : std_logic;
  signal VdpR1DispMode : std_logic_vector(1 downto 0);
  signal VdpR1DispModeX : std_logic_vector(1 downto 0);
  signal VdpR1SpSize : std_logic;
  signal VdpR1SpZoom : std_logic;
  signal VdpR1VSyncIntEn : std_logic;
  signal VdpR1DispOn : std_logic;
  signal VdpR1DispOnX : std_logic;
  signal VdpR2PtnNameTblBaseAddr : std_logic_vector( 6 downto 0);
  signal VdpR2PtnNameTblBaseAddrX : std_logic_vector( 6 downto 0);
  signal VdpR4PtnGeneTblBaseAddr : std_logic_vector( 5 downto 0);
  signal VdpR10R3ColorTblBaseAddr : std_logic_vector( 10 downto 0);
  signal VdpR11R5SpAttrTblBaseAddr : std_logic_vector( 9 downto 0);
  signal VdpR6SpPtnGeneTblBaseAddr : std_logic_vector( 5 downto 0);
  signal VdpR7FrameColor : std_logic_vector( 7 downto 0);
  signal VdpR8SpOff : std_logic;
  signal VdpR8Color0On : std_logic;
  signal VdpR9PALMode : std_logic;
  signal VdpR9PALModeX : std_logic;
  signal VdpR9InterlaceMode : std_logic;
  signal VdpR9TwoPageMode : std_logic;
  signal VdpR9YDots : std_logic;
  signal VdpR12BlinkColor : std_logic_vector(7 downto 0);
  signal VdpR13BlinkPeriod : std_logic_vector(7 downto 0);
  signal VdpR15StatusRegNum : std_logic_vector( 3 downto 0);
  signal VdpR16PalNum : std_logic_vector( 3 downto 0);
  signal VdpR17RegNum : std_logic_vector( 5 downto 0);
  signal VdpR17IncRegNum : std_logic;
  signal VdpR18Adjust : std_logic_vector( 7 downto 0);
  signal VdpR19HSyncIntLine : std_logic_vector( 7 downto 0);
  signal VdpR23VStartLine : std_logic_vector( 7 downto 0);

  constant VdpCmdHMMC  : std_logic_vector( 3 downto 0) := "1111";
  constant VdpCmdYMMM  : std_logic_vector( 3 downto 0) := "1110";
  constant VdpCmdHMMM  : std_logic_vector( 3 downto 0) := "1101";
  constant VdpCmdHMMV  : std_logic_vector( 3 downto 0) := "1100";
  constant VdpCmdLMMC  : std_logic_vector( 3 downto 0) := "1011";
  constant VdpCmdLMCM  : std_logic_vector( 3 downto 0) := "1010";
  constant VdpCmdLMMM  : std_logic_vector( 3 downto 0) := "1001";
  constant VdpCmdLMMV  : std_logic_vector( 3 downto 0) := "1000";
  constant VdpCmdLINE  : std_logic_vector( 3 downto 0) := "0111";
  constant VdpCmdSRCH  : std_logic_vector( 3 downto 0) := "0110";
  constant VdpCmdPSET  : std_logic_vector( 3 downto 0) := "0101";
  constant VdpCmdPOINT : std_logic_vector( 3 downto 0) := "0100";
  constant VdpCmdSTOP  : std_logic_vector( 3 downto 0) := "0000";

  constant VdpCmdIMPb210 : std_logic_vector( 2 downto 0) := "000";
  constant VdpCmdANDb210 : std_logic_vector( 2 downto 0) := "001";
  constant VdpCmdORb210  : std_logic_vector( 2 downto 0) := "010";
  constant VdpCmdEORb210 : std_logic_vector( 2 downto 0) := "011";
  constant VdpCmdNOTb210 : std_logic_vector( 2 downto 0) := "100";

  signal VdpModeText1 : std_logic;      -- text mode 1    (SCREEN0 width 40)
  signal VdpModeText2 : std_logic;      -- text mode 2    (SCREEN0 width 80)
  signal VdpModeMulti : std_logic;      -- multicolor mode(SCREEN3)
  signal VdpModeGraphic1 : std_logic;   -- graphic mode 1 (SCREEN1)
  signal VdpModeGraphic2 : std_logic;   -- graphic mode 2 (SCREEN2)
  signal VdpModeGraphic3 : std_logic;   -- graphic mode 2 (SCREEN4)
  signal VdpModeGraphic4 : std_logic;   -- graphic mode 4 (SCREEN5)
  signal VdpModeGraphic5 : std_logic;   -- graphic mode 5 (SCREEN6)
  signal VdpModeGraphic6 : std_logic;   -- graphic mode 6 (SCREEN7)
  signal VdpModeGraphic7 : std_logic;   -- graphic mode 7 (SCREEN8)
  signal VdpModeIsHighRes : std_logic;  -- true when mode GRAPHIC5, 6
  signal vdpModeIsVramInterleave : std_logic; -- true when mode GRAPHIC6, 7

  -- for text 1 and 2
  signal pRamAdrT12 : std_logic_vector(16 downto 0);
  signal colorCodeT12 : std_logic_vector( 3 downto 0);
  signal txVramReadEn : std_logic;

  -- for graphic 1,2,3 and multi color
  signal pRamAdrG123M : std_logic_vector(16 downto 0);
  signal colorCodeG123M : std_logic_vector( 3 downto 0);

  -- for graphic 4,5,6,7
  signal pRamAdrG4567 : std_logic_vector(16 downto 0);
  signal colorCodeG4567 : std_logic_vector( 7 downto 0);

  -- sprite
  signal spMode2 : std_logic;
  signal spVramAccessing : std_logic;
  signal pRamAdrSprite : std_logic_vector(16 downto 0);
  signal spriteColorOut : std_logic;
  signal colorCodeSprite : std_logic_vector( 3 downto 0);
  signal vdpS0SpCollisionIncidence : std_logic;
  signal vdpS0SpOverMapped         : std_logic;
  signal vdpS0SpOverMappedNum      : std_logic_vector(4 downto 0);
  signal vdpS3S4SpCollisionX       : std_logic_vector(8 downto 0);
  signal vdpS5S6SpCollisionY       : std_logic_vector(8 downto 0);
  signal spVdpS0ResetReq           : std_logic;
  signal spVdpS0ResetAck           : std_logic;
  signal spVdpS5ResetReq           : std_logic;
  signal spVdpS5ResetAck           : std_logic;

  -- palette registers
  signal paletteAddr : std_logic_vector( 7 downto 0);
  signal paletteAddr_out : std_logic_vector( 3 downto 0);
  signal paletteWeRB : std_logic;
  signal paletteWeG : std_logic;
  signal paletteIn : std_logic;
  signal paletteDataRB_out : std_logic_vector( 7 downto 0);
  signal paletteDataG_out : std_logic_vector( 7 downto 0);
  signal paletteDataRB_in : std_logic_vector(7 downto 0);
  signal paletteDataG_in : std_logic_vector(7 downto 0);
  signal paletteWrNum : std_logic_vector( 3 downto 0);
  signal paletteWrReq : std_logic;
  signal paletteWrAck : std_logic;

  signal colorCodeG7 : std_logic_vector(7 downto 0);

  -- VDP Command Signals - Can be set by CPU
  signal VdpCmdSX : std_logic_vector( 8 downto 0);  -- R33,32
  signal VdpCmdSY : std_logic_vector( 9 downto 0);  -- R35,34
  signal VdpCmdDX : std_logic_vector( 8 downto 0);  -- R37,36
  signal VdpCmdDY : std_logic_vector( 9 downto 0);  -- R39,38
  signal VdpCmdNX : std_logic_vector( 9 downto 0);  -- R41,40
  signal VdpCmdNY : std_logic_vector( 9 downto 0);  -- R43,42
  signal VdpCmdMM  : std_logic;                      -- R45 bit 0
  signal VdpCmdEQ  : std_logic;                      -- R45 bit 1
  signal VdpCmdDIX : std_logic;                      -- R45 bit 2
  signal VdpCmdDIY : std_logic;                      -- R45 bit 3
  signal VdpCmdMXS : std_logic;                      -- R45 bit 4
  signal VdpCmdMXD : std_logic;                      -- R45 bit 5
  signal VdpCmdCMR : std_logic_vector( 7 downto 0);  -- R46

  -- VDP Command signals - Can be read & set by CPU
  signal VdpCmdCLR : std_logic_vector( 7 downto 0);  -- R44, S#7

  -- VDP Command Signals - Can be read by CPU
  signal VdpCmdCE : std_logic;  -- S#2 (bit 0)
  signal VdpCmdBD : std_logic;  -- S#2 (bit 4)
  signal VdpCmdTR : std_logic;  -- S#2 (bit 7)
  signal VdpCmdSXTmp : std_logic_vector( 10 downto 0); -- S#8,S#9

  -- VDP Command Signals - internal registers
  alias  VdpCmdSXTHigh : std_logic_vector(1 downto 0) is VdpCmdSXTmp(9 downto 8);
  signal VdpCmdDXTmp : std_logic_vector( 9 downto 0);
  alias  VdpCmdDXTHigh : std_logic_vector(1 downto 0) is VdpCmdDXTmp(9 downto 8);
  signal VdpCmdNXTmp : std_logic_vector( 9 downto 0);
  signal VdpCmdRegNum : std_logic_vector(3 downto 0);
  signal VdpCmdRegData : std_logic_vector(7 downto 0);
  signal VdpCmdRegWrReq : std_logic;
  signal VdpCmdRegWrAck : std_logic;
  signal VdpCmdTRClrReq : std_logic;
  signal VdpCmdTRClrAck : std_logic;
  signal VdpCmdCMRWr : std_logic;

  -- VDP Command signals - Communication between command processor
  --  and memory interface (which is in the color generator)
  signal VdpCmdVramWrAck : std_logic;
  signal VdpCmdVramWrReq : std_logic;
  signal VdpCmdVramRdAck : std_logic;
  signal VdpCmdVramRdReq : std_logic;
  signal VdpCmdVramAccessAddr : std_logic_vector( 16 downto 0);
  signal VdpCmdVramReadingR : std_logic;
  signal VdpCmdVramReadingA : std_logic;
  signal VdpCmdVramRdData : std_logic_vector(7 downto 0);
  signal VdpCmdVramWrData : std_logic_vector(7 downto 0);

  -- VDP Command state register
  type typVdpCmdState is (stVdpCmdIdle, stVdpCmdChkLoop,
                          stVdpCmdRdCPU, stVdpCmdWaitCPU,
                          stVdpCmdRdVram, stVdpCmdWaitRdVram,
                          stVdpCmdPointWaitRdVram,
                          stVdpCmdSrchWaitRdVram,
                          stVdpCmdPreRdVram, stVdpCmdWaitPreRdVram,
                          stVdpCmdWrVram, stVdpCmdWaitWrVram,
                          stVdpCmdLineNewPos, stVdpCmdLineChkLoop,
                          stVdpCmdSrchChkLoop,
                          stVdpCmdExecEnd );
  signal VdpCmdState : typVdpCmdState;

  -- Video Output signals
  signal iVideoR : std_logic_vector( 5 downto 0);
  signal iVideoG : std_logic_vector( 5 downto 0);
  signal iVideoB : std_logic_vector( 5 downto 0);

  signal iVideoR_vdp : std_logic_vector( 5 downto 0);
  signal iVideoG_vdp : std_logic_vector( 5 downto 0);
  signal iVideoB_vdp : std_logic_vector( 5 downto 0);
  signal iVideoHS_n : std_logic;
  signal iVideoVS_n : std_logic;

  signal iVideoR_ntsc : std_logic_vector( 5 downto 0);
  signal iVideoG_ntsc : std_logic_vector( 5 downto 0);
  signal iVideoB_ntsc : std_logic_vector( 5 downto 0);
  signal iVideoHS_n_ntsc : std_logic;
  signal iVideoVS_n_ntsc : std_logic;

  signal iVideoR_pal : std_logic_vector( 5 downto 0);
  signal iVideoG_pal : std_logic_vector( 5 downto 0);
  signal iVideoB_pal : std_logic_vector( 5 downto 0);
  signal iVideoHS_n_pal : std_logic;
  signal iVideoVS_n_pal : std_logic;

  signal iVideoR_vga : std_logic_vector( 5 downto 0);
  signal iVideoG_vga : std_logic_vector( 5 downto 0);
  signal iVideoB_vga : std_logic_vector( 5 downto 0);
  signal iVideoHS_n_vga : std_logic;
  signal iVideoVS_n_vga : std_logic;

  signal iRamAdr : std_logic_vector(16 downto 0);
  signal pRamDat : std_logic_vector( 7 downto 0);
  signal xRamSel : std_logic;
  signal pRamDatPair : std_logic_vector( 7 downto 0);

  signal debugRegNumSel : std_logic_vector( 7 downto 0);
  signal debugRegData   : std_logic_vector( 7 downto 0);

  -- for debug window
--  signal debugWindowMode : std_logic_vector(2 downto 0);
--  signal debWindow : std_logic;
--  signal iVideoR_debwin : std_logic_vector( 1 downto 0);
--  signal iVideoG_debwin : std_logic_vector( 1 downto 0);
--  signal iVideoB_debwin : std_logic_vector( 1 downto 0);
--  signal dDebugWindowToggle :std_logic;
--  signal osdVideoR : std_logic_vector(3 downto 0);
--  signal osdVideoG : std_logic_vector(3 downto 0);
--  signal osdVideoB : std_logic_vector(3 downto 0);
--
--  signal iOsdCharWrAck : std_logic;
--
--  signal osdLocateXMaster : std_logic_vector( 5 downto 0);
--  signal osdLocateYMaster : std_logic_vector( 4 downto 0);
--  signal osdCharCodeInMaster : std_logic_vector( 7 downto 0);
--  signal osdCharMasterWrReq : std_logic;
--  signal osdCharMasterWrAck : std_logic;
--
--  signal osdLocateXLocal : std_logic_vector( 5 downto 0);
--  signal osdLocateYLocal : std_logic_vector( 4 downto 0);
--  signal osdCharCodeInLocal : std_logic_vector( 7 downto 0);
--  signal osdCharLocalWrReq : std_logic;
--  signal osdCharLocalWrAck : std_logic;

begin

  pRamAdr <= iRamAdr;
  xRamSel <= iRamAdr(16);
  pRamDat <= pRamDbi(7 downto 0) when xRamSel = '0' else pRamDbi(15 downto 8);
  pRamDatPair <= pRamDbi(7 downto 0) when xRamSel = '1' else pRamDbi(15 downto 8);

  ----------------------------------------------------------------
  -- Display Components
  ----------------------------------------------------------------
  VdpR9PALMode <= VdpR9PALModeX when( ntsc_pal_type = '1' and legacy_vga = '0' )else
                  forced_v_mode;
--  VdpR9PALMode <= VdpR9PALModeX;

  iVideoR <= (others => '0') when bwindow = '0' else
--             iVideoR_debwin & iVideoR_vdp(5 downto 2) when debWindow = '1' else
             iVideoR_vdp;
  iVideoG <= (others => '0') when bwindow = '0' else
--             iVideoG_debwin & iVideoG_vdp(5 downto 2) when debWindow = '1' else
             iVideoG_vdp;
  iVideoB <= (others => '0') when bwindow = '0' else
--             iVideoB_debwin & iVideoB_vdp(5 downto 2) when debWindow = '1' else
             iVideoB_vdp;

  ntsc1 : ntsc port map( clk21m,
                         reset,
                         iVideoR,
                         iVideoG,
                         iVideoB,
                         iVideoHS_n,
                         iVideoVS_n,
                         h_counter,
                         v_counter,
                         VdpR9InterlaceMode,
                         iVideoR_ntsc,
                         iVideoG_ntsc,
                         iVideoB_ntsc,
                         iVideoHS_n_ntsc,
                         iVideoVS_n_ntsc);

  pal1 : pal port map( clk21m,
                       reset,
                       iVideoR,
                       iVideoG,
                       iVideoB,
                       iVideoHS_n,
                       iVideoVS_n,
                       h_counter,
                       v_counter,
                       VdpR9InterlaceMode,
                       iVideoR_pal,
                       iVideoG_pal,
                       iVideoB_pal,
                       iVideoHS_n_pal,
                       iVideoVS_n_pal);

  vga1 : vga port map( clk21m,
                       reset,
                       iVideoR,
                       iVideoG,
                       iVideoB,
                       iVideoHS_n,
                       iVideoVS_n,
                       h_counter,
                       v_counter,
                       VdpR9InterlaceMode,
                       iVideoR_vga,
                       iVideoG_vga,
                       iVideoB_vga,
                       iVideoHS_n_vga,
                       iVideoVS_n_vga);

  -- Change display mode by external input port.
  pVideoR <= iVideoR_ntsc when dispModeVGA = '0' and VdpR9PALMode = '0' else
             iVideoR_pal  when dispModeVGA = '0' and VdpR9PALMode = '1' else
             iVideoR_vga;
  pVideoG <= iVideoG_ntsc when dispModeVGA = '0' and VdpR9PALMode = '0' else
             iVideoG_pal  when dispModeVGA = '0' and VdpR9PALMode = '1' else
             iVideoG_vga;
  pVideoB <= iVideoB_ntsc when dispModeVGA = '0' and VdpR9PALMode = '0' else
             iVideoB_pal  when dispModeVGA = '0' and VdpR9PALMode = '1' else
             iVideoB_vga;

  -- H Sync signal
  pVideoHS_n <= iVideoHS_n_ntsc when dispModeVGA = '0' and VdpR9PALMode = '0' else
                iVideoHS_n_pal  when dispModeVGA = '0' and VdpR9PALMode = '1' else
                iVideoHS_n_vga;
  -- V Sync signal
  pVideoVS_n <= iVideoVS_n_ntsc when dispModeVGA = '0' and VdpR9PALMode = '0' else
                iVideoVS_n_pal  when dispModeVGA = '0' and VdpR9PALMode = '1' else
                iVideoVS_n_vga;


  pVideoSYNC <= not (iVideoHS_n_ntsc xor iVideoVS_n_ntsc) when dispModeVGA = '0' and VdpR9PALMode = '0' else
                not (iVideoHS_n_pal  xor iVideoVS_n_pal ) when dispModeVGA = '0' and VdpR9PALMode = '1' else
                not (iVideoHS_n_vga xor iVideoVS_n_vga);

  -- These signals below are output directly regardless of display mode.
  pVideoCS_n <= not (iVideoHS_n_ntsc xor iVideoVS_n_ntsc) when VdpR9PALMode = '0' else
                not (iVideoHS_n_pal  xor iVideoVS_n_pal);
  pVideoSC <= cpuClockCounter(2);


  ----------------------------------------------------------------
  -- Palette Register control R and B
  ----------------------------------------------------------------
  paletteAddr <= ( "0000" & paletteWrNum ) when (paletteIn = '1') else
                 ( "0000" & paletteAddr_out );
  paletteWeRB  <= '1' when paletteIn = '1' else '0';
  paletteWeG   <= '1' when paletteIn = '1' else '0';

  paletteMemRB : ram port map(paletteAddr, clk21m, paletteWeRB, paletteDataRB_in, paletteDataRB_out);
  paletteMemG  : ram port map(paletteAddr, clk21m, paletteWeG,  paletteDataG_in, paletteDataG_out);

  -----------------------------------------------------------------------------
  -- Interrupt
  -----------------------------------------------------------------------------
  -- VSYNC Interrupt
  vsyncInt_n <= '1' when VdpR1VSyncIntEn = '0' else
                '0' when vsyncIntReq /= vsyncIntAck else
                '1';
  -- HSYNC Interrupt
  hsyncInt_n <= '1' when (VdpR0HSyncIntEn = '0') or (enaHsync = '0') else
                '0' when (hsyncIntReq /= hsyncIntAck)
                else '1';

  int_n <= '0' when (vsyncInt_n = '0') or (hsyncInt_n = '0')
           else 'Z';

  -----------------------------------------------------------------------------
  -- VDP Mode Decoder
  -----------------------------------------------------------------------------
  -- VDP Mode
  VdpModeText1    <= '1' when (VdpR0DispNum = "000" and VdpR1DispMode = "10") else '0';
  VdpModeText2    <= '1' when (VdpR0DispNum = "010" and VdpR1DispMode = "10") else '0';
  VdpModeMulti    <= '1' when (VdpR0DispNum = "000" and VdpR1DispMode = "01") else '0';
  VdpModeGraphic1 <= '1' when (VdpR0DispNum = "000" and VdpR1DispMode = "00") else '0';
  VdpModeGraphic2 <= '1' when (VdpR0DispNum = "001" and VdpR1DispMode = "00") else '0';
  VdpModeGraphic3 <= '1' when (VdpR0DispNum = "010" and VdpR1DispMode = "00") else '0';
  VdpModeGraphic4 <= '1' when (VdpR0DispNum = "011" and VdpR1DispMode = "00") else '0';
  VdpModeGraphic5 <= '1' when (VdpR0DispNum = "100" and VdpR1DispMode = "00") else '0';
  VdpModeGraphic6 <= '1' when (VdpR0DispNum = "101" and VdpR1DispMode = "00") else '0';
  VdpModeGraphic7 <= '1' when (VdpR0DispNum = "111" and VdpR1DispMode = "00") else '0';

  VdpModeIsHighRes <= '1' when (VdpR0DispNum(3 downto 2) = "10" and VdpR1DispMode = "00") else '0';
  spMode2 <= '1' when (VdpModeGraphic3 = '1' or
                       VdpModeGraphic4 = '1' or
                       VdpModeGraphic5 = '1' or
                       VdpModeGraphic6 = '1' or
                       VdpModeGraphic7 = '1' ) else '0';

  -----------------------------------------------------------------------------
  -- Timing Generation
  -----------------------------------------------------------------------------
  process( clk21m, reset )
    variable vsyncIntStartLine : std_logic_vector(10 downto 0);
  begin
    if (reset = '1') then
      ack <= '0';
      h_counter  <= (others => '0');
      v_counter  <= (others => '0');
      v_counter2 <= (others => '0');
      iVideoHS_n <= '1';
      iVideoVS_n <= '1';
      cpuClockCounter <= (others => '0');
      field <= '0';
      vsyncIntReq <= '0';
      hsyncIntReq <= '0';
      vsyncIntStartLine := (others => '0');
    elsif (clk21m'event and clk21m = '1') then
      ack <= req;
      -- 3.58MHz generator
      case cpuClockCounter is
        when "000" => cpuClockCounter <= "001";
        when "001" => cpuClockCounter <= "011";
        when "011" => cpuClockCounter <= "111";
        when "111" => cpuClockCounter <= "110";
        when "110" => cpuClockCounter <= "100";
        when "100" => cpuClockCounter <= "000";
        when others => cpuClockCounter <= "000";
      end case;

      if( h_counter = CLOCKS_PER_LINE-1 ) then
        h_counter <= (others => '0' );
      else
        h_counter <= h_counter + 1;
      end if;

      if( ((VdpModeGraphic4 = '1') or (VdpModeGraphic5 = '1') or
           (VdpModeGraphic6 = '1') or (VdpModeGraphic7 = '1')) and
          VdpR9TwoPageMode = '1' ) then
        VdpR2PtnNameTblBaseAddr <= (VdpR2PtnNameTblBaseAddrX and "1011111") or
                                   ("0" & field & "00000");
      else
        VdpR2PtnNameTblBaseAddr <= VdpR2PtnNameTblBaseAddrX;
      end if;


      -- calculate adjust_x
--      adjust_x <= OFFSET_X - ( VdpR18Adjust(3) & VdpR18Adjust(3) & VdpR18Adjust(3) & VdpR18Adjust(3 downto 0) );


      -- v_counter generation
      if( (h_counter = (CLOCKS_PER_LINE/2) -1) or (h_counter = CLOCKS_PER_LINE-1) ) then
        if( (v_counter = 523 and VdpR9InterlaceMode = '0' and VdpR9PALMode = '0') or
            (v_counter = 524 and VdpR9InterlaceMode = '1' and VdpR9PALMode = '0') or
            (v_counter = 625 and VdpR9InterlaceMode = '0' and VdpR9PALMode = '1') or
            (v_counter = 624 and VdpR9InterlaceMode = '1' and VdpR9PALMode = '1') ) then
          v_counter  <= v_counter +1;
          v_counter2 <= (others => '0');
        elsif( (v_counter = 1047 and VdpR9InterlaceMode = '0' and VdpR9PALMode = '0') or
               (v_counter = 1049 and VdpR9InterlaceMode = '1' and VdpR9PALMode = '0') or
               (v_counter = 1251 and VdpR9InterlaceMode = '0' and VdpR9PALMode = '1') or
               (v_counter = 1249 and VdpR9InterlaceMode = '1' and VdpR9PALMode = '1') )then
          if( h_counter = CLOCKS_PER_LINE-1 ) then
            -- 524 lines * 2 = 1048 (NTSC non-interlace)
            -- 525 lines * 2 = 1050 (NTSC interlace)
            -- 626 lines * 2 = 1252 (PAL  non-interace)
            -- 625 lines * 2 = 1250 (PAL  interlace)
            v_counter  <= (others => '0');
            v_counter2 <= (others => '0');
          end if;
        else
          v_counter  <= v_counter + 1;
          v_counter2 <= v_counter2 + 1;
        end if;
      end if;

      -- generate field signal
      if( (v_counter = 524 and VdpR9InterlaceMode = '0' and VdpR9PALMode = '0') or
          (v_counter = 525 and VdpR9InterlaceMode = '1' and VdpR9PALMode = '0') or
          (v_counter = 626 and VdpR9InterlaceMode = '0' and VdpR9PALMode = '1') or
          (v_counter = 625 and VdpR9InterlaceMode = '1' and VdpR9PALMode = '1') ) then
        field <= '1';
      elsif( v_counter = 0 ) then
        field <= '0';
      end if;

      -- generate H-sync pulse
      -- This H-sync pulse is not a NTSC sync signal.
      -- This signal is simply generated one time per line.
      -- The NTSC sync signal is generated in ntsc.vhd.
      if( h_counter = 1 ) then
        iVideoHS_n <= '0';             -- pulse on
      elsif( h_counter = 101 ) then
        iVideoHS_n <= '1';             -- pulse off
      end if;

      -- generate V-sync pulse
      if( v_counter2 = 6 ) then
        -- sstate = sstate_B
        iVideoVS_n <= '0';
      elsif( v_counter2 = 12 ) then
        -- sstate = sstate_A
        iVideoVS_n <= '1';
      end if;


      -- V Sync Interrupt Request
      if( VdpR9YDots = '0' ) then
        -- JP: 238は適当
        -- JP: 238だとスペースマンボウのデモが戻ってこない
--        vsyncIntStartLine := conv_std_logic_vector(238, vsyncIntStartLine'length);
        vsyncIntStartLine := conv_std_logic_vector(240, vsyncIntStartLine'length);
      else
        -- JP: 248はたぶん実測値
        vsyncIntStartLine := conv_std_logic_vector(248, vsyncIntStartLine'length);
      end if;
      if( VdpR9PALMode = '1' ) then
        -- JP: +25は適当
        vsyncIntStartLine := vsyncIntStartLine + 25;
      end if;
      -- v_counter is count up twice per line.
      vsyncIntStartLine := vsyncIntStartLine + vsyncIntStartLine;

      if( h_counter = 150 ) then
        if( (v_counter = ("000" & OFFSET_Y & '0')) or
            ((v_counter = ("000" & OFFSET_Y & '0')+524)   and VdpR9InterlaceMode='0' and VdpR9PALMode='0') or
            ((v_counter = ("000" & OFFSET_Y & '0')+525+1) and VdpR9InterlaceMode='1' and VdpR9PALMode='0') or
            ((v_counter = ("000" & OFFSET_Y & '0')+626)   and VdpR9InterlaceMode='0' and VdpR9PALMode='1') or
            ((v_counter = ("000" & OFFSET_Y & '0')+625+1) and VdpR9InterlaceMode='1' and VdpR9PALMode='1') ) then
          vsWindow_y <= '0';
        elsif( (v_counter = vsyncIntStartLine) or
               ((v_counter = vsyncIntStartLine+524)   and VdpR9InterlaceMode='0' and VdpR9PALMode = '0') or
               ((v_counter = vsyncIntStartLine+525+1) and VdpR9InterlaceMode='1' and VdpR9PALMode = '0') or
               ((v_counter = vsyncIntStartLine+626)   and VdpR9InterlaceMode='0' and VdpR9PALMode = '1') or
               ((v_counter = vsyncIntStartLine+625+1) and VdpR9InterlaceMode='1' and VdpR9PALMode = '1') ) then
          vsWindow_y <= '1';
        end if;
      end if;

      dVsWindow_y <= vsWindow_y;

      if( dVsWindow_y = '0' and vsWindow_y = '1') then
        -- rising edge
          vsyncIntReq <= not vsyncIntAck;
      end if;


      -- H Sync Interrupt Request
      -- JP: R19で指定している"ライン番号"は，垂直スクロールレジスタの
      -- JP: 影響を受ける、つまり画面上の物理的な位置ではなく、表示している
      -- JP: 論理的なライン番号
      if (preDotCounter_yp = "000000000") then
        -- JP: 開始は0でよさそう。-1にすると、MSXの起動ロゴがうまく表示できなくなる。
        enaHsync <= '1';
      elsif (preWindow_y = '0' ) then
        enaHsync <= '0';
      end if;

      if( dVsWindow_y= '0' and vsWindow_y = '1') then
        hsyncIntReq <= hsyncIntAck;
      elsif( (preDotCounter_x = 255) and
--      elsif( (preDotCounter_x = 250) and
      -- JP:実測だとHSYNCの立ち下がりから57μsくらいという結果もあるので、250くらいなのかも？
      -- ((57000/46.5) - 100 - 102 - 56 + 4*8)/4 = 249.95
      -- しかし、250だとURのHorizontal Spritで問題があるので、やはり255くらいが良い。
             (preDotCounter_y(7 downto 0)  = VdpR19HSyncIntLine) ) then
        -- Jp: 割り込みがイネーブルでなくても、S#1の水平割り込みフラグを見て動作する
        -- JP: プログラムがあるので、水平同期割り込みイネーブルフラグは見ない。
        hsyncIntReq <= not hsyncIntAck;
      end if;
    end if;
  end process;

  -- generate preWindow, window
  window    <= (   window_x and preWindow_y);
  preWindow <= (preWindow_x and preWindow_y);

  process( clk21m, reset )
    variable preDotCounter_yp_v : std_logic_vector(preDotCounter_yp'length -1 downto 0);
    variable preDotcounterYpStart : std_logic_vector(8 downto 0);
  begin
    if (reset = '1') then
      dotCounter_x <= (others =>'0');
      preDotCounter_x <= (others =>'0');
      preDotCounter_y <= (others =>'0');
      preDotCounter_yp <= (others =>'0');
      window_x <= '0';
      preWindow_x <= '0';
      preWindow_y <= '0';
      bwindow <= '0';
      bwindow_x <= '0';
      bwindow_y <= '0';
      VdpR1DispOn <= '0';
    elsif (clk21m'event and clk21m = '1') then
      -- main window
      if( (h_counter( 1 downto 0) = "01") and ( dotCounter_x = 0 ) ) then
        -- when dotCounter_x = 0
        window_x <= '1';
      elsif( (h_counter( 1 downto 0) = "01") and ( dotCounter_x ="100000000" ) ) then
        -- when dotCounter_x = 256
        window_x <= '0';
      end if;

      -- JP: preDotCounterは描画タイミングではなく、描画の為のデータを読み出す為に使用するカウンタ
      -- JP: 「今表示している座標」ではなく「今読みだしている座標」という事

      if( h_counter = ("00" & OFFSET_X & "10" ) ) then
        -- JP: adjustをうまく処理するため、負の領域からカウントアップを開始する。
        -- JP: adjustが+7の時に -1になるようになっている。
        preDotCounter_x <= "111111000" +  -- -8
                           (VdpR18Adjust(3) & VdpR18Adjust(3) & VdpR18Adjust(3) &
                            VdpR18Adjust(3) & VdpR18Adjust(3) & VdpR18Adjust(3 downto 0));
      elsif( h_counter(1 downto 0) = "10") then
        preDotCounter_x <= preDotCounter_x + 1;
        if( preDotCounter_x = "111111111" ) then
          -- JP: preDotCounter_x が -1から0にカウントアップする時にwindowを1にする
          preWindow_x <= '1';
        elsif( preDotCounter_x = "011111111" ) then
          preWindow_x <= '0';
        end if;

        if( preDotCounter_x = "111111111" ) then
          -- JP: preDotCounter_x が -1から0にカウントアップする時にdotCounter_xを-8にする
          dotCounter_x <= "111111000";      -- -8
        else
          dotCounter_x <= dotCounter_x + 1;
        end if;
      end if;

      if( h_counter(1 downto 0) = "11") then
        if( preDotCounter_x = 0 ) then
          eightDotState <= (others => '0');
        else
          eightDotState <= eightDotState + 1;
        end if;
      end if;


      if( (h_counter( 1 downto 0) = "10") and
          (preDotCounter_x = "111111111") ) then
        -- JP: preWindow_xが 1になるタイミングと同じタイミングでY座標の計算
        VdpR1DispOn <= VdpR1DispOnX;
        VdpR0DispNum <= VdpR0DispNumX;
        VdpR1DispMode <= VdpR1DispModeX;

        if( (v_counter = ("000" & OFFSET_Y & '0')) or
            ((v_counter = ("000" & OFFSET_Y & '0')+524)   and VdpR9InterlaceMode='0' and VdpR9PALMode='0') or
            ((v_counter = ("000" & OFFSET_Y & '0')+525+1) and VdpR9InterlaceMode='1' and VdpR9PALMode='0') or
            ((v_counter = ("000" & OFFSET_Y & '0')+626)   and VdpR9InterlaceMode='0' and VdpR9PALMode='1') or
            ((v_counter = ("000" & OFFSET_Y & '0')+625+1) and VdpR9InterlaceMode='1' and VdpR9PALMode='1') ) then
          -- JP: preDotCounterは Top Borderを描画するタイミング
          -- JP: （負の領域）からカウントアップを開始する。
          -- (for UNKNOWN REALITY's Over Scan Technich)
          if(    VdpR9YDots = '0' and VdpR9PALMode = '0') then
            preDotcounterYpStart := "111100110";  -- -26 = top border lines
          elsif( VdpR9YDots = '1' and VdpR9PALMode = '0') then
            preDotcounterYpStart := "111110000";  -- -16 = top border lines
          elsif( VdpR9YDots = '0' and VdpR9PALMode = '1') then
            preDotcounterYpStart := "111001011";  -- -53 = top border lines
          elsif( VdpR9YDots = '1' and VdpR9PALMode = '1') then
            preDotcounterYpStart := "111010101";  -- -43 = top border lines
          end if;
          preDotCounter_yp <= preDotcounterYpStart +
                              (VdpR18Adjust(7) & VdpR18Adjust(7) & VdpR18Adjust(7) &
                               VdpR18Adjust(7) & VdpR18Adjust(7) & VdpR18Adjust(7 downto 4));
          preWindow_y_sp <= '1';
        else
          if( preDotCounter_yp = 227) then
            preDotCounter_yp_v := preDotCounter_yp;
          else
            preDotCounter_yp_v := preDotCounter_yp + 1;
          end if;
          if( preDotCounter_yp_v = 0 ) then
            preWindow_y <= '1';
          elsif( ((VdpR9YDots = '0') and (preDotCounter_yp_v = 192)) or
                 ((VdpR9YDots = '1') and (preDotCounter_yp_v = 212)) ) then
            preWindow_y <= '0';
            preWindow_y_sp <= '0';
          end if;
          preDotCounter_yp <= preDotCounter_yp_v;
        end if;
      end if;

      -- JP: R23の変更が即座に反映されるようにした.
      preDotCounter_y <= preDotCounter_yp + ('0' & VdpR23VStartLine);



      -- generate bwindow
      if( h_counter = 200 ) then
        bwindow_x <= '1';
      elsif( h_counter = CLOCKS_PER_LINE-1-1 ) then
        bwindow_x <= '0';
      end if;

      if( VdpR9InterlaceMode='0' ) then
        -- non-interlace
        -- 3+3+16 = 19
        if( (v_counter = 20*2) or
            ((v_counter = 524+20*2) and (VdpR9PALMode = '0')) or
            ((v_counter = 626+20*2) and (VdpR9PALMode = '1')) ) then
          bwindow_y <= '1';
        elsif( ((v_counter = 524) and (VdpR9PALMode = '0')) or
               ((v_counter = 626) and (VdpR9PALMode = '1')) or
               (v_counter = 0) ) then
          bwindow_y <= '0';
        end if;
      else
        -- interlace
        if( (v_counter = 20*2) or
            -- +1 should be needed.
            -- Because odd field's start is delayed half line.
            -- So the start position of display time should be
            -- delayed more half line.
            ((v_counter = 525+20*2 + 1) and (VdpR9PALMode = '0')) or
            ((v_counter = 625+20*2 + 1) and (VdpR9PALMode = '1')) ) then
          bwindow_y <= '1';
        elsif( ((v_counter = 525) and (VdpR9PALMode = '0')) or
               ((v_counter = 625) and (VdpR9PALMode = '1')) or
               (v_counter = 0) ) then
          bwindow_y <= '0';
        end if;
      end if;

      if( (bwindow_x = '1') and (bwindow_y = '1') )then
        bwindow <= '1';
      else
        bwindow <= '0';
      end if;

    end if;
  end process;

  ------------------------------------------------------------------------------
  -- main process
  ------------------------------------------------------------------------------
  process( clk21m, reset )
    variable tRamAdr : std_logic_vector(16 downto 0);
    variable vdpVramAccessAddrV : std_logic_vector( 16 downto 0);
    variable vramAccessSwitch : integer range 0 to 6;

    constant VRAM_ACCESS_DRAW : integer := 1;
    constant VRAM_ACCESS_CPUW : integer := 2;
    constant VRAM_ACCESS_CPUR : integer := 3;
    constant VRAM_ACCESS_SPRT : integer := 4;
    constant VRAM_ACCESS_VDPW : integer := 5;
    constant VRAM_ACCESS_VDPR : integer := 6;
  begin
    if (reset = '1') then
      dotState <= (others => '0' );
      pVideoDHClk <= '0';
      pVideoDLClk <= '0';

      iRamAdr <= (others => '1');
      pRamDbo <= (others => 'Z');
      pRamOe_n <= '1';
      pRamWe_n <= '1';

      VdpVramReadingR <= '0';
      VdpVramReadingA <= '0';

      VdpVramRdAck <= '0';
      VdpVramWrAck <= '0';
      VdpVramRdData <= (others => '0');
      VdpVramAddrSetAck <= '0';
      VdpVramAccessAddr <= (others => '0');

      VdpCmdVramWrAck <= '0';
      VdpCmdVramRdAck <= '0';
      VdpCmdVramReadingR <= '0';
      VdpCmdVramReadingA <= '0';
      VdpCmdVramRdData <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then
      if( h_counter = CLOCKS_PER_LINE-1) then
        dotState <= "00";
        pVideoDHClk <= '1';
        pVideoDLClk <= '1';
      else
        case dotState is
          when "00" =>
            dotState <= "01";
            pVideoDHClk <= '0';
            pVideoDLClk <= '1';
          when "01" =>
            dotState <= "11";
            pVideoDHClk <= '1';
            pVideoDLClk <= '0';
          when "11" =>
            dotState <= "10";
            pVideoDHClk <= '0';
            pVideoDLClk <= '0';
          when "10" =>
            dotState <= "00";
            pVideoDHClk <= '1';
            pVideoDLClk <= '1';
          when others => null;
        end case;
      end if;

      ------------------------------------------
      -- main state
      ------------------------------------------
      case dotState is
        when "01" =>
          if( VdpVramReadingR /= VdpVramReadingA ) then
            VdpVramRdData <= pRamDat;
            VdpVramReadingA <= not VdpVramReadingA;
          end if;
          if( VdpCmdVramReadingR /= VdpCmdVramReadingA ) then
            VdpCmdVramRdData <= pRamDat;
            VdpCmdVramRdAck <= not VdpCmdVramRdAck;
            VdpCmdVramReadingA <= not VdpCmdVramReadingA;
          end if;
        when "11" =>
        when others => null;
      end case;


      --
      -- VRAM access arbiter.
      --
      if( dotState = "10" ) then
        if( (preWindow = '1') and (VdpR1DispOn = '1') and
          ((eightDotState="000") or (eightDotState="001") or (eightDotState="010") or
           (eightDotState="011") or (eightDotState="100")) ) then
          vramAccessSwitch := VRAM_ACCESS_DRAW;
        elsif( (preWindow = '1') and (VdpR1DispOn = '1') and
               (txVramReadEn = '1')) then
          vramAccessSwitch := VRAM_ACCESS_DRAW;
        elsif( (preWindow_x = '1') and (preWindow_y_sp = '1') and (spVramAccessing = '1') and
               (eightDotState="101") and (VdpModeText1 = '0') and (VdpModeText2 = '0') ) then
          -- for sprite Y-testing
          vramAccessSwitch := VRAM_ACCESS_SPRT;
        elsif( (preWindow_x = '0') and (preWindow_y_sp = '1') and (spVramAccessing = '1') and
               (VdpModeText1 = '0') and (VdpModeText2 = '0') and
               ((eightDotState="000") or (eightDotState="001") or (eightDotState="010") or
                (eightDotState="011") or (eightDotState="100") or (eightDotState="101")) ) then
          -- for sprite prepareing
          vramAccessSwitch := VRAM_ACCESS_SPRT;
        elsif( VdpVramWrReq /= VdpVramWrAck ) then
          vramAccessSwitch := VRAM_ACCESS_CPUW;
        elsif( VdpVramRdReq /= VdpVramRdAck ) then
          vramAccessSwitch := VRAM_ACCESS_CPUR;
--        elsif( (eightDotState="101") or (eightDotState="111") ) then
        elsif( (eightDotState="111") ) then
          if (VdpCmdVramWrReq /= VdpCmdVramWrAck) then
            vramAccessSwitch := VRAM_ACCESS_VDPW;
          elsif( VdpCmdVramRdReq /= VdpCmdVramRdAck) then
            vramAccessSwitch := VRAM_ACCESS_VDPR;
          else
            vramAccessSwitch := 0;
          end if;
        else
            vramAccessSwitch := 0;
        end if;
      else
        vramAccessSwitch := VRAM_ACCESS_DRAW;
      end if;

      --
      -- VRAM access address switch
      --
      if( vramAccessSwitch = VRAM_ACCESS_CPUW ) then
        -- VRAM write by CPU
        -- JP: GRAPHIC6,7ではVRAM上のアドレスと RAM上のアドレスの関係が
        -- JP: 他の画面モードと異るので注意
        if( (VdpModeGraphic6 = '1') or (VdpModeGraphic7 = '1') ) then
          iRamAdr <= VdpVramAccessAddr(0) &
                     VdpVramAccessAddr(16 downto 1);
        else
          iRamAdr <= VdpVramAccessAddr;
        end if;
        if( (VdpModeText1 = '1') or (VdpModeMulti = '1') or
            (VdpModeGraphic1 = '1') or (VdpModeGraphic2 = '1') ) then
          VdpVramAccessAddr(13 downto 0) <= vdpVramAccessAddr(13 downto 0) + 1;
        else
          VdpVramAccessAddr <= vdpVramAccessAddr + 1;
        end if;
        pRamDbo <= VdpVramAccessData;
        pRamOe_n <= '1';
        pRamWe_n <= '0';
        VdpVramWrAck <= not VdpVramWrAck;
      elsif( vramAccessSwitch = VRAM_ACCESS_CPUR ) then
        -- VRAM read by CPU
        if( VdpVramAddrSetReq /= VdpVramAddrSetAck ) then
          vdpVramAccessAddrV := VdpVramAccessAddrTmp;
          -- clear vram address set request signal
          VdpVramAddrSetAck <= not VdpVramAddrSetAck;
        else
          vdpVramAccessAddrV := VdpVramAccessAddr;
        end if;

      -- JP: GRAPHIC6,7ではVRAM上のアドレスと RAM上のアドレスの関係が
        -- JP: 他の画面モードと異るので注意
        if( (VdpModeGraphic6 = '1') or (VdpModeGraphic7 = '1') ) then
          iRamAdr <= VdpVramAccessAddrV(0) &
                     VdpVramAccessAddrV(16 downto 1);
        else
          iRamAdr <= VdpVramAccessAddrV;
        end if;
        if( (VdpModeText1 = '1') or (VdpModeMulti = '1') or
            (VdpModeGraphic1 = '1') or (VdpModeGraphic2 = '1') ) then
          VdpVramAccessAddr(13 downto 0) <= vdpVramAccessAddrV(13 downto 0) + 1;
        else
          VdpVramAccessAddr <= vdpVramAccessAddrV + 1;
        end if;
        pRamDbo <= (others => 'Z');
        pRamOe_n <= '0';
        pRamWe_n <= '1';
        VdpVramRdAck <= not VdpVramRdAck;
        VdpVramReadingR <= not VdpVramReadingA;
      elsif( vramAccessSwitch = VRAM_ACCESS_VDPW) then
        -- VRAM write by VDP command
        -- VDP command write VRAM.
        -- JP: GRAPHIC6,7ではアドレスと RAM上の位置が他の画面モードと
        -- JP: 異るので注意
        if( (VdpModeGraphic6 = '1') or (VdpModeGraphic7 = '1') ) then
          iRamAdr <= VdpCmdVramAccessAddr(0) &
                     VdpCmdVramAccessAddr(16 downto 1);
        else
          iRamAdr <= VdpCmdVramAccessAddr;
        end if;
        pRamDbo <= VdpCmdVramWrData;
        pRamOe_n <= '1';
        pRamWe_n <= '0';
        VdpCmdVramWrAck <= not VdpCmdVramWrAck;
      elsif( vramAccessSwitch = VRAM_ACCESS_VDPR ) then
        -- VRAM read by VDP command
        -- JP: GRAPHIC6,7ではアドレスと RAM上の位置が他の画面モードと
        -- JP: 異るので注意
        if( (VdpModeGraphic6 = '1') or (VdpModeGraphic7 = '1') ) then
          iRamAdr <= VdpCmdVramAccessAddr(0) &
                     VdpCmdVramAccessAddr(16 downto 1);
        else
          iRamAdr <= VdpCmdVramAccessAddr;
        end if;
        pRamDbo <= (others => 'Z');
        pRamOe_n <= '0';
        pRamWe_n <= '1';
        VdpCmdVramReadingR <= not VdpCmdVramReadingA;
      elsif( vramAccessSwitch = VRAM_ACCESS_SPRT ) then
        -- VRAM read by sprite module
        iRamAdr <= pRamAdrSprite;
        pRamOe_n <= '0';
        pRamWe_n <= '1';
        pRamDbo <= (others => 'Z');
      else
        -- VRAM_ACCESS_DRAW
        -- VRAM read for screen image building
        case dotState is
          when "10" =>
            pRamDbo <= (others => 'Z' );
            pRamOe_n <= '0';
            pRamWe_n <= '1';
            if( (VdpModeText1 = '1') or (VdpModeText2 = '1') ) then
              iRamAdr <= pRamAdrT12;
            elsif( (VdpModeGraphic1='1') or (VdpModeGraphic2='1') or
                   (VdpModeGraphic3='1') or (VdpModeMulti='1')  ) then
              iRamAdr <= pRamAdrG123M;
            elsif( (VdpModeGraphic4='1') or (VdpModeGraphic5='1') or
                   (VdpModeGraphic6='1') or (VdpModeGraphic7='1') ) then
              iRamAdr <= pRamAdrG4567;
            end if;
          when "01" =>
            pRamDbo <= (others => 'Z' );
            pRamOe_n <= '0';
            pRamWe_n <= '1';
            if( (VdpModeGraphic6='1') or (VdpModeGraphic7='1') ) then
              iRamAdr <= pRamAdrG4567;
            end if;
          when others =>
            null;
        end case;

        if( (dotState = "11") and
            (VdpVramAddrSetReq /= VdpVramAddrSetAck) ) then
          VdpVramAccessAddr <= VdpVramAccessAddrTmp;
          VdpVramAddrSetAck <= not VdpVramAddrSetAck;
        end if;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------
  -- color decoding
  -------------------------------------------------------------------------
  process( clk21m, reset )
    variable colorCode : std_logic_vector( 7 downto 0);
  begin
    if (reset = '1') then
      iVideoR_vdp <= "000000";
      iVideoG_vdp <= "000000";
      iVideoB_vdp <= "000000";

      paletteWrAck <= '0';
      paletteAddr_out <= (others => '0');
      paletteIn <= '0';
      colorCodeG7 <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then

      -- [Drawing Timing (only 4dot)]
      --                     |-----------|-----------|-----------|-----------|
      -- eightDotState    7=><====0=====><====1=====><====2=====><====3=====>
      -- dotState         "10"00"01"11"10"00"01"11"10"00"01"11"10"00"01"11"10"
      -- window_x         ======0=><1====
      -- (GRAPHIC4)
      -- Color Code                <D0>        <D0>        <D1>        <D1>
      -- Palette Data                    <D0>        <D0>        <D1>        <D1>
      -- Display Output                     <D0========><D0========><D1=========><D1==
      -- (GRAPHIC5)
      -- Color Code                <D0>  <D0>  <D0>  <D0>  <D1>  <D1>  <D1>  <D1>
      -- Palette Data                    <D0>  <D0>  <D0>  <D0>  <D1>  <D1>  <D1>  <D1>
      -- Display Output                     <D0==><D0==><D0==><D0==><D1==><D1==><D1==><D1==>
      -- (GRAPHIC6)
      -- Color Code                <D0>  <D0>  <P0>  <P0>  <D1>  <D1>  <P1>  <P1>
      -- Palette Data                    <D0>  <D0>  <P0>  <P0>  <D1>  <D1>  <P1>  <P1>
      -- Display Output                     <D0==><D0==><P0==><P0==><D1==><D1==><P1==><P1==>
      -- (GRAPHIC7)
      -- Direct Color              <D0===>     <P0===>     <D1===>     <P1===>
      -- Display Output                     <D0========><P0========><D1=========><P1==
      case dotState is
        when "11" | "00" =>
          if( (window = '1') and (VdpR1DispOn = '1')) then
--            if( spriteColorOut = '1' and VdpR8SpOff = '0' and
            if( spriteColorOut = '1' and
                VdpModeText1 = '0' and VdpModeText2 = '0' ) then
              -- Sprite has highest priority.
              colorCode := "0000" & colorCodeSprite;
              -- Special operation for Graphic7
              if( VdpModeGraphic7 = '1' ) then
                case colorCode(3 downto 0) is
                  when X"0" => colorCode := "000" & "000" & "00";
                  when X"1" => colorCode := "000" & "000" & "01";
                  when X"2" => colorCode := "000" & "011" & "00";
                  when X"3" => colorCode := "000" & "011" & "01";
                  when X"4" => colorCode := "011" & "000" & "00";
                  when X"5" => colorCode := "011" & "000" & "01";
                  when X"6" => colorCode := "011" & "011" & "00";
                  when X"7" => colorCode := "011" & "011" & "01";
                  when X"8" => colorCode := "100" & "111" & "01";
                  when X"9" => colorCode := "000" & "000" & "11";
                  when X"A" => colorCode := "000" & "111" & "00";
                  when X"B" => colorCode := "000" & "111" & "11";
                  when X"C" => colorCode := "111" & "000" & "00";
                  when X"D" => colorCode := "111" & "000" & "11";
                  when X"E" => colorCode := "111" & "111" & "00";
                  when X"F" => colorCode := "111" & "111" & "11";
                  when others => null;
                end case;
              end if;
            else
              -- Display output
              if( VdpModeGraphic1 = '1' or VdpModeGraphic2 = '1' or
                  VdpModeGraphic3 = '1' or VdpModeMulti = '1' ) then
                colorCode := "0000" & colorCodeG123M;
              elsif( (VdpModeText1 = '1') or (VdpModeText2 = '1') ) then
                colorCode := "0000" & colorCodeT12;
              else
                colorCode := colorCodeG4567;
              end if;
            end if;
          else
            -- Border area
            colorCode := VdpR7FrameColor(7 downto 0);
          end if;

          if( VdpModeGraphic5 = '1' ) then
            -- GRAPHIC5 Tiling
            if( dotState = "11" ) then
              colorCode := "000000" & colorCode(3 downto 2);
              if( colorCode = 0 and VdpR8Color0On = '0' ) then
                colorCode := "000000" & VdpR7FrameColor(3 downto 2);
              end if;
            else
              colorCode := "000000" & colorCode(1 downto 0);
              if( colorCode = 0 and VdpR8Color0On = '0' ) then
                colorCode := "000000" & VdpR7FrameColor(1 downto 0);
              end if;
            end if;
          else
            if( colorCode = 0 and VdpR8Color0On = '0' ) then
              colorCode := VdpR7FrameColor;
            end if;
          end if;


          -- save original color code.
          colorCodeG7 <= colorCode;

          -- set palette address
          paletteAddr_out <= colorCode( 3 downto 0);
          paletteIn <= '0';

          -- output decoded color
          if( VdpModeGraphic7 = '1' ) then
            iVideoR_vdp <= colorCodeG7(4 downto 2) & "000";
            iVideoG_vdp <= colorCodeG7(7 downto 5) & "000";
            iVideoB_vdp <= colorCodeG7(1 downto 0) & colorCodeG7(1) & "000";
          else
            iVideoR_vdp <= paletteDataRB_out(6 downto 4) & "000";
            iVideoB_vdp <= paletteDataRB_out(2 downto 0) & "000";
            iVideoG_vdp <= paletteDataG_out(2 downto 0) & "000";
          end if;

        when "10" | "01" =>
          -- Update palette table.
          if( paletteWrReq /= paletteWrAck ) then
            paletteIn <= '1';
            paletteWrAck <= not paletteWrAck;
          end if;

        when others =>
          null;
      end case;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Screen Mode Modules
  -----------------------------------------------------------------------------
  iText12 : text12 port map(clk21m, reset, dotState, preDotCounter_x, preDotCounter_yp,
                            VdpModeText1, VdpModeText2,
                            VdpR7FrameColor,
                            VdpR12BlinkColor,
                            VdpR13BlinkPeriod,
                            VdpR2PtnNameTblBaseAddr,
                            VdpR4PtnGeneTblBaseAddr,
                            VdpR10R3ColorTblBaseAddr,
                            pRamDat, pRamAdrT12, txVramReadEn, colorCodeT12);

  iGraphic123M : graphic123M port map(clk21m, reset, dotState, eightDotState, preDotCounter_x, preDotCounter_y,
                                      VdpModeMulti, VdpModeGraphic1, VdpModeGraphic2, VdpModeGraphic3,
                                      VdpR2PtnNameTblBaseAddr,
                                      VdpR4PtnGeneTblBaseAddr,
                                      VdpR10R3ColorTblBaseAddr,
                                      pRamDat, pRamAdrG123M, colorCodeG123M);

  iGraphic4567 : graphic4567 port map(clk21m, reset, dotState, eightDotState, preDotCounter_x, preDotCounter_y,
                                      VdpModeGraphic4, VdpModeGraphic5, VdpModeGraphic6, VdpModeGraphic7,
                                      VdpR2PtnNameTblBaseAddr,
                                      pRamDat, pRamDatPair, pRamAdrG4567, colorCodeG4567);

  -----------------------------------------------------------------------------
  -- SPRITE Modules
  -----------------------------------------------------------------------------

  vdpModeIsVramInterleave <= '1' when ((VdpModeGraphic6 = '1') or (VdpModeGraphic7 = '1')) else
                             '0';
  iSprite : sprite port map(clk21m, reset, dotState, eightDotState, preDotCounter_x, preDotCounter_yp,
                            vdpS0SpCollisionIncidence,
                            vdpS0SpOverMapped,
                            vdpS0SpOverMappedNum,
                            vdpS3S4SpCollisionX,
                            vdpS5S6SpCollisionY,
                            spVdpS0ResetReq,
                            spVdpS0ResetAck,
                            spVdpS5ResetReq,
                            spVdpS5ResetAck,
                            VdpR1SpSize, VdpR1SpZoom,
                            VdpR11R5SpAttrTblBaseAddr,
                            VdpR6SpPtnGeneTblBaseAddr,
                            VdpR8Color0On,
                            VdpR8SpOff,
                            VdpR23VStartLine,
                            spMode2,
                            vdpModeIsVramInterleave,
                            spVramAccessing,
                            pRamDat, pRamAdrSprite,
                            spriteColorOut,
                            colorCodeSprite);

  -----------------------------------------------------------------------------
  --
  -- VDP register access
  --
  -----------------------------------------------------------------------------
  registerRam : ram port map(registerRamAddr, clk21m, registerRamWe, registerRamData_in, registerRamData_out);
  registerRamAddr <= registerRamAddr_in when (registerRamWe = '1') else
                     registerRamAddr_out;


  process( clk21m, reset )
  begin
    if (reset = '1') then
      registerRamAddr_in  <= (others => '0');
      registerRamWe <= '0';
      registerRamReadData <= (others => '0');
      dbi <= (others => '0');
      vsyncIntAck <= '0';
--            dVsyncIntReq <= '0';
      VdpP1Data <= (others => '0');
      VdpP1Is1stByte <= '1';
      VdpP2Is1stByte <= '1';
      VdpRegWrPulse <= '0';
      VdpRegPtr <= (others => '0');
      VdpVramWrReq <= '0';
      VdpVramRdReq <= '0';
      VdpVramAddrSetReq <= '0';
      VdpVramAccessRw <= '0';
      VdpVramAccessAddrTmp <= (others => '0');
      VdpVramAccessData <= (others => '0');
      VdpR0DispNumX <= (others => '0');
      VdpR0HSyncIntEn <= '0';
      VdpR1DispModeX <= (others => '0');
      VdpR1SpSize <= '0';
      VdpR1SpZoom <= '0';
      VdpR1VSyncIntEn <= '0';
      VdpR1DispOnX <= '0';
      VdpR2PtnNameTblBaseAddrX <= (others => '0');
      VdpR12BlinkColor <= (others => '0');
      VdpR13BlinkPeriod <= (others => '0');
      VdpR7FrameColor <= (others => '0');
      VdpR8SpOff <= '1';
      VdpR8Color0On <= '0';
      VdpR9PALModeX <= '0';
      VdpR9TwoPageMode <= '0';
      VdpR9InterlaceMode <= '0';
      VdpR9YDots <= '0';
      VdpR15StatusRegNum <= (others => '0');
      VdpR16PalNum <= (others => '0');
      VdpR17RegNum <= (others => '0');
      VdpR17IncRegNum <= '0';
      VdpR18Adjust <= (others => '0');
      VdpR19HSyncIntLine <= (others => '0');
      VdpR23VStartLine <= (others => '0');

      VdpCmdRegNum <= (others => '0');
      VdpCmdRegData <= (others => '0');
      VdpCmdRegWrReq <= '0';
      VdpCmdTRClrReq <= '0';

      -- palette
      paletteDataRB_in <= (others => '0');
      paletteDataG_in  <= (others => '0');
      paletteWrReq <= '0';
      paletteWrNum <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then

      -- save register value to RAM
      registerRamWeD <= registerRamWe;
      registerRamAddr_in  <= "00" & VdpRegPtr;
      registerRamData_in  <= VdpP1Data;
      if( registerRamWeD = '0' ) then
        registerRamReadData <= registerRamData_out;
      end if;
      registerRamWe <= VdpRegWrPulse;

      --
      if (req = '1' and wrt = '0') then
        -- Read request
        case adr(1 downto 0) is
          when "00"   => -- port#0: read vram
            dbi <= VdpVramRdData;
            VdpVramRdReq <= not VdpVramRdAck;
          when "01"   => -- port#1: read status register
            -- Reset the first byte flag after reading of status register.
            -- I don't know this implementation is same as real VDP.
            -- JP: ステータスレジスタを読む時に 1stバイトフラグをリセットしてみる.
            -- JP: 実機の挙動と合うかどうか不明.
            VdpP1Is1stByte <= '1';
--            VdpP2Is1stByte <= '1';

            case VdpR15StatusRegNum is
              when "0000" => -- Read S#0
                -- TODO: implementation is unfinished
                if( vsyncIntAck /= vsyncIntReq ) then
                  vsyncIntAck <= not vsyncIntAck;
                end if;
--                dbi <= (vsyncIntAck xor vsyncintreq) & vdpS0SpOverMapped & vdpS0SpCollisionIncidence &
--                       vdpS0SpOverMappedNum;
                dbi <= (vsyncIntAck xor vsyncintreq) & '0' & vdpS0SpCollisionIncidence &
                       vdpS0SpOverMappedNum;
                spVdpS0ResetReq <= not spVdpS0ResetAck;
              when "0001" => -- Read S#1
                -- TODO: implementation is unfinished
                if( hsyncIntAck /= hsyncIntReq ) then
                  hsyncIntAck <= not hsyncIntAck;
                  dbi <= "00" & VDP_ID & '1';
                else
                  dbi <= "00" & VDP_ID & '0';
                end if;
              when "0010" => -- Read S#2
--                dbi <= '1' & not iVideoVS_n & not iVideoHS_n & VdpCmdBD & "11" & field & '0';
--                dbi <= '1' & not bwindow_y & not bwindow_x & VdpCmdBD & "11" & field & '0';
--                dbi <= VdpCmdTR & not bwindow_y & not bwindow_x & VdpCmdBD & "11" & field & VdpCmdCE;
--                dbi <= VdpCmdTR & not preWindow_y_sp & not preWindow_x & VdpCmdBD & "11" & field & VdpCmdCE;
--                dbi <= VdpCmdTR & not preWindow_y_sp & not bwindow_x & VdpCmdBD & "11" & field & VdpCmdCE;
--                dbi <= VdpCmdTR & not preWindow_y & not bwindow_x & VdpCmdBD & "11" & field & VdpCmdCE;
                dbi <= VdpCmdTR & vsWindow_y & not bwindow_x & VdpCmdBD & "11" & field & VdpCmdCE;
              when "0011" => -- Read S#3
                dbi <= vdpS3S4SpCollisionX(7 downto 0);
              when "0100" => -- Read S#4
                dbi <= "0000000" & vdpS3S4SpCollisionX(8);
              when "0101" => -- Read S#5
                dbi <= vdpS5S6SpCollisionY(7 downto 0);
                spVdpS5ResetReq <= not spVdpS5ResetAck;
              when "0110" => -- Read S#6
                dbi <= "0000000" & vdpS5S6SpCollisionY(8);
              when "0111" => -- Read S#7: The color register
                dbi <= VdpCmdCLR;
                -- Reset the TR register; color data is now transferred to CPU
                VdpCmdTRClrReq <= not VdpCmdTRClrAck;
              when "1000" => -- Read S#8: SXTmp LSB
                dbi <= VdpCmdSXTmp(7 downto 0);
              when "1001" => -- Read S#9: SXTmp MSB
                dbi <= ( 0 => VdpCmdSXTmp(8), others => '1');
              when others =>
                dbi <= (others => '0');
            end case;
          when "10"   => -- port#2: not supported in read mode
            dbi <= (others => '1');
          when others => -- port#3: not supported in read mode
            dbi <= (others => '1');
        end case;

      elsif (req = '1' and wrt = '1') then
        -- Write request
        case adr(1 downto 0) is
          when "00"   => -- port#0: Write vram
            VdpVramAccessData <= dbo;
            VdpVramWrReq <= not VdpVramWrAck;

          when "01"   => -- port#1: Register write or vram addr setup
            if(VdpP1Is1stByte = '1') then
              -- It is the first byte; buffer it
              VdpP1Is1stByte <= '0';
              VdpP1Data <= dbo;
            else
              -- It is the second byte; process both bytes
              VdpP1Is1stByte <= '1';
              case dbo( 7 downto 6 ) is
                when "01" =>  -- set vram access address(write)
                  VdpVramAccessAddrTmp( 7 downto 0 ) <= VdpP1Data( 7 downto 0);
                  VdpVramAccessAddrTmp(13 downto 8 ) <= dbo( 5 downto 0);
                  VdpVramAddrSetReq <= not VdpVramAddrSetAck;
                  VdpVramAccessRw <= '0';
                when "00" =>  -- set vram access address(read)
                  VdpVramAccessAddrTmp( 7 downto 0 ) <= VdpP1Data( 7 downto 0);
                  VdpVramAccessAddrTmp(13 downto 8 ) <= dbo( 5 downto 0);
                  VdpVramAddrSetReq <= not VdpVramAddrSetAck;
                  VdpVramAccessRw <= '1';
                  VdpVramRdReq <= not VdpVramRdAck;
                when "10" =>  -- direct register selection
                  VdpRegPtr <= dbo( 5 downto 0);
                  VdpRegWrPulse <= '1';
                when "11" =>  -- direct register selection ??
                  VdpRegPtr <= dbo( 5 downto 0);
                  VdpRegWrPulse <= '1';
                when others =>
                  null;
              end case;
            end if;

          when "10"   => -- port#2: Palette write
            if(VdpP2Is1stByte = '1') then
              paletteDataRB_in <= dbo;
              VdpP2Is1stByte <= '0';
            else
              -- パレットはRGBのデータが揃った時に一度に書き換える。
              -- (実機で動作を確認した)
              paletteDataG_in <= dbo;
              paletteWrNum <= VdpR16PalNum;
              paletteWrReq <= not paletteWrAck;
              VdpP2Is1stByte <= '1';
              VdpR16PalNum <= VdpR16PalNum + 1;
            end if;

          when "11" => -- port#3: Indirect register write
            if( VdpR17RegNum /= "010001" ) then
              -- Register 17 can not be modified. All others are OK
              VdpRegWrPulse <= '1';
            end if;
            VdpP1Data <= dbo;
            VdpRegPtr <= VdpR17RegNum;
            if( VdpR17IncRegNum = '1' ) then
              VdpR17RegNum <= VdpR17RegNum + 1;
            end if;

          when others =>
            null;
        end case;

      elsif (VdpRegWrPulse = '1') then
        -- Write to register (if previously requested)
        VdpRegWrPulse <= '0';
        if ( VdpRegPtr(5) = '0') then
          -- It is a not a command engine register:
          case VdpRegPtr(4 downto 0) is
            when "00000" =>   -- #00
              VdpR0DispNumX <= VdpP1Data(3 downto 1);
              VdpR0HSyncIntEn <= VdpP1Data(4);
              -- under testing
              if( VdpP1Data(4) = '1' ) then
                hsyncIntAck <= hsyncIntReq;
              end if;
            when "00001" =>   -- #01
              VdpR1SpZoom <= VdpP1Data(0);
              VdpR1SpSize <= VdpP1Data(1);
              VdpR1DispModeX <= VdpP1Data(4 downto 3);
              VdpR1VSyncIntEn <= VdpP1Data(5);
              VdpR1DispOnX <= VdpP1Data(6);
            when "00010" =>   -- #02
              VdpR2PtnNameTblBaseAddrX <= VdpP1Data( 6 downto 0);
            when "00011" =>   -- #03
              VdpR10R3ColorTblBaseAddr(7 downto 0) <= VdpP1Data( 7 downto 0);
            when "00100" =>   -- #04
              VdpR4PtnGeneTblBaseAddr <= VdpP1Data( 5 downto 0);
            when "00101" =>   -- #05
              VdpR11R5SpAttrTblBaseAddr(7 downto 0) <= VdpP1Data;
            when "00110" =>   -- #06
              VdpR6SpPtnGeneTblBaseAddr <= VdpP1Data( 5 downto 0);
            when "00111" =>   -- #07
              VdpR7FrameColor <= VdpP1Data( 7 downto 0 );
            when "01000" =>   -- #08
              VdpR8SpOff <= VdpP1Data(1);
              VdpR8Color0On <= VdpP1Data(5);
            when "01001" =>   -- #09
              VdpR9PALModeX <= VdpP1Data(1);
              VdpR9TwoPageMode <= VdpP1Data(2);
              VdpR9InterlaceMode <= VdpP1Data(3);
              VdpR9YDots <= VdpP1Data(7);
            when "01010" =>   -- #10
              VdpR10R3ColorTblBaseAddr(10 downto 8) <= VdpP1Data( 2 downto 0);
            when "01011" =>   -- #11
              VdpR11R5SpAttrTblBaseAddr( 9 downto 8) <= VdpP1Data( 1 downto 0);
            when "01100" =>   -- #12
              VdpR12BlinkColor <= VdpP1Data;
            when "01101" =>   -- #13
              VdpR13BlinkPeriod <= VdpP1Data;
            when "01110" =>   -- #14
              VdpVramAccessAddrTmp( 16 downto 14 ) <= VdpP1Data( 2 downto 0);
              VdpVramAddrSetReq <= not VdpVramAddrSetAck;
            when "01111" =>   -- #15
              VdpR15StatusRegNum <= VdpP1Data( 3 downto 0);
            when "10000" =>   -- #16
              VdpR16PalNum <= VdpP1Data( 3 downto 0 );
              VdpP2Is1stByte <= '1';
            when "10001" =>   -- #17
              VdpR17RegNum <= VdpP1Data( 5 downto 0 );
              VdpR17IncRegNum <= not VdpP1Data(7);
            when "10010" =>   -- #18
              VdpR18Adjust <= VdpP1Data;
            when "10011" =>   -- #19
              VdpR19HSyncIntLine <= VdpP1Data;
              hsyncIntAck <= hsyncIntReq;
            when "10111" =>    -- #23
              VdpR23VStartLine <= VdpP1Data;
            when others => null;
          end case;
        else
          -- Registers for VDP Command
          VdpCmdRegNum <= VdpRegPtr(3 downto 0);
          VdpCmdRegData <= VdpP1Data;
          VdpCmdRegWrReq <= not VdpCmdRegWrAck;
        end if;
      end if;

    end if;
  end process;

  -- Display resolution (0=15kHz, 1=31kHz)
  dispModeVGA <= DispReso;

  -----------------------------------------------------------------------------
  --
  -- VDP Command
  --
  -----------------------------------------------------------------------------
  process( clk21m, reset )
    variable initializing: std_logic;
    variable nxCount : std_logic_vector(9 downto 0);
    variable xCountDelta : std_logic_vector(10 downto 0);
    variable yCountDelta : std_logic_vector(9 downto 0);
    variable nxLoopEnd : std_logic;
    variable dyend : std_logic;
    variable syend : std_logic;
    variable nyLoopEnd : std_logic;
    variable nx_minus_one : std_logic_vector(9 downto 0);
    variable rdxlow : std_logic_vector(1 downto 0);
    variable rdpoint : std_logic_vector(7 downto 0);
    variable colmask : std_logic_vector(7 downto 0);
    variable maxXmask : std_logic_vector(1 downto 0);
    variable logOpDestCol : std_logic_vector(7 downto 0);
    variable graphic4_or_6 : std_logic;
    variable srcheqrslt : std_logic;
    variable VdpVramAccessY : std_logic_vector(9 downto 0);
    variable VdpVramAccessX : std_logic_vector(8 downto 0);
  begin
    if (reset = '1') then
      VdpCmdState <= stVdpCmdIdle;  -- very important for Xilinx synthesis tool(XST)
      initializing := '0';
      nxCount := (others => '0');
      nxLoopEnd := '0';
      xCountDelta := (others => '0');
      yCountDelta := (others => '0');
      colmask := (others => '1');
      rdxlow := "00";
      VdpCmdSX <= (others => '0');  -- R32
      VdpCmdSY <= (others => '0');  -- R34
      VdpCmdDX <= (others => '0');  -- R36
      VdpCmdDY <= (others => '0');  -- R38
      VdpCmdNX <= (others => '0');  -- R40
      VdpCmdNY <= (others => '0');  -- R42
      VdpCmdCLR <= (others => '0');  -- R44
      VdpCmdMM  <= '0';  -- R45 bit 0
      VdpCmdEQ  <= '0';  -- R45 bit 1
      VdpCmdDIX <= '0';  -- R45 bit 2
      VdpCmdDIY <= '0';  -- R45 bit 3
      VdpCmdMXS <= '0';  -- R45 bit 4
      VdpCmdMXD <= '0';  -- R45 bit 5
      VdpCmdCMR <= (others => '0');  -- R46
      VdpCmdSXTmp <= (others => '0');
      VdpCmdDXTmp <= (others => '0');
      VdpCmdCMRWr <= '0';
      VdpCmdRegWrAck <= '0';
      VdpCmdVramWrReq <= '0';
      VdpCmdVramRdReq <= '0';
      VdpCmdVramWrData <= (others => '0');

      VdpCmdTR <= '1'; -- Transfer Ready
      VdpCmdCE <= '0'; -- Command Executing
      VdpCmdBD <= '0'; -- Border color found
      VdpCmdTRClrAck <= '0';
      VdpVramAccessY := (others => '0');
      VdpVramAccessX := (others => '0');
      VdpCmdVramAccessAddr <= (others => '0');
    elsif (clk21m'event and clk21m = '1') then
      if( (VdpModeGraphic4 = '1') or (VdpModeGraphic6 = '1') ) then
        graphic4_or_6 := '1';
      else
        graphic4_or_6 := '0';
      end if;


      case VdpCmdCMR(7 downto 6) is
        when "11" =>
          -- Byte command
          if( graphic4_or_6 = '1' ) then
            -- GRAPHIC4,6 (screen 5, 7)
            nxCount := "0" & VdpCmdNX(9 downto 1);
            if (VdpCmdDIX = '0') then
              xCountDelta := "00000000010"; -- +2
            else
              xCountDelta := "11111111110"; -- -2
            end if;
          elsif( VdpModeGraphic5 = '1' ) then
            -- GRAPHIC5 (screen 6)
            nxCount := "00" & VdpCmdNX(9 downto 2);
            if (VdpCmdDIX = '0') then
              xCountDelta := "00000000100"; -- +4
            else
              xCountDelta := "11111111100"; -- -4;
            end if;
          else
            -- GRAPHIC7 (screen 8) and other
            nxCount := VdpCmdNX;
            if (VdpCmdDIX = '0') then
              xCountDelta := "00000000001"; -- +1
            else
              xCountDelta := "11111111111"; -- -1
            end if;
          end if;
          colmask := (others => '1');
        when others =>
          -- Dot command
          nxCount := VdpCmdNX;
          if (VdpCmdDIX = '0') then
            xCountDelta := "00000000001"; -- +1;
          else
            xCountDelta := "11111111111"; -- -1;
          end if;
          if (graphic4_or_6 = '1') then
            colmask := "00001111";
          elsif (VdpModeGraphic5 = '1') then
            colmask := "00000011";
          else
            colmask := (others => '1');
          end if;
      end case;

      if (VdpCmdDIY = '0') then
        yCountDelta := "0000000001";
      else
        yCountDelta := "1111111111";
      end if;


      if (VdpModeIsHighRes = '1') then
        -- GRAPHIC 5,6 (screen 6, 7)
        maxXmask := "10";
      else
        maxXmask := "01";
      end if;

      -- Determine if x-loop is finished
      case VdpCmdCMR(7 downto 4) is
        when VdpCmdHMMV | VdpCmdHMMC | VdpCmdLMMV | VdpCmdLMMC =>
          if ((VdpCmdNXTmp = 0) or
              ((VdpCmdDXTHigh and maxXmask) = maxXmask)) then
            nxLoopEnd := '1';
          else
            nxLoopEnd := '0';
          end if;
        when VdpCmdYMMM =>
          if ((VdpCmdDXTHigh and maxXmask) = maxXmask) then
            nxLoopEnd := '1';
          else
            nxLoopEnd := '0';
          end if;
        when VdpCmdHMMM | VdpCmdLMMM =>
          if ((VdpCmdNXTmp = 0) or
              ((VdpCmdSXTHigh and maxXmask) = maxXmask) or
              ((VdpCmdDXTHigh and maxXmask) = maxXmask)) then
            nxLoopEnd := '1';
          else
            nxLoopEnd := '0';
          end if;
        when VdpCmdLMCM =>
          if ((VdpCmdNXTmp = 0) or
              ((VdpCmdSXTHigh and maxXmask) = maxXmask)) then
            nxLoopEnd := '1';
          else
            nxLoopEnd := '0';
          end if;
        when VdpCmdSRCH =>
          if ((VdpCmdSXTHigh and maxXmask) = maxXmask) then
            nxLoopEnd := '1';
          else
            nxLoopEnd := '0';
          end if;
        when others =>
          nxLoopEnd := '1';
      end case;

      -- Retrieve the 'point' out of the byte that was most recently read
      if (graphic4_or_6 = '1') then
        -- Screen 5, 7
        if( rdxlow(0) = '0' ) then
          rdpoint := "0000" & VdpCmdVramRdData(7 downto 4);
        else
          rdpoint := "0000" & VdpCmdVramRdData(3 downto 0);
        end if;
      elsif (VdpModeGraphic5 = '1') then
        -- Screen 6
        case rdxlow is
          when "00" =>
            rdpoint := "000000" & VdpCmdVramRdData(7 downto 6);
          when "01" =>
            rdpoint := "000000" & VdpCmdVramRdData(5 downto 4);
          when "10" =>
            rdpoint := "000000" & VdpCmdVramRdData(3 downto 2);
          when others =>
--          when "11" =>
            rdpoint := "000000" & VdpCmdVramRdData(1 downto 0);
--          when others =>
--            null; -- Should never occur
        end case;
      else
        -- Screen 8 and other modes
        rdpoint := VdpCmdVramRdData;
      end if;

      -- Perform logical operation on most recently read point and
      -- on the point to be written.
      if ((VdpCmdCMR(3) = '0') or ((VdpCmdVramWrData and colmask) /= "00000000")) then
        case VdpCmdCMR(2 downto 0) is
          when VdpCmdIMPb210 =>
            logOpDestCol := (VdpCmdVramWrData and colmask);
          when VdpCmdANDb210 =>
            logOpDestCol := (VdpCmdVramWrData and colmask) and rdpoint;
          when VdpCmdORb210 =>
            logOpDestCol := (VdpCmdVramWrData and colmask) or rdpoint;
          when VdpCmdEORb210 =>
            logOpDestCol := (VdpCmdVramWrData and colmask) xor rdpoint;
          when VdpCmdNOTb210 =>
            logOpDestCol := not (VdpCmdVramWrData and colmask);
          when others =>
            logOpDestCol := rdpoint;
        end case;
      else
        logOpDestCol := rdpoint;
      end if;

      -- process register update request, clear 'Transfer Ready' request
      -- or process any ongoing command.
      if( VdpCmdRegWrReq /= VdpCmdRegWrAck ) then
        VdpCmdRegWrAck <= not VdpCmdRegWrAck;
        case VdpCmdRegNum is
          when "0000" =>    -- #32
            VdpCmdSX(7 downto 0) <= VdpCmdRegData;
          when "0001" =>    -- #33
            VdpCmdSX(8) <= VdpCmdRegData(0);
          when "0010" =>    -- #34
            VdpCmdSY(7 downto 0) <= VdpCmdRegData;
          when "0011" =>    -- #35
            VdpCmdSY(9 downto 8) <= VdpCmdRegData(1 downto 0);
          when "0100" =>    -- #36
            VdpCmdDX(7 downto 0) <= VdpCmdRegData;
          when "0101" =>    -- #37
            VdpCmdDX(8) <= VdpCmdRegData(0);
          when "0110" =>    -- #38
            VdpCmdDY(7 downto 0) <= VdpCmdRegData;
          when "0111" =>    -- #39
            VdpCmdDY(9 downto 8) <= VdpCmdRegData(1 downto 0);
          when "1000" =>    -- #40
            VdpCmdNX(7 downto 0) <= VdpCmdRegData;
          when "1001" =>    -- #41
            VdpCmdNX(9 downto 8) <= VdpCmdRegData(1 downto 0);
          when "1010" =>    -- #42
            VdpCmdNY(7 downto 0) <= VdpCmdRegData;
          when "1011" =>    -- #43
            VdpCmdNY(9 downto 8) <= VdpCmdRegData(1 downto 0);
          when "1100" =>    -- #44
            if (VdpCmdCE = '1') then
              VdpCmdCLR <= VdpCmdRegData and colmask;
            else
              VdpCmdCLR <= VdpCmdRegData;
            end if;
            VdpCmdTR <= '0'; -- Data is transferred from CPU to VDP color register
          when "1101" =>    -- #45
            VdpCmdMM  <= VdpCmdRegData(0);
            VdpCmdEQ  <= VdpCmdRegData(1);
            VdpCmdDIX <= VdpCmdRegData(2);
            VdpCmdDIY <= VdpCmdRegData(3);
            VdpCmdMXD <= VdpCmdRegData(5);
          when "1110" =>    -- #46
            -- Initialize the new command
            -- Note that this will abort any ongoing command!
            VdpCmdCMR <= VdpCmdRegData;
            VdpCmdCMRWr <= '1';
            VdpCmdState <= stVdpCmdIdle;
          when others =>
            null;
        end case;
      elsif( VdpCmdTRClrReq /= VdpCmdTRClrAck ) then
        -- Reset the data transfer register (CPU has just read the color register)
        VdpCmdTRClrAck <= not VdpCmdTRClrAck;
        VdpCmdTR <= '0';
      else
        -- Process the VDP Command state
        case VdpCmdState is
          when stVdpCmdIdle =>
            if( VdpCmdCMRWr = '0' ) then
              VdpCmdCE <= '0';
              VdpCmdCE <= '0';
            else
              -- exec new VDP Command
              VdpCmdCMRWr <= '0';
              VdpCmdCE <= '1';
              VdpCmdBD <= '0';
              if VdpCmdCMR(7 downto 4) = VdpCmdLINE then
                -- Line command requires special sxTmp and NXTmp set-up
                nx_minus_one := VdpCmdNX - 1;
                VdpCmdSXTmp <= "00" & nx_minus_one(9 downto 1);
                VdpCmdNXTmp <= (others => '0');
              else
                if VdpCmdCMR(7 downto 4) = VdpCmdYMMM then
                  -- For YMMM, SXTmp = DXTmp = DX
                  VdpCmdSXTmp <= "00" & VdpCmdDX;
                else
                  -- For all others, SXTmp is busines as usual
                  VdpCmdSXTmp <= "00" & VdpCmdSX;
                end if;
                -- NXTmp is business as usual for all but the LINE command
                VdpCmdNXTmp <= nxCount;
              end if;
              VdpCmdDXTmp <= '0' & VdpCmdDX;
              initializing := '1';
              VdpCmdState <= stVdpCmdChkLoop;
            end if;

          when stVdpCmdRdCPU =>
            -- Applicable to HMMC, LMMC
            if (VdpCmdTR = '0') then
              -- CPU has transferred data to (or from) the Color register
              VdpCmdTR <= '1';  -- VDP is ready to receive the next transfer.
              VdpCmdVramWrData <= VdpCmdCLR;
              if (VdpCmdCMR(6) = '0') then
                -- It is LMMC
                VdpCmdState <= stVdpCmdPreRdVram;
              else
                -- It is HMMC
                VdpCmdState <= stVdpCmdWrVram;
              end if;
            end if;

          when stVdpCmdWaitCPU =>
            -- Applicable to LMCM
            if( VdpCmdTR  = '0' ) then
              -- CPU has transferred data from (or to) the Color register
              -- VDP may read the next value into the Color register
              VdpCmdState <= stVdpCmdRdVram;
            end if;

          when stVdpCmdRdVram =>
            -- Applicable to YMMM, HMMM, LMCM, LMMM, SRCH, POINT
            VdpVramAccessY := VdpCmdSY;
            VdpVramAccessX := VdpCmdSXTmp(8 downto 0);
            rdxlow := VdpCmdSxTmp(1 downto 0);
            VdpCmdVramRdReq <= not VdpCmdVramRdAck;
            case VdpCmdCMR(7 downto 4) is
              when VdpCmdPOINT =>
                VdpCmdState <= stVdpCmdPointWaitRdVram;
              when VdpCmdSRCH =>
                VdpCmdState <= stVdpCmdSrchWaitRdVram;
              when others =>
                VdpCmdState <= stVdpCmdWaitRdVram;
             end case;

          when stVdpCmdPointWaitRdVram =>
            -- Applicable to POINT
            if ( VdpCmdVramRdReq = VdpCmdVramRdAck ) then
              VdpCmdCLR <= rdpoint;
              VdpCmdState <= stVdpCmdExecEnd;
            end if;

          when stVdpCmdSrchWaitRdVram =>
            -- Applicable to SRCH
            if ( VdpCmdVramRdReq = VdpCmdVramRdAck ) then
              if (rdpoint = VdpCmdCLR) then
                 srcheqrslt := '0';
               else
                 srcheqrslt := '1';
               end if;
               if (VdpCmdEQ = srcheqrslt) then
                 VdpCmdBD <= '1';
                 VdpCmdState <= stVdpCmdExecEnd;
               else
                 VdpCmdSxTmp <= VdpCmdSxTmp + xCountDelta;
                 VdpCmdState <= stVdpCmdSrchChkLoop;
               end if;
             end if;

          when stVdpCmdWaitRdVram =>
            -- Applicable to YMMM, HMMM, LMCM, LMMM
            if ( VdpCmdVramRdReq = VdpCmdVramRdAck ) then
              VdpCmdSxTmp <= VdpCmdSxTmp + xCountDelta;
              case VdpCmdCMR(7 downto 4) is
                when VdpCmdLMMM =>
                  VdpCmdVramWrData <= rdpoint;
                  VdpCmdState <= stVdpCmdPreRdVram;
                when VdpCmdLMCM =>
                  VdpCmdCLR <= rdpoint;
                  VdpCmdTR <= '1';
                  VdpCmdNXTmp <= VdpCmdNXTmp - 1;
                  VdpCmdState <= stVdpCmdChkLoop;
                when others => -- remaining: YMMM, HMMM
                  VdpCmdVramWrData <= VdpCmdVramRdData;
                  VdpCmdState <= stVdpCmdWrVram;
              end case;
            end if;

          when stVdpCmdPreRdVram =>
            -- Applicable to LMMC, LMMM, LMMV, LINE, PSET
            VdpVramAccessY := VdpCmdDY;
            VdpVramAccessX := VdpCmdDXTmp(8 downto 0);
            rdxlow := VdpCmdDxTmp(1 downto 0);
            VdpCmdVramRdReq <= not VdpCmdVramRdAck;
            VdpCmdState <= stVdpCmdWaitPreRdVram;

          when stVdpCmdWaitPreRdVram =>
            -- Applicable to LMMC, LMMM, LMMV, LINE, PSET
            if ( VdpCmdVramRdReq = VdpCmdVramRdAck ) then
              if (graphic4_or_6 = '1') then
                -- Screen 5, 7
                if( rdxlow(0) = '0' ) then
                  VdpCmdVramWrData <= logOpDestCol(3 downto 0) & VdpCmdVramRdData(3 downto 0);
                else
                  VdpCmdVramWrData <= VdpCmdVramRdData(7 downto 4) & logOpDestCol(3 downto 0);
                end if;
              elsif (VdpModeGraphic5 = '1') then
                -- Screen 6
                case rdxlow is
                  when "00" =>
                    VdpCmdVramWrData <= logOpDestCol(1 downto 0) & VdpCmdVramRdData(5 downto 0);
                  when "01" =>
                    VdpCmdVramWrData <= VdpCmdVramRdData(7 downto 6) & logOpDestCol(1 downto 0) & VdpCmdVramRdData(3 downto 0);
                  when "10" =>
                    VdpCmdVramWrData <= VdpCmdVramRdData(7 downto 4) & logOpDestCol(1 downto 0) & VdpCmdVramRdData(1 downto 0);
                  when others =>
--                  when "11" =>
                    VdpCmdVramWrData <= VdpCmdVramRdData(7 downto 2) & logOpDestCol(1 downto 0);
--                  when others =>
--                    null; -- Should never occur
                end case;
              else
                -- Screen 8 and other modes
                VdpCmdVramWrData <= logOpDestCol;
              end if;
              VdpCmdState <= stVdpCmdWrVram;
            end if;

          when stVdpCmdWrVram =>
            -- Applicable to HMMC, YMMM, HMMM, HMMV, LMMC, LMMM, LMMV, LINE, PSET
            VdpVramAccessY := VdpCmdDY;
            VdpVramAccessX := VdpCmdDXTmp(8 downto 0);
            VdpCmdVramWrReq <= not VdpCmdVramWrAck;
            VdpCmdState <= stVdpCmdWaitWrVram;

          when stVdpCmdWaitWrVram =>
            -- Applicable to HMMC, YMMM, HMMM, HMMV, LMMC, LMMM, LMMV, LINE, PSET
            if ( VdpCmdVramWrReq = VdpCmdVramWrAck ) then
              case VdpCmdCMR(7 downto 4) is
                when VdpCmdPSET =>
                  VdpCmdState <= stVdpCmdExecEnd;
                when VdpCmdLINE =>
                  VdpCmdSXTmp <= VdpCmdSXTmp - VdpCmdNY;
                  if VdpCmdMM = '0' then
                    VdpCmdDXTmp <= VdpCmdDXTmp + xCountDelta(9 downto 0);
                  else
                    VdpCmdDY <= VdpCmdDY + yCountDelta;
                  end if;
                  VdpCmdState <= stVdpCmdLineNewPos;
                when others =>
                  VdpCmdDxTmp <= VdpCmdDxTmp + xCountDelta(9 downto 0);
                  VdpCmdNXTmp <= VdpCmdNXTmp - 1;
                  VdpCmdState <= stVdpCmdChkLoop;
              end case;
            end if;

          when stVdpCmdLineNewPos =>
            -- Applicable to LINE
            if (VdpCmdSXTmp(10) = '1') then
              VdpCmdSXTmp <= '0' & (VdpCmdSXTmp(9 downto 0) + VdpCmdNX);
              if (VdpCmdMM = '0') then
                VdpCmdDY <= VdpCmdDy + yCountDelta;
              else
                VdpCmdDXTmp <= VdpCmdDXTmp + xCountDelta(9 downto 0);
              end if;
            end if;
            VdpCmdState <= stVdpCmdLineChkLoop;

          when stVdpCmdLineChkLoop =>
            -- Applicable to LINE
            if ((VdpCmdNXTmp = VdpCmdNX) or
                ((VdpCmdDXTHigh and maxXmask) = maxXmask)) then
              VdpCmdState <= stVdpCmdExecEnd;
            else
              VdpCmdVramWrData <= VdpCmdCLR;
              -- Color must be re-masked, just in case that screenmode was changed
              VdpCmdCLR <= VdpCmdCLR and colmask;
              VdpCmdState <= stVdpCmdPreRdVram;
            end if;
            VdpCmdNXTmp <= VdpCmdNXTmp + 1;

          when stVdpCmdSrchChkLoop =>
            -- Applicable to SRCH
            if (nxLoopEnd = '1') then
              VdpCmdState <= stVdpCmdExecEnd;
            else
              -- Color must be re-masked, just in case that screenmode was changed
              VdpCmdCLR <= VdpCmdCLR and colmask;
              VdpCmdState <= stVdpCmdRdVram;
            end if;

          when stVdpCmdChkLoop =>
            -- When initializing = '1':
            --   Applicable to all commands
            -- When initializing = '0':
            -- Applicable to HMMC, YMMM, HMMM, HMMV, LMMC, LMCM, LMMM, LMMV

            -- Determine nyLoopEnd
            dyend := '0';
            syend := '0';
            if (VdpCmdDIY = '1') then
              if ((VdpCmdDY = 0) and (VdpCmdCMR(7 downto 4) /= VdpCmdLMCM)) then
                dyend := '1';
              end if;
              if ((VdpCmdSY = 0) and (VdpCmdCMR(5) /= VdpCmdCMR(4))) then
                -- bit5 /= bit4 is true for commands YMMM, HMMM, LMCM, LMMM
                syend := '1';
              end if;
            end if;
            if ((VdpCmdNY = 1) or (dyend = '1') or (syend = '1')) then
              nyLoopEnd := '1';
            else
              nyLoopEnd := '0';
            end if;

            if ((initializing = '0') and (nxLoopEnd = '1') and (nyLoopEnd = '1')) then
              VdpCmdState <= stVdpCmdExecEnd;
            else
              -- Command not yet finished or command initializing. Determine next/first step
              -- Color must be (re-)masked, just in case that screenmode was changed
              VdpCmdCLR <= VdpCmdCLR and colmask;
              case VdpCmdCMR(7 downto 4) is
                when VdpCmdHMMC =>
                  VdpCmdState <= stVdpCmdRdCPU;
                when VdpCmdYMMM =>
                  VdpCmdState <= stVdpCmdRdVram;
                when VdpCmdHMMM =>
                  VdpCmdState <= stVdpCmdRdVram;
                when VdpCmdHMMV =>
                  VdpCmdVramWrData <= VdpCmdCLR;
                  VdpCmdState <= stVdpCmdWrVram;
                when VdpCmdLMMC =>
                  VdpCmdState <= stVdpCmdRdCPU;
                when VdpCmdLMCM =>
                  VdpCmdState <= stVdpCmdWaitCPU;
                when VdpCmdLMMM =>
                  VdpCmdState <= stVdpCmdRdVram;
                when VdpCmdLMMV | VdpCmdLINE | VdpCmdPSET =>
                  VdpCmdVramWrData <= VdpCmdCLR;
                  VdpCmdState <= stVdpCmdPreRdVram;
                when VdpCmdSRCH =>
                  VdpCmdState <= stVdpCmdRdVram;
                when VdpCmdPOINT =>
                  VdpCmdState <= stVdpCmdRdVram;
                when others =>
                  VdpCmdState <= stVdpCmdExecEnd;
              end case;
            end if;
            if( (initializing = '0') and (nxLoopEnd = '1') ) then
              VdpCmdNXTmp <= nxCount;
              if VdpCmdCMR(7 downto 4) = VdpCmdYMMM then
                VdpCmdSXTmp <= "00" & VdpCmdDX;
              else
                VdpCmdSXTmp <= "00" & VdpCmdSX;
              end if;
              VdpCmdDXTmp <= '0' & VdpCmdDX;
              VdpCmdNY <= VdpCmdNY - 1;
              if (VdpCmdCMR(5) /= VdpCmdCMR(4)) then
                -- bit5 /= bit4 is true for commands YMMM, HMMM, LMCM, LMMM
                VdpCmdSy <= VdpCmdSy + yCountDelta;
              end if;
              if (VdpCmdCMR(7 downto 4) /= VdpCmdLMCM) then
                VdpCmdDY <= VdpCmdDY + yCountDelta;
              end if;
            else
              VdpCmdSXTmp(10) <= '0';
            end if;
            initializing := '0';
          when others =>
--          when stVdpCmdExecEnd =>
            VdpCmdState <= stVdpCmdIdle;
            VdpCmdCE <= '0';
            VdpCmdCMR <= (others => '0');
--          when others =>
--            VdpCmdState <= stVdpCmdIdle;
        end case;
      end if;

      if (VdpModeGraphic4 = '1') then
        VdpCmdVramAccessAddr <= VdpVramAccessY(9 downto 0) & VdpVramAccessX(7 downto 1);
      elsif (VdpModeGraphic5  = '1') then
        VdpCmdVramAccessAddr <= VdpVramAccessY(9 downto 0) & VdpVramAccessX(8 downto 2);
      elsif (VdpModeGraphic6  = '1') then
        VdpCmdVramAccessAddr <= VdpVramAccessY(8 downto 0) & VdpVramAccessX(8 downto 1);
      else
        VdpCmdVramAccessAddr <= VdpVramAccessY(8 downto 0) & VdpVramAccessX(7 downto 0);
      end if;

    end if;
  end process;

  -----------------------------------------------------------------------------
  --
  -- Debug Window
  --
  -----------------------------------------------------------------------------

--  process( clk21m, reset )
--    variable debWindowV : std_logic;
--    variable tiling : std_logic;
--  begin
--    if (reset = '1') then
--      debugWindowMode <= (others => '0');
--      iVideoR_debwin <= (others => '0');
--      iVideoG_debwin <= (others => '0');
--      iVideoB_debwin <= (others => '0');
--      debWindow <= '0';
--      tiling := '0';
--    elsif (clk21m'event and clk21m = '1') then
--
--      dDebugWindowToggle <= debugWindowToggle;
--      if( debugWindowToggle /= dDebugWindowToggle ) then
--        if( debugWindowMode = "101" ) then
--          debugWindowMode <= (others => '0');
--        else
--          debugWindowMode <= debugWindowMode + 1;
--        end if;
--      end if;
--
--      debWindowV := '0';
--
--      if( (dotState = "00") or (dotState = "01") ) then
--        tiling := preDotCounter_yp(0);
--      else
--        tiling := not preDotCounter_yp(0);
--      end if;
--
--      case debugWindowMode is
--        when "001" =>
--          if( vsyncIntReq /= vsyncIntAck ) then
--            if( (VdpR1VSyncIntEn = '1') or (tiling = '1') ) then
--              iVideoG_debwin <= "10";
--            else
--              iVideoG_debwin <= (others => '0');
--            end if;
--            debWindowV := '1';
--          else
--            iVideoG_debwin <= (others => '0');
--          end if;
--          iVideoR_debwin <= (others => '0');
--          iVideoB_debwin <= (others => '0');
--        when "010" =>
--          if( hsyncIntReq /= hsyncIntAck) then
--            if( (VdpR0HSyncIntEn = '1') or (tiling = '1') ) then
--              iVideoR_debwin <= "10";
--            else
--              iVideoR_debwin <= (others => '0');
--            end if;
--            debWindowV := '1';
--          else
--            iVideoR_debwin <= (others => '0');
--          end if;
--          iVideoG_debwin <= (others => '0');
--          iVideoB_debwin <= (others => '0');
--        when "011" =>
--          -- sprite debugging
--          if( window = '1' and vdpR1DispOn = '1' and spriteColorOut = '1' and
--              VdpModeText1 = '0' and VdpModeText2 = '0') then
--            iVideoB_debwin <= "11";
--          elsif( (VdpR8SpOff = '1') and (tiling = '1') ) then
--            iVideoB_debwin <= "10";
--          else
--            iVideoB_debwin <= (others => '0');
--          end if;
--          iVideoR_debwin <= (others => '0');
--          iVideoG_debwin <= (others => '0');
--        when "100" =>
--          -- palette fixing
--          iVideoR_debwin <= paletteAddr_out(3 downto 2);
--          iVideoG_debwin <= paletteAddr_out(1) & paletteAddr_out(1);
--          iVideoB_debwin <= paletteAddr_out(0) & paletteAddr_out(0);
--        when "101" =>
--          -- On-Screen-Display
--          iVideoR_debwin <= osdVideoR(3 downto 2);
--          iVideoG_debwin <= osdVideoG(3 downto 2);
--          iVideoB_debwin <= osdVideoB(3 downto 2);
--        when others => null;
--      end case;
--
--
--      -- window signal
--      if( debugWindowMode /= 0 ) then
----        debWindow <= debWindowV;
--        debWindow <= '1';
--      else
--        debWindow <= '0';
--      end if;
--    end if;
--  end process;
--
--  osd0: osd port map(clk21m, reset, h_counter, preDotCounter_yp(7 downto 0),
--                     osdLocateXMaster, osdLocateYMaster, osdCharCodeInMaster, osdCharMasterWrReq, osdCharMasterWrAck,
--                     osdVideoR, osdVideoG, osdVideoB);
--
--  --
--  -- osd arbitor
--  --
--  osdCharWrAck <= iOsdCharWrAck;
--
--  process( clk21m, reset )
--    variable state : std_logic_vector(1 downto 0);
--  begin
--    if (reset = '1') then
--      state := "00";
--      iOsdCharWrAck <= '0';
--      osdCharLocalWrAck <= '0';
--      osdCharCodeInMaster <= (others => '0');
--      osdCharMasterWrReq <= '0';
--    elsif (clk21m'event and clk21m = '1') then
--      case state is
--        when "00" =>
--          if( osdCharWrReq /= iOsdCharWrAck ) then
--            osdLocateXMaster <= osdLocateX;
--            osdLocateYMaster <= osdLocateY;
--            osdCharCodeInMaster <= osdCharCodeIn;
--            osdCharMasterWrReq <= not osdCharMasterWrAck;
--            state := "10";
--          elsif( osdCharLocalWrReq /= osdCharLocalWrAck ) then
--            osdLocateXMaster <= osdLocateXLocal;
--            osdLocateYMaster <= osdLocateYLocal;
--            osdCharCodeInMaster <= osdCharCodeInLocal;
--            osdCharMasterWrReq <= not osdCharMasterWrAck;
--            state := "11";
--          end if;
--        when "10" =>
--          if( osdCharMasterWrReq = osdCharMasterWrAck ) then
--            iOsdCharWrAck <= osdCharWrReq;
--            state := "00";
--          end if;
--        when "11" =>
--          if( osdCharMasterWrReq = osdCharMasterWrAck ) then
--            osdCharLocalWrAck <= osdCharLocalWrReq;
--            state := "00";
--          end if;
--        when others => null;
--      end case;
--    end if;
--  end process;
--
--
--  --
--  -- Output VDP information to OSD.
--  --
--  registerRamAddr_out <= debugRegNumSel;
--  debugRegData <= registerRamReadData;
--
--  process( clk21m, reset )
--    constant str : string  := "VDP Registers";
--    constant str2 : string := "   0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F";
--    constant str3 : string := "0:00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00";
--    constant hexchar : string := "0123456789ABCDEF";
--    variable state : std_logic_vector(3 downto 0);
--    variable x  : std_logic_vector(7 downto 0);
--    variable x2 : std_logic_vector(3 downto 0);
--  begin
--    if (reset = '1') then
--      osdLocateXLocal <= (others => '0');
--      osdLocateYLocal <= (others => '0');
--      osdCharCodeInLocal <= (others => '0');
--      osdCharLocalWrReq <= '0';
--      debugRegNumSel <= (others => '0');
--      x := (others => '0');
--      x2 := (others => '0');
--      state := (others => '0');
--    elsif (clk21m'event and clk21m = '1') then
--
--      case state is
--        -- print str
--        when X"0" =>
--          osdLocateXLocal <= (others => '0');
--          osdLocateYLocal <= conv_std_logic_vector(2, osdLocateYLocal'length);
--          x := (others => '0');
--          state := X"1";
--        when X"1" =>
--          osdCharCodeInLocal <= char_to_std_logic_vector(str(conv_integer(x)+1));
--          osdCharLocalWrReq <= not osdCharLocalWrAck;
--          state := X"2";
--        when X"2" =>
--          -- waiting wr ack
--          if( osdCharLocalWrReq = osdCharLocalWrAck ) then
----            if( x = str'length -1) then
--            if( x = 12) then
--              state := X"3";
--            else
--              x := x+1;
--              osdLocateXLocal <= osdLocateXLocal + 1;
--              state := X"1";
--            end if;
--          end if;
--        -- print str2
--        when X"3" =>
--          osdLocateXLocal <= (others => '0');
--          osdLocateYLocal <= conv_std_logic_vector(3, osdLocateYLocal'length);
--          x  := (others => '0');
--          state := X"4";
--        when X"4" =>
--          osdCharCodeInLocal <= char_to_std_logic_vector(str2(conv_integer(x)+1));
--          osdCharLocalWrReq <= not osdCharLocalWrAck;
--          state := X"5";
--        when X"5" =>
--          -- waiting wr ack
--          if( osdCharLocalWrReq = osdCharLocalWrAck ) then
----            if( x = str2'length -1) then
--            if( x = 49) then
--              state := X"8";
--            else
--              x := x+1;
--              osdLocateXLocal <= osdLocateXLocal + 1;
--              state := X"4";
--            end if;
--          end if;
--        -- print str3
--        when X"8" =>
--          osdLocateXLocal <= (others => '0');
--          osdLocateYLocal <= ("00" & debugRegNumSel(6 downto 4)) + 4;
--          x := (others => '0');
--          x2 := conv_std_logic_vector(1, x2'length);
--          state := X"9";
--        when X"9" =>
--          if( x = 0 ) then
--            osdCharCodeInLocal <= char_to_std_logic_vector(hexchar(conv_integer(debugRegNumSel(7 downto 4))+1));
--          elsif( x2 = 0) then
--            osdCharCodeInLocal <= char_to_std_logic_vector(hexchar(conv_integer(debugRegData(7 downto 4))+1));
--          elsif( x2 = 1) then
--            osdCharCodeInLocal <= char_to_std_logic_vector(hexchar(conv_integer(debugRegData(3 downto 0))+1));
--            if( x /= 0 ) then
--              debugRegNumSel <= debugRegNumSel + 1;
--            end if;
--          else
--            osdCharCodeInLocal <= char_to_std_logic_vector(str3(conv_integer(x)+1));
--          end if;
--          osdCharLocalWrReq <= not osdCharLocalWrAck;
--          state := X"A";
--          if( x2 = 2) then
--            x2 := (others => '0');
--          else
--            x2 := x2 + 1;
--          end if;
--        when X"A" =>
--          -- waiting wr ack
--          if( osdCharLocalWrReq = osdCharLocalWrAck ) then
--              if( debugRegNumSel = 47 ) then
--                debugRegNumSel <= (others => '0');
--                state := X"8";
--              else
----            if( x = str2'length -1) then
--                if( x = 49) then
--                  state := X"8";
--                else
--                  x := x+1;
--                  osdLocateXLocal <= osdLocateXLocal + 1;
--                  state := X"9";
--                end if;
--              end if;
--          end if;
--        when others => null;
--      end case;
--    end if;
--  end process;

end rtl;

