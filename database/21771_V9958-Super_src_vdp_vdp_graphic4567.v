// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

//  converted from vdp_graphic4567.vhd
//    Imprementation of Graphic Mode 4,5,6 and 7.
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
// Main processing circuit of GRAPHIC mode 4,5,6,7.

module VDP_GRAPHIC4567 (
    input wire CLK21M,
    input wire RESET,
    input wire [1:0] DOTSTATE,
    input wire [2:0] EIGHTDOTSTATE,
    input wire [8:0] DOTCOUNTERX,
    input wire [8:0] DOTCOUNTERY,
    input wire VDPMODEGRAPHIC4,
    input wire VDPMODEGRAPHIC5,
    input wire VDPMODEGRAPHIC6,
    input wire VDPMODEGRAPHIC7,
    input wire REG_R1_BL_CLKS,
    input wire [6:0] REG_R2_PT_NAM_ADDR,
    input wire [7:0] REG_R13_BLINK_PERIOD,
    input wire [8:3] REG_R26_H_SCROLL,
    input wire [2:0] REG_R27_H_SCROLL,
    input wire REG_R25_YAE,
    input wire REG_R25_YJK,
    input wire REG_R25_SP2,
    input wire [7:0] PRAMDAT,
    input wire [7:0] PRAMDATPAIR,
    output bit [17:0] PRAMADR,
    output reg [7:0] PCOLORCODE,
    output reg [5:0] P_YJK_R,
    output reg [5:0] P_YJK_G,
    output reg [5:0] P_YJK_B,
    output reg P_YJK_EN
);

  wire [16:0] LOGICALVRAMADDRG45;
  wire [16:0] LOGICALVRAMADDRG67;
  reg [8:0] LOCALDOTCOUNTERX;
  reg [6:0] LATCHEDPTNNAMETBLBASEADDR;
  wire [7:0] FIFOADDR;
  reg [7:0] FIFOADDR_IN;
  reg [7:0] FIFOADDR_OUT;
  wire FIFOWE;
  reg FIFOIN;
  wire [7:0] FIFODATA_IN;
  wire [7:0] FIFODATA_OUT;
  reg [7:0] FF_FIFO0;
  reg [7:0] FF_FIFO1;
  reg [7:0] FF_FIFO2;
  reg [7:0] FF_FIFO3;
  reg [7:0] FF_PIX0;
  reg [7:0] FF_PIX1;
  reg [7:0] FF_PIX2;
  reg [7:0] FF_PIX3;
  reg [7:0] COLORDATA;
  wire [8:0] W_DOTCOUNTERX;
  wire W_SP2_H_SCROLL;
  reg [7:0] W_PIX;
  wire [4:0] W_Y;
  wire [5:0] W_K;
  wire [5:0] W_J;
  wire [6:0] W_R_YJK;
  wire [6:0] W_G_YJK;
  wire [7:0] W_B_Y;
  wire [7:0] W_B_JK;
  wire [8:0] W_B_YJKP;
  wire [6:0] W_B_YJK;
  wire [5:0] W_R;
  wire [5:0] W_G;
  wire [5:0] W_B;
  reg [3:0] FF_BLINK_CLK_CNT;
  reg FF_BLINK_STATE;
  reg [3:0] FF_BLINK_PERIOD_CNT;
  wire [3:0] W_BLINK_CNT_MAX;
  wire W_BLINK_SYNC;

  //--------------------------------------------------------------
  // FIFO AND CONTROL SIGNALS
  //--------------------------------------------------------------
  assign FIFOADDR = (FIFOIN == 1'b1) ? FIFOADDR_IN : FIFOADDR_OUT;
  assign FIFOWE = (FIFOIN == 1'b1) ? 1'b1 : 1'b0;
  assign FIFODATA_IN = ((DOTSTATE == 2'b00) || (DOTSTATE == 2'b01)) ? PRAMDAT : PRAMDATPAIR;

  RAM8 #(
      .MEM_SIZE(128)
  ) U_FIFOMEM (
      .ADR(FIFOADDR),
      .CLK(CLK21M),
      .WE (FIFOWE),
      .DBO(FIFODATA_IN),
      .DBI(FIFODATA_OUT)
  );

  always_ff @(posedge CLK21M) begin
    if ((DOTSTATE == 2'b01)) begin
      case (EIGHTDOTSTATE[1:0])
        2'b00: begin
          FF_FIFO0 <= FIFODATA_OUT;
        end
        2'b01: begin
          FF_FIFO1 <= FIFODATA_OUT;
        end
        2'b10: begin
          FF_FIFO2 <= FIFODATA_OUT;
        end
        2'b11: begin
          FF_FIFO3 <= FIFODATA_OUT;
        end
      endcase
    end
  end

  always_ff @(posedge CLK21M) begin
    if ((DOTSTATE == 2'b00 && EIGHTDOTSTATE[1:0] == 2'b00)) begin
      FF_PIX0 <= FF_FIFO0;
      FF_PIX1 <= FF_FIFO1;
      FF_PIX2 <= FF_FIFO2;
      FF_PIX3 <= FF_FIFO3;
    end
  end

  always_comb begin
    case (EIGHTDOTSTATE[1:0])
      2'b00:   W_PIX = FF_PIX0;
      2'b01:   W_PIX = FF_PIX1;
      2'b10:   W_PIX = FF_PIX2;
      2'b11:   W_PIX = FF_PIX3;
      default: W_PIX = {8{1'bX}};
    endcase
  end

  // TWO SCREEN H-SCROLL MODE (R25 SP2 = '1')
  // CONSIDER R#13 BLINKING TO FLIP PAGES
  assign W_SP2_H_SCROLL = ((REG_R25_SP2 & LATCHEDPTNNAMETBLBASEADDR[5]) == 1'b1) ? LOCALDOTCOUNTERX[8] : (FF_BLINK_STATE == 1'b0) ? LATCHEDPTNNAMETBLBASEADDR[5] : 1'b0;
  // VRAM ADDRESS MAPPINGS.
  assign LOGICALVRAMADDRG45 = {LATCHEDPTNNAMETBLBASEADDR[6], W_SP2_H_SCROLL, LATCHEDPTNNAMETBLBASEADDR[4:0] & DOTCOUNTERY[7:3], DOTCOUNTERY[2:0], LOCALDOTCOUNTERX[7:1]};
  assign LOGICALVRAMADDRG67 = {W_SP2_H_SCROLL, LATCHEDPTNNAMETBLBASEADDR[4:0] & DOTCOUNTERY[7:3], DOTCOUNTERY[2:0], LOCALDOTCOUNTERX[7:0]};

  // FIFO CONTROL
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FIFOADDR_IN <= 0;
    end else begin
      if ((DOTSTATE == 2'b00)) begin
        if ((EIGHTDOTSTATE == 3'b000 && DOTCOUNTERX == 0)) begin
          FIFOADDR_IN <= 0;
        end
      end else if ((FIFOIN == 1'b1)) begin
        FIFOADDR_IN <= 8'(FIFOADDR_IN + 1);
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FIFOADDR_OUT <= 0;
    end else begin
      case (DOTSTATE)
        2'b00: begin
        end
        2'b01: begin
          if (((VDPMODEGRAPHIC4 == 1'b0) && (VDPMODEGRAPHIC5 == 1'b0))) begin
            FIFOADDR_OUT <= 8'(FIFOADDR_OUT + 1);
          end else if ((EIGHTDOTSTATE[0] == 1'b0)) begin
            // GRAPHIC4, 5
            FIFOADDR_OUT <= 8'(FIFOADDR_OUT + 1);
          end
        end
        2'b11: begin
        end
        2'b10: begin
          if ((DOTCOUNTERX == 8'h04)) begin
            FIFOADDR_OUT <= 0;
          end
        end
        default: begin
        end
      endcase
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FIFOIN <= 1'b0;
    end else begin
      case (DOTSTATE)
        2'b00: begin
          if ((EIGHTDOTSTATE == 3'b000)) begin
            FIFOIN <= 1'b0;
          end else if (((EIGHTDOTSTATE == 3'b001) || (EIGHTDOTSTATE == 3'b010) || (EIGHTDOTSTATE == 3'b011) || (EIGHTDOTSTATE == 3'b100))) begin
            FIFOIN <= 1'b1;
          end
        end
        2'b01: begin
          FIFOIN <= 1'b0;
        end
        2'b11: begin
          if((((VDPMODEGRAPHIC6 == 1'b1) || (VDPMODEGRAPHIC7 == 1'b1)) && ((EIGHTDOTSTATE == 3'b001) || (EIGHTDOTSTATE == 3'b010) || (EIGHTDOTSTATE == 3'b011) || (EIGHTDOTSTATE == 3'b100)))) begin
            FIFOIN <= 1'b1;
          end
        end
        2'b10: begin
          FIFOIN <= 1'b0;
        end
        default: begin
        end
      endcase
    end
  end

  // FIFO OUT LATCH
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      COLORDATA  <= {8{1'b0}};
      PCOLORCODE <= {8{1'b0}};
    end else begin
      case (DOTSTATE)
        2'b00: begin
        end
        2'b01: begin
          if (((VDPMODEGRAPHIC4 == 1'b1) || (VDPMODEGRAPHIC5 == 1'b1))) begin
            if ((EIGHTDOTSTATE[0] == 1'b0)) begin
              COLORDATA <= W_PIX;
              PCOLORCODE[7:4] <= {4{1'b0}};
              PCOLORCODE[3:0] <= W_PIX[7:4];
            end else begin
              PCOLORCODE[7:4] <= {4{1'b0}};
              PCOLORCODE[3:0] <= COLORDATA[3:0];
            end
          end else if ((VDPMODEGRAPHIC6 == 1'b1 || REG_R25_YAE == 1'b1)) begin
            COLORDATA <= W_PIX;
            PCOLORCODE[7:4] <= {4{1'b0}};
            PCOLORCODE[3:0] <= W_PIX[7:4];
          end else begin
            // GRAPHIC7
            PCOLORCODE <= W_PIX;
          end
        end
        2'b11: begin
        end
        2'b10: begin
          // HIGH RESOLUTION MODE .
          if ((VDPMODEGRAPHIC6 == 1'b1)) begin
            PCOLORCODE[7:4] <= {4{1'b0}};
            PCOLORCODE[3:0] <= COLORDATA[3:0];
          end
        end
        default: begin
        end
      endcase
    end
  end

  // YJK COLOR CONVERT
  assign W_Y = W_PIX[7:3];  //  Y ( 0...31)
  assign W_J = {FF_PIX3[2:0], FF_PIX2[2:0]};  //  J (-32...31)
  assign W_K = {FF_PIX1[2:0], FF_PIX0[2:0]};  //  K (-32...31)

  assign W_R_YJK = ({2'b00, W_Y}) + ({W_J[5], W_J});  //  R (-32...62)
  assign W_G_YJK = ({2'b00, W_Y}) + ({W_K[5], W_K});  //  B (-32...62)
  assign W_B_Y = ({1'b0, W_Y, 2'b00}) + ({3'b000, W_Y});  //  Y * 5               ( 0...155 )
  assign W_B_JK = ({W_J[5], W_J, 1'b0}) + ({W_K[5], W_K[5], W_K});  //  J * 2 + K           ( -96...93 )
  assign W_B_YJKP = ({1'b0, W_B_Y}) - ({W_B_JK[7], W_B_JK}) + 9'b000000010;  //  (Y * 5 - (J * 2 + K) + 2)   (-91...253)
  assign W_B_YJK = W_B_YJKP[8:2];  //  (Y * 5 - (J * 2 + K) + 2)/4 (-22...63)

  assign W_R = (W_R_YJK[6] == 1'b1) ? {6{1'b0}} : (W_R_YJK[5] == 1'b1) ? {6{1'b1}} : {W_R_YJK[4:0], 1'b0};
  assign W_G = (W_G_YJK[6] == 1'b1) ? {6{1'b0}} : (W_G_YJK[5] == 1'b1) ? {6{1'b1}} : {W_G_YJK[4:0], 1'b0};
  assign W_B = (W_B_YJK[6] == 1'b1) ? {6{1'b0}} : (W_B_YJK[5] == 1'b1) ? {6{1'b1}} : {W_B_YJK[4:0], 1'b0};

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      P_YJK_R <= {6{1'b0}};
      P_YJK_G <= {6{1'b0}};
      P_YJK_B <= {6{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b01)) begin
        P_YJK_R <= W_R;
        P_YJK_G <= W_G;
        P_YJK_B <= W_B;
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      P_YJK_EN <= 1'b0;
    end else begin
      if ((DOTSTATE == 2'b01)) begin
        if ((REG_R25_YAE == 1'b1 && W_PIX[3] == 1'b1)) begin
          // PALETTE COLOR ON SCREEN10/SCREEN11
          P_YJK_EN <= 1'b0;
        end else begin
          P_YJK_EN <= REG_R25_YJK;
        end
      end
    end
  end

  // VRAM READ ADDRESS
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      PRAMADR <= {17{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b11)) begin
        if (((VDPMODEGRAPHIC4 == 1'b1) || (VDPMODEGRAPHIC5 == 1'b1))) begin
          PRAMADR <= LOGICALVRAMADDRG45[16:0];
        end else begin
          PRAMADR <= LOGICALVRAMADDRG67[16:0];
        end
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      LATCHEDPTNNAMETBLBASEADDR <= {7{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b00 && EIGHTDOTSTATE == 3'b000)) begin
        LATCHEDPTNNAMETBLBASEADDR <= REG_R2_PT_NAM_ADDR;
      end
    end
  end

  assign W_DOTCOUNTERX = {DOTCOUNTERX[8:3] + REG_R26_H_SCROLL, 3'b000};
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      LOCALDOTCOUNTERX <= 0;
    end else begin
      if ((DOTSTATE == 2'b00)) begin
        if ((EIGHTDOTSTATE == 3'b000)) begin
          LOCALDOTCOUNTERX <= W_DOTCOUNTERX;
        end else if (((EIGHTDOTSTATE == 3'b001) || (EIGHTDOTSTATE == 3'b010) || (EIGHTDOTSTATE == 3'b011) || (EIGHTDOTSTATE == 3'b100))) begin
          LOCALDOTCOUNTERX <= 9'(LOCALDOTCOUNTERX + 2);
        end
      end
    end
  end

  assign W_BLINK_CNT_MAX = (FF_BLINK_STATE == 1'b0) ? REG_R13_BLINK_PERIOD[3:0] : REG_R13_BLINK_PERIOD[7:4];
  assign W_BLINK_SYNC = ((DOTCOUNTERX == 0) && (DOTCOUNTERY == 0) && (DOTSTATE == 2'b00) && (REG_R1_BL_CLKS == 1'b0)) ? 1'b1 : ((DOTCOUNTERX == 0) && (DOTSTATE == 2'b00) && (REG_R1_BL_CLKS == 1'b1)) ? 1'b1 : 1'b0;
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
