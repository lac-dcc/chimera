// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

//
//  converted from vdp_colordec.vhd
//
//  Copyright (C) 2000-2006 Kunihiko Ohnaka
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
//----------------------------------------------------------------------------


module VDP_COLORDEC (
    input wire RESET,
    input wire CLK21M,
    input wire [1:0] DOTSTATE,
    output wire [3:0] PPALETTEADDR_OUT,
    input wire [7:0] PALETTEDATARB_OUT,
    input wire [7:0] PALETTEDATAG_OUT,
    input wire VDPMODETEXT1,
    input wire VDPMODETEXT1Q,
    input wire VDPMODETEXT2,
    input wire VDPMODEMULTI,
    input wire VDPMODEMULTIQ,
    input wire VDPMODEGRAPHIC1,
    input wire VDPMODEGRAPHIC2,
    input wire VDPMODEGRAPHIC3,
    input wire VDPMODEGRAPHIC4,
    input wire VDPMODEGRAPHIC5,
    input wire VDPMODEGRAPHIC6,
    input wire VDPMODEGRAPHIC7,
    input wire WINDOW,
    input wire SPRITECOLOROUT,
    input wire [3:0] COLORCODET12,
    input wire [3:0] COLORCODEG123M,
    input wire [7:0] COLORCODEG4567,
    input wire [3:0] COLORCODESPRITE,
    input wire [5:0] P_YJK_R,
    input wire [5:0] P_YJK_G,
    input wire [5:0] P_YJK_B,
    input wire P_YJK_EN,
    output wire [5:0] PVIDEOR_VDP,
    output wire [5:0] PVIDEOG_VDP,
    output wire [5:0] PVIDEOB_VDP,
    input wire REG_R1_DISP_ON,
    input wire [7:0] REG_R7_FRAME_COL,
    input wire REG_R8_COL0_ON,
    input wire REG_R25_YJK
);

  reg [5:0] FF_VIDEO_R;
  reg [5:0] FF_VIDEO_G;
  reg [5:0] FF_VIDEO_B;
  reg [7:0] FF_GRP7_COLOR_CODE;
  reg [3:0] FF_PALETTE_ADDR;
  reg [1:0] FF_PALETTE_ADDR_G5;
  reg [5:0] FF_YJK_R;
  reg [5:0] FF_YJK_G;
  reg [5:0] FF_YJK_B;
  reg FF_YJK_EN;
  reg FF_SPRITECOLOROUT;
  wire W_EVEN_DOTSTATE;
  reg [7:0] W_GRP7_SPRITE_COLOR;
  wire [3:0] W_FORE_COLOR;
  wire [3:0] W_BACK_COLOR;
  wire [7:0] W_GRP7_COLOR;
  wire [3:0] W_PALETTE_ADDR;

  assign PPALETTEADDR_OUT = (VDPMODEGRAPHIC5 == 1'b0) ? FF_PALETTE_ADDR : {2'b00, FF_PALETTE_ADDR_G5};
  assign PVIDEOR_VDP = FF_VIDEO_R;
  assign PVIDEOG_VDP = FF_VIDEO_G;
  assign PVIDEOB_VDP = FF_VIDEO_B;
  assign W_EVEN_DOTSTATE = (DOTSTATE == 2'b00 || DOTSTATE == 2'b11) ? 1'b1 : 1'b0;

  // OUTPUT DATA LATCH
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_VIDEO_R <= 6'b000000;
      FF_VIDEO_G <= 6'b000000;
      FF_VIDEO_B <= 6'b000000;
    end else begin
      if ((W_EVEN_DOTSTATE == 1'b1)) begin
        if ((VDPMODEGRAPHIC7 == 1'b1 && FF_YJK_EN == 1'b1 && FF_SPRITECOLOROUT == 1'b0)) begin
          //  YJK MODE
          FF_VIDEO_R <= FF_YJK_R;
          FF_VIDEO_G <= FF_YJK_G;
          FF_VIDEO_B <= FF_YJK_B;
        end else if ((VDPMODEGRAPHIC7 == 1'b0 || REG_R25_YJK == 1'b1)) begin
          //  PALETTE COLOR (NOT GRAPHIC7, SPRITE ON YJK MODE, YAE COLOR ON YJK MODE)
          FF_VIDEO_R <= {PALETTEDATARB_OUT[6:4], 3'b000};
          FF_VIDEO_G <= {PALETTEDATAG_OUT[2:0], 3'b000};
          FF_VIDEO_B <= {PALETTEDATARB_OUT[2:0], 3'b000};
        end else begin
          //  GRAPHIC7
          FF_VIDEO_R <= {FF_GRP7_COLOR_CODE[4:2], 3'b000};
          FF_VIDEO_G <= {FF_GRP7_COLOR_CODE[7:5], 3'b000};
          FF_VIDEO_B <= {FF_GRP7_COLOR_CODE[1:0], FF_GRP7_COLOR_CODE[1], 3'b000};
        end
      end
    end
  end

  // FOR GRAPHIC7
  always_comb begin
    case (COLORCODESPRITE)
      4'b0000: W_GRP7_SPRITE_COLOR = {3'b000, 3'b000, 2'b00};
      4'b0001: W_GRP7_SPRITE_COLOR = {3'b000, 3'b000, 2'b01};
      4'b0010: W_GRP7_SPRITE_COLOR = {3'b000, 3'b011, 2'b00};
      4'b0011: W_GRP7_SPRITE_COLOR = {3'b000, 3'b011, 2'b01};
      4'b0100: W_GRP7_SPRITE_COLOR = {3'b011, 3'b000, 2'b00};
      4'b0101: W_GRP7_SPRITE_COLOR = {3'b011, 3'b000, 2'b01};
      4'b0110: W_GRP7_SPRITE_COLOR = {3'b011, 3'b011, 2'b00};
      4'b0111: W_GRP7_SPRITE_COLOR = {3'b011, 3'b011, 2'b01};
      4'b1000: W_GRP7_SPRITE_COLOR = {3'b100, 3'b111, 2'b01};
      4'b1001: W_GRP7_SPRITE_COLOR = {3'b000, 3'b000, 2'b11};
      4'b1010: W_GRP7_SPRITE_COLOR = {3'b000, 3'b111, 2'b00};
      4'b1011: W_GRP7_SPRITE_COLOR = {3'b000, 3'b111, 2'b11};
      4'b1100: W_GRP7_SPRITE_COLOR = {3'b111, 3'b000, 2'b00};
      4'b1101: W_GRP7_SPRITE_COLOR = {3'b111, 3'b000, 2'b11};
      4'b1110: W_GRP7_SPRITE_COLOR = {3'b111, 3'b111, 2'b00};
      4'b1111: W_GRP7_SPRITE_COLOR = {3'b111, 3'b111, 2'b11};
      default: W_GRP7_SPRITE_COLOR = {8{1'b0}};
    endcase
  end

  // FOR OTHERS
  assign W_FORE_COLOR = ((VDPMODETEXT1 | VDPMODETEXT1Q | VDPMODETEXT2) == 1'b1) ? COLORCODET12 : (SPRITECOLOROUT == 1'b1) ? COLORCODESPRITE : ((VDPMODEGRAPHIC1 | VDPMODEGRAPHIC2 | VDPMODEGRAPHIC3 | VDPMODEMULTI | VDPMODEMULTIQ) == 1'b1) ? COLORCODEG123M : COLORCODEG4567[3:0];
  assign W_BACK_COLOR = REG_R7_FRAME_COL[3:0];
  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PALETTE_ADDR <= {4{1'b0}};
    end else begin
      if ((W_EVEN_DOTSTATE == 1'b1)) begin
        if ((WINDOW == 1'b0 || REG_R1_DISP_ON == 1'b0 || (W_FORE_COLOR == 4'b0000 && REG_R8_COL0_ON == 1'b0))) begin
          FF_PALETTE_ADDR <= W_BACK_COLOR;
        end else begin
          FF_PALETTE_ADDR <= W_FORE_COLOR;
        end
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PALETTE_ADDR_G5 <= {2{1'b0}};
    end else begin
      if ((W_EVEN_DOTSTATE == 1'b1)) begin
        if((WINDOW == 1'b0 || REG_R1_DISP_ON == 1'b0 || (DOTSTATE[1] == 1'b0 && W_FORE_COLOR[1:0] == 2'b00 && REG_R8_COL0_ON == 1'b0) || (DOTSTATE[1] == 1'b1 && W_FORE_COLOR[3:2] == 2'b00 && REG_R8_COL0_ON == 1'b0))) begin
          if ((DOTSTATE[1] == 1'b0)) begin
            FF_PALETTE_ADDR_G5 <= W_BACK_COLOR[1:0];
          end else begin
            FF_PALETTE_ADDR_G5 <= W_BACK_COLOR[3:2];
          end
        end else begin
          if ((DOTSTATE[1] == 1'b0)) begin
            FF_PALETTE_ADDR_G5 <= W_FORE_COLOR[1:0];
          end else begin
            FF_PALETTE_ADDR_G5 <= W_FORE_COLOR[3:2];
          end
        end
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_GRP7_COLOR_CODE <= {8{1'b0}};
    end else begin
      if ((W_EVEN_DOTSTATE == 1'b1)) begin
        if ((SPRITECOLOROUT == 1'b1)) begin
          FF_GRP7_COLOR_CODE <= W_GRP7_SPRITE_COLOR;
        end else begin
          FF_GRP7_COLOR_CODE <= COLORCODEG4567;
        end
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_SPRITECOLOROUT <= 1'b0;
      FF_YJK_R <= 0;
      FF_YJK_G <= 0;
      FF_YJK_B <= 0;
      FF_YJK_EN <= 1'b0;
    end else begin
      if ((W_EVEN_DOTSTATE == 1'b1)) begin
        FF_SPRITECOLOROUT <= SPRITECOLOROUT & WINDOW & REG_R1_DISP_ON;
        if ((WINDOW == 1'b1 && REG_R1_DISP_ON == 1'b1)) begin
          FF_YJK_R  <= P_YJK_R;
          FF_YJK_G  <= P_YJK_G;
          FF_YJK_B  <= P_YJK_B;
          FF_YJK_EN <= P_YJK_EN;
        end else if (((WINDOW == 1'b0 || REG_R1_DISP_ON == 1'b0) && REG_R25_YJK == 1'b1)) begin
          FF_YJK_EN <= 1'b0;
        end else begin
          FF_YJK_R  <= {REG_R7_FRAME_COL[4:2], 3'b000};
          FF_YJK_G  <= {REG_R7_FRAME_COL[7:5], 3'b000};
          FF_YJK_B  <= {REG_R7_FRAME_COL[1:0], REG_R7_FRAME_COL[1], 3'b000};
          FF_YJK_EN <= 1'b1;
        end
      end
    end
  end


endmodule
