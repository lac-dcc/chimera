// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

//  converted from vdp_graphic123M.vhd
//    Imprementation of Graphic Mode 1,2,3 and Multicolor Mode.
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
// This is the main processing circuit of GRAPHIC mode 1,2,3 and MULTICOLOR mode.
//

module VDP_GRAPHIC123M (
    input wire CLK21M,
    input wire RESET,
    input wire [1:0] DOTSTATE,
    input wire [2:0] EIGHTDOTSTATE,
    input wire [8:0] DOTCOUNTERX,
    input wire [8:0] DOTCOUNTERY,
    input wire VDPMODEMULTI,
    input wire VDPMODEMULTIQ,
    input wire VDPMODEGRAPHIC1,
    input wire VDPMODEGRAPHIC2,
    input wire VDPMODEGRAPHIC3,
    input wire [6:0] REG_R2_PT_NAM_ADDR,
    input wire [5:0] REG_R4_PT_GEN_ADDR,
    input wire [10:0] REG_R10R3_COL_ADDR,
    input wire [8:3] REG_R26_H_SCROLL,
    input wire [2:0] REG_R27_H_SCROLL,
    input wire [7:0] PRAMDAT,
    output bit [17:0] PRAMADR,
    output wire [3:0] PCOLORCODE
);

  bit [17:0] FF_REQ_ADDR;
  reg [3:0] FF_COL_CODE;
  reg [7:0] FF_PAT_NUM;
  reg [7:0] FF_PRE_PAT_GEN;
  reg [7:0] FF_PRE_PAT_COL;
  reg [7:0] FF_PAT_GEN;
  reg [7:0] FF_PAT_COL;
  wire [17:0] REQ_PAT_NAME_TBL_ADDR;
  wire [17:0] REQ_PAT_GEN_TBL_ADDR;
  wire [17:0] REQ_PAT_COL_TBL_ADDR;
  reg [17:0] REQ_ADDR;
  wire COL_HL_SEL;
  wire [3:0] COL_CODE;
  reg [3:0] EIGHTDOTSTATE_DEC;
  wire [7:3] W_DOTCOUNTERX;

  assign W_DOTCOUNTERX = REG_R26_H_SCROLL[7:3] + DOTCOUNTERX[7:3];

  // ADDRESS DECODE
  assign REQ_PAT_NAME_TBL_ADDR = {REG_R2_PT_NAM_ADDR, DOTCOUNTERY[7:3], W_DOTCOUNTERX};
  assign REQ_PAT_GEN_TBL_ADDR = (VDPMODEGRAPHIC1 == 1'b1) ? {REG_R4_PT_GEN_ADDR,FF_PAT_NUM,DOTCOUNTERY[2:0]} : ({REG_R4_PT_GEN_ADDR[5:2],DOTCOUNTERY[7:6],FF_PAT_NUM,DOTCOUNTERY[2:0]}) & ({4'b1111,REG_R4_PT_GEN_ADDR[1:0],8'b11111111,3'b111});
  assign REQ_PAT_COL_TBL_ADDR = (VDPMODEMULTI == 1'b1 || VDPMODEMULTIQ == 1'b1) ? {REG_R4_PT_GEN_ADDR,FF_PAT_NUM,DOTCOUNTERY[4:2]} : (VDPMODEGRAPHIC1 == 1'b1) ? {REG_R10R3_COL_ADDR,1'b0,FF_PAT_NUM[7:3]} : ({REG_R10R3_COL_ADDR[10:7],DOTCOUNTERY[7:6],FF_PAT_NUM,DOTCOUNTERY[2:0]}) & ({4'b1111,REG_R10R3_COL_ADDR[6:0],6'b111111});

  // DRAM READ REQUEST
  always_comb begin
    case (EIGHTDOTSTATE)
      3'b000:  EIGHTDOTSTATE_DEC = 4'b0001;
      3'b001:  EIGHTDOTSTATE_DEC = 4'b0010;
      3'b010:  EIGHTDOTSTATE_DEC = 4'b0100;
      3'b011:  EIGHTDOTSTATE_DEC = 4'b1000;
      default: EIGHTDOTSTATE_DEC = 4'b0000;
    endcase
  end

  always_comb begin
    case (EIGHTDOTSTATE)
      3'b000:  REQ_ADDR = REQ_PAT_NAME_TBL_ADDR;
      3'b001:  REQ_ADDR = REQ_PAT_GEN_TBL_ADDR;
      3'b010:  REQ_ADDR = REQ_PAT_COL_TBL_ADDR;
      default: REQ_ADDR = FF_REQ_ADDR;
    endcase
  end

  // GENERATE PIXEL COLOR NUMBER
  assign COL_HL_SEL = (VDPMODEMULTI == 1'b1 || VDPMODEMULTIQ == 1'b1) ? ~EIGHTDOTSTATE[2] : FF_PAT_GEN[7];
  assign COL_CODE = (COL_HL_SEL == 1'b1) ? FF_PAT_COL[7:4] : FF_PAT_COL[3:0];

  // OUT ASSIGNMENT
  assign PRAMADR = FF_REQ_ADDR;
  assign PCOLORCODE = FF_COL_CODE;

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PAT_COL <= {8{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b00 && EIGHTDOTSTATE_DEC[0] == 1'b1)) begin
        FF_PAT_COL <= FF_PRE_PAT_COL;
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PAT_GEN <= {8{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b00 && EIGHTDOTSTATE_DEC[0] == 1'b1)) begin
        FF_PAT_GEN <= FF_PRE_PAT_GEN;
      end else if ((DOTSTATE == 2'b01)) begin
        FF_PAT_GEN <= {FF_PAT_GEN[6:0], 1'b0};
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PAT_NUM <= {8{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b01 && EIGHTDOTSTATE_DEC[1] == 1'b1)) begin
        FF_PAT_NUM <= PRAMDAT;
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PRE_PAT_GEN <= {8{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b01 && EIGHTDOTSTATE_DEC[2] == 1'b1)) begin
        FF_PRE_PAT_GEN <= PRAMDAT;
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_PRE_PAT_COL <= {8{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b01 && EIGHTDOTSTATE_DEC[3] == 1'b1)) begin
        FF_PRE_PAT_COL <= PRAMDAT;
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_COL_CODE <= {4{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b01)) begin
        FF_COL_CODE <= COL_CODE;
      end
    end
  end

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_REQ_ADDR <= {18{1'b0}};
    end else begin
      if ((DOTSTATE == 2'b11)) begin
        FF_REQ_ADDR <= REQ_ADDR;
      end
    end
  end


endmodule
