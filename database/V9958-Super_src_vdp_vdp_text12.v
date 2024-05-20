// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

//  converted from vdp_text12.vhd
//    Imprementation of Text Mode 1,2.
//
//  Copyright (C) 2006 Kunihiko Ohnaka
//  All rights reserved.
//                                     http://www.ohnaka.jp/ese-vdp/
//
//  本ソフトウェアおよび本ソフトウェアに基づいて作成された派生物は、以下の条件を
//  満たす場合に限り、再頒布および使用が許可されます。
//
//  1.ソースコード形式で再頒布する場合、上記の著作権表示、本条件一覧、および下記
//    免責条項をそのままの形で保持すること。
//  2.バイナリ形式で再頒布する場合、頒布物に付属のドキュメント等の資料に、上記の
//    著作権表示、本条件一覧、および下記免責条項を含めること。
//  3.書面による事前の許可なしに、本ソフトウェアを販売、および商業的な製品や活動
//    に使用しないこと。
//
//  本ソフトウェアは、著作権者によって「現状のまま」提供されています。著作権者は、
//  特定目的への適合性の保証、商品性の保証、またそれに限定されない、いかなる明示
//  的もしくは暗黙な保証責任も負いません。著作権者は、事由のいかんを問わず、損害
//  発生の原因いかんを問わず、かつ責任の根拠が契約であるか厳格責任であるか（過失
//  その他の）不法行為であるかを問わず、仮にそのような損害が発生する可能性を知ら
//  されていたとしても、本ソフトウェアの使用によって発生した（代替品または代用サ
//  ービスの調達、使用の喪失、データの喪失、利益の喪失、業務の中断も含め、またそ
//  れに限定されない）直接損害、間接損害、偶発的な損害、特別損害、懲罰的損害、ま
//  たは結果損害について、一切責任を負わないものとします。
//
//  Note that above Japanese version license is the formal document.
//  The following translation is only for reference.
//
//  Redistribution and use of this software or any derivative works,
//  are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above
//     copyright notice, this list of conditions and the following
//     disclaimer in the documentation and/or other materials
//     provided with the distribution.
//  3. Redistributions may not be sold, nor may they be used in a
//     commercial product or activity without specific prior written
//     permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
//  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
//  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
//  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
//  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//-----------------------------------------------------------------------------
//
// Main processing circuit of TEXT mode 1, 2.

