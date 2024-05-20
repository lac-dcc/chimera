// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

//
//  converted from vdp_doublebuf.vhd
//    Double Buffered Line Memory.
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
//
///////////////////////////////////////////////////////////////////////////////
//
// Line buffer module with double buffering function
// Used for up scan conversion by vdp_vga.v
//

module vdp_double_buffer (
    input bit clk,
    input bit [9:0] x_position_wr,
    input bit [9:0] x_position_rd,
    input bit even_odd,
    input bit [5:0] data_red_in,
    input bit [5:0] data_green_in,
    input bit [5:0] data_blue_in,
    output bit [5:0] data_red_out,
    output bit [5:0] data_green_out,
    output bit [5:0] data_blue_out
);

  bit wr_even;
  bit wr_odd;
  bit [9:0] address_even;
  bit [9:0] address_odd;
  bit [5:0] out_red_even;
  bit [5:0] out_green_even;
  bit [5:0] out_blue_even;
  bit [5:0] out_red_odd;
  bit [5:0] out_green_odd;
  bit [5:0] out_blue_odd;

  assign wr_even = ~even_odd;
  assign wr_odd = even_odd;

  assign address_even = (!even_odd) ? x_position_wr : x_position_rd;
  assign address_odd = (even_odd) ? x_position_wr : x_position_rd;

  assign data_red_out = (even_odd) ? out_red_even : out_red_odd;
  assign data_green_out = (even_odd) ? out_green_even : out_green_odd;
  assign data_blue_out = (even_odd) ? out_blue_even : out_blue_odd;

  vdp_line_buffer buf_red_even (
      .address(address_even),
      .clk(clk),
      .wr(wr_even),
      .data_in(data_red_in),
      .data_out(out_red_even)
  );

  vdp_line_buffer buf_green_even (
      .address(address_even),
      .clk(clk),
      .wr(wr_even),
      .data_in(data_green_in),
      .data_out(out_green_even)
  );

  vdp_line_buffer buf_blue_even (
      .address(address_even),
      .clk(clk),
      .wr(wr_even),
      .data_in(data_blue_in),
      .data_out(out_blue_even)
  );

  vdp_line_buffer buf_red_odd (
      .address(address_odd),
      .clk(clk),
      .wr(wr_odd),
      .data_in(data_red_in),
      .data_out(out_red_odd)
  );

  vdp_line_buffer buf_green_odd (
      .address(address_odd),
      .clk(clk),
      .wr(wr_odd),
      .data_in(data_green_in),
      .data_out(out_green_odd)
  );

  vdp_line_buffer buf_blue_odd (
      .address(address_odd),
      .clk(clk),
      .wr(wr_odd),
      .data_in(data_blue_in),
      .data_out(out_blue_odd)
  );

endmodule