module VDP_TEXT12 (
    input wire CLK21M,
    input wire RESET,
    input wire [1:0] DOTSTATE,
    input wire [8:0] DOTCOUNTERX,
    input wire [8:0] DOTCOUNTERY,
    input wire [8:0] DOTCOUNTERYP,
    input wire VDPMODETEXT1,
    input wire VDPMODETEXT1Q,
    input wire VDPMODETEXT2,
    input wire REG_R1_BL_CLKS,
    input wire [7:0] REG_R7_FRAME_COL,
    input wire [7:0] REG_R12_BLINK_MODE,
    input wire [7:0] REG_R13_BLINK_PERIOD,
    input wire [6:0] REG_R2_PT_NAM_ADDR,
    input wire [5:0] REG_R4_PT_GEN_ADDR,
    input wire [10:0] REG_R10R3_COL_ADDR,
    input wire [7:0] PRAMDAT,
    output reg [17:0] PRAMADR,
    output wire TXVRAMREADEN,
    output wire [3:0] PCOLORCODE
);

  // VDP CLOCK ... 21.477MHZ

  reg ITXVRAMREADEN;
  reg ITXVRAMREADEN2;
  reg [4:0] DOTCOUNTER24;
  reg TXWINDOWX;
  reg TXPREWINDOWX;
  wire [16:0] LOGICALVRAMADDRNAM;
  wire [16:0] LOGICALVRAMADDRGEN;
  wire [16:0] LOGICALVRAMADDRCOL;
  wire [11:0] TXCHARCOUNTER;
  reg [6:0] TXCHARCOUNTERX;
  reg [11:0] TXCHARCOUNTERSTARTOFLINE;
  reg [7:0] PATTERNNUM;
  reg [7:0] PREPATTERN;
  reg [7:0] PREBLINK;
  reg [7:0] PATTERN;
  reg [7:0] BLINK;
  reg TXCOLORCODE;  // ONLY 2 COLORS
  wire [7:0] TXCOLOR;
  reg [3:0] FF_BLINK_CLK_CNT;
  reg FF_BLINK_STATE;
  reg [3:0] FF_BLINK_PERIOD_CNT;
  wire [3:0] W_BLINK_CNT_MAX;
  wire W_BLINK_SYNC;

  // JP: RAMは DOTSTATEが"10","00"の時にアドレスを出して"01"でアクセスする。
  // JP: EIGHTDOTSTATEで見ると、
  // JP:  0-1     READ PATTERN NUM.
  // JP:  1-2     READ PATTERN
  // JP: となる。
  // Translation:
  //   RAM outputs the address when DOTSTATE is "10", "00" and accesses it at "01".
  //   When viewed with EIGHTDOTSTATE, it becomes:
  //    0-1     READ PATTERN NUM.
  //    1-2     READ PATTERN
  //

  //--------------------------------------------------------------
  //
  //--------------------------------------------------------------
  assign TXCHARCOUNTER = TXCHARCOUNTERSTARTOFLINE + TXCHARCOUNTERX;
  assign LOGICALVRAMADDRNAM = (VDPMODETEXT1 == 1'b1 || VDPMODETEXT1Q == 1'b1) ? {REG_R2_PT_NAM_ADDR, TXCHARCOUNTER[9:0]} : {REG_R2_PT_NAM_ADDR[6:2], TXCHARCOUNTER};
  assign LOGICALVRAMADDRGEN = {REG_R4_PT_GEN_ADDR, PATTERNNUM, DOTCOUNTERY[2:0]};
  assign LOGICALVRAMADDRCOL = {REG_R10R3_COL_ADDR[10:3], TXCHARCOUNTER[11:3]};
  assign TXVRAMREADEN = (VDPMODETEXT1 == 1'b1 || VDPMODETEXT1Q == 1'b1) ? ITXVRAMREADEN : (VDPMODETEXT2 == 1'b1) ? ITXVRAMREADEN | ITXVRAMREADEN2 : 1'b0;
  assign TXCOLOR = ((VDPMODETEXT2 == 1'b1) && (FF_BLINK_STATE == 1'b1) && (BLINK[7] == 1'b1)) ? REG_R12_BLINK_MODE : REG_R7_FRAME_COL;
  assign PCOLORCODE = ((TXWINDOWX == 1'b1) && (TXCOLORCODE == 1'b1)) ? TXCOLOR[7:4] : ((TXWINDOWX == 1'b1) && (TXCOLORCODE == 1'b0)) ? TXCOLOR[3:0] : REG_R7_FRAME_COL[3:0];

  //-------------------------------------------------------------------------
  // TIMING GENERATOR
  //-------------------------------------------------------------------------
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      DOTCOUNTER24 <= {5{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b10)) begin
        if ((DOTCOUNTERX == 12)) begin
          // JP: DOTCOUNTERは"10"のタイミングでは既にカウントアップしているので注意
          // (Note that DOTCOUNTER has already been counted up at the timing of "10")
          DOTCOUNTER24 <= {5{1'b0}};
        end else begin
          if ((DOTCOUNTER24[2:0] == 3'b101)) begin
            DOTCOUNTER24[4:3] <= 2'(DOTCOUNTER24[4:3] + 1);
            DOTCOUNTER24[2:0] <= 3'b000;
          end else begin
            DOTCOUNTER24[2:0] <= 3'(DOTCOUNTER24[2:0] + 1);
          end
        end
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      TXPREWINDOWX <= 1'b0;
    end else begin
      if ((DOTSTATE == 2'b10)) begin
        if ((DOTCOUNTERX == 12)) begin
          TXPREWINDOWX <= 1'b1;
        end else if ((DOTCOUNTERX == (240 + 12))) begin
          TXPREWINDOWX <= 1'b0;
        end
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      TXWINDOWX <= 1'b0;
    end else begin
      if ((DOTSTATE == 2'b01)) begin
        if ((DOTCOUNTERX == 16)) begin
          TXWINDOWX <= 1'b1;
        end else if ((DOTCOUNTERX == (240 + 16))) begin
          TXWINDOWX <= 1'b0;
        end
      end
    end
  end

  //-------------------------------------------------------------------------
  //
  //-------------------------------------------------------------------------
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      PATTERNNUM <= {8{1'b0}};
      PRAMADR <= {18{1'b0}};
      ITXVRAMREADEN <= 1'b0;
      ITXVRAMREADEN2 <= 1'b0;
      TXCHARCOUNTERX <= 0;
      PREBLINK <= {8{1'b0}};
      TXCHARCOUNTERSTARTOFLINE <= {12{1'b0}};
    end else begin
      case (DOTSTATE)
        2'b11: begin
          if ((TXPREWINDOWX == 1'b1)) begin
            // VRAM READ ADDRESS OUTPUT.
            case (DOTCOUNTER24[2:0])
              3'b000: begin
                if ((DOTCOUNTER24[4:3] == 2'b00)) begin
                  // READ COLOR TABLE(TEXT2 BLINK)
                  // IT IS USED ONLY ONE TIME PER 8 CHARACTERS.
                  PRAMADR <= LOGICALVRAMADDRCOL;
                  ITXVRAMREADEN2 <= 1'b1;
                end
              end
              3'b001: begin
                // READ PATTERN NAME TABLE
                PRAMADR <= LOGICALVRAMADDRNAM;
                ITXVRAMREADEN <= 1'b1;
                TXCHARCOUNTERX <= 7'(TXCHARCOUNTERX + 1);
              end
              3'b010: begin
                // READ PATTERN GENERATOR TABLE
                PRAMADR <= LOGICALVRAMADDRGEN;
                ITXVRAMREADEN <= 1'b1;
              end
              3'b100: begin
                // READ PATTERN NAME TABLE
                // IT IS USED IF VDPMODE IS TEST2.
                PRAMADR <= LOGICALVRAMADDRNAM;
                ITXVRAMREADEN2 <= 1'b1;
                if ((VDPMODETEXT2 == 1'b1)) begin
                  TXCHARCOUNTERX <= 7'(TXCHARCOUNTERX + 1);
                end
              end
              3'b101: begin
                // READ PATTERN GENERATOR TABLE
                // IT IS USED IF VDPMODE IS TEST2.
                PRAMADR <= LOGICALVRAMADDRGEN;
                ITXVRAMREADEN2 <= 1'b1;
              end
              default: begin
              end
            endcase
          end
        end
        2'b10: begin
          ITXVRAMREADEN  <= 1'b0;
          ITXVRAMREADEN2 <= 1'b0;
        end
        2'b00: begin
          if ((DOTCOUNTERX == 11)) begin
            TXCHARCOUNTERX <= {7{1'b0}};
            if ((DOTCOUNTERYP == 0)) begin
              TXCHARCOUNTERSTARTOFLINE <= {12{1'b0}};
            end
          end else if (((DOTCOUNTERX == (240 + 11)) && (DOTCOUNTERYP[2:0] == 3'b111))) begin
            TXCHARCOUNTERSTARTOFLINE <= TXCHARCOUNTERSTARTOFLINE + TXCHARCOUNTERX;
          end
        end
        2'b01: begin
          case (DOTCOUNTER24[2:0])
            3'b001: begin
              // READ COLOR TABLE(TEXT2 BLINK)
              // IT IS USED ONLY ONE TIME PER 8 CHARACTERS.
              if ((DOTCOUNTER24[4:3] == 2'b00)) begin
                PREBLINK <= PRAMDAT;
              end
            end
            3'b010: begin
              // READ PATTERN NAME TABLE
              PATTERNNUM <= PRAMDAT;
            end
            3'b011: begin
              // READ PATTERN GENERATOR TABLE
              PREPATTERN <= PRAMDAT;
            end
            3'b101: begin
              // READ PATTERN NAME TABLE
              // IT IS USED IF VDPMODE IS TEST2.
              PATTERNNUM <= PRAMDAT;
            end
            3'b000: begin
              // READ PATTERN GENERATOR TABLE
              // IT IS USED IF VDPMODE IS TEST2.
              if ((VDPMODETEXT2 == 1'b1)) begin
                PREPATTERN <= PRAMDAT;
              end
            end
            default: begin
            end
          endcase
        end
        default: begin
        end
      endcase
    end
  end

  //--------------------------------------------------------------
  //
  //--------------------------------------------------------------
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      PATTERN <= {8{1'b0}};
      TXCOLORCODE <= 1'b0;
      BLINK <= {8{1'b0}};
    end else begin
      // Color Code Decision
      // JP: "01"と"10"のタイミングでかラーコードを出力してあげれば、
      // JP: VDPエンティティの方でパレットをデコードして色を出力してくれる。
      // JP: "01"と"10"で同じ色を出力すれば横256ドットになり、違う色を
      // JP: 出力すれば横512ドット表示となる。
      // Translation:
      //   If you output the color code at the "01" and "10" timings,
      //   the VDP entity will decode the palette and output the color.
      //   If you output the same color at "01" and "10", it will be a 256-dot horizontal display,
      //   and if you output different colors, it will be a 512-dot horizontal display.
      case (DOTSTATE)
        2'b00: begin
          if ((DOTCOUNTER24[2:0] == 3'b100)) begin
            // LOAD NEXT 8 DOT DATA
            // JP: キャラクタの描画は DOTCOUNTER24が、
            // JP:   "0:4"から"1:3"の6ドット
            // JP:   "1:4"から"2:3"の6ドット
            // JP:   "2:4"から"3:3"の6ドット
            // JP:   "3:4"から"0:3"の6ドット
            // JP: で行われるので"100"のタイミングでロードする
            // Translation:
            //   The character drawing is done when DOTCOUNTER24 is,
            //     6 dots from "0:4" to "1:3"
            //     6 dots from "1:4" to "2:3"
            //     6 dots from "2:4" to "3:3"
            //     6 dots from "3:4" to "0:3"
            //   So load at the "100" timing
            PATTERN <= PREPATTERN;
          end else if (((DOTCOUNTER24[2:0] == 3'b001) && (VDPMODETEXT2 == 1'b1))) begin
            // JP: TEXT2では"001"のタイミングでもロードする。
            // (In TEXT2, load at the "001" timing)
            PATTERN <= PREPATTERN;
          end
          if (((DOTCOUNTER24[2:0] == 3'b100) || (DOTCOUNTER24[2:0] == 3'b001))) begin
            // EVALUATE BLINK SIGNAL
            if ((DOTCOUNTER24[4:0] == 5'b00100)) begin
              BLINK <= PREBLINK;
            end else begin
              BLINK <= {BLINK[6:0], 1'b0};
            end
          end
        end
        2'b01: begin
          // パターンに応じてカラーコードを決定
          // (Determine the color code according to the pattern)
          TXCOLORCODE <= PATTERN[7];

          // パターンをシフト
          // (Shift the pattern)
          PATTERN <= {PATTERN[6:0], 1'b0};
        end
        2'b11: begin
        end
        2'b10: begin
          if ((VDPMODETEXT2 == 1'b1)) begin
            TXCOLORCODE <= PATTERN[7];

            // パターンをシフト
            // (Shift the pattern)
            PATTERN <= {PATTERN[6:0], 1'b0};
          end
        end
        default: begin
        end
      endcase
    end
  end

  //------------------------------------------------------------------------
  // BLINK TIMING GENERATION FIXED BY CARO AND T.HARA
  //------------------------------------------------------------------------
  assign W_BLINK_CNT_MAX = (FF_BLINK_STATE == 1'b0) ? REG_R13_BLINK_PERIOD[3:0] : REG_R13_BLINK_PERIOD[7:4];
  assign W_BLINK_SYNC = ((DOTCOUNTERX == 0) && (DOTCOUNTERYP == 0) && (DOTSTATE == 2'b00) && (REG_R1_BL_CLKS == 1'b0)) ? 1'b1 : ((DOTCOUNTERX == 0) && (DOTSTATE == 2'b00) && (REG_R1_BL_CLKS == 1'b1)) ? 1'b1 : 1'b0;
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_BLINK_CLK_CNT <= 0;
      FF_BLINK_STATE <= 0;
      FF_BLINK_PERIOD_CNT <= 0;
    end else begin
      if ((W_BLINK_SYNC == 1'b1)) begin
        if ((FF_BLINK_CLK_CNT == 4'b1001)) begin
          FF_BLINK_CLK_CNT <= 0;
          FF_BLINK_PERIOD_CNT <= 4'(FF_BLINK_PERIOD_CNT + 1);
        end else begin
          FF_BLINK_CLK_CNT <= 4'(FF_BLINK_CLK_CNT + 1);
        end
        if ((FF_BLINK_PERIOD_CNT >= W_BLINK_CNT_MAX)) begin
          FF_BLINK_PERIOD_CNT <= 0;
          if ((REG_R13_BLINK_PERIOD[7:4] == 4'b0000)) begin
            // WHEN ON PERIOD IS 0, THE PAGE SELECTED SHOULD BE ALWAYS ODD / R#2
            FF_BLINK_STATE <= 1'b0;
          end else if ((REG_R13_BLINK_PERIOD[3:0] == 4'b0000)) begin
            // WHEN OFF PERIOD IS 0 AND ON NOT, THE PAGE SELECT SHOULD BE ALWAYS THE R#2 EVEN PAIR
            FF_BLINK_STATE <= 1'b1;
          end else begin
            // NEITHER ARE 0, SO JUST KEEP SWITCHING WHEN PERIOD ENDS
            FF_BLINK_STATE <= ~FF_BLINK_STATE;
          end
        end
      end
    end
  end

endmodule
