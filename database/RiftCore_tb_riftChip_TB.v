// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: riftChip_TB
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-05 17:03:49
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-18 14:33:37
*/

/*
  Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


`timescale 1 ns / 1 ps
`include "iverilog.vh"
`include "define.vh"


module riftChip_TB (

);


	reg CLK;
	reg RSTn;


riftChip s_riftChip(

	.CLK(CLK),
	.RSTn(RSTn)
);



initial begin


	CLK = 0;
	RSTn = 0;

	#20

	RSTn <= 1;

	#160000
			$display("Time Out !!!");
	$stop;
end


initial begin
	forever
	begin 
		 #5 CLK <= ~CLK;
	end
end




`define SRAM s_riftChip.i_axi_full_slv_sram.i_sram


`define RGF   s_riftChip.i_riftCore.i_backEnd.i_phyRegister.regFileX_qout
`define INDEX s_riftChip.i_riftCore.i_backEnd.i_phyRegister.archi_X_qout[`RB*3 +: `RB]




	localparam DP = 2**14;
	integer i, by;

		reg [7:0] mem [0:200000];
		initial begin
			$readmemh("./ci/rv64ui-p-simple.verilog", mem);
			for ( i = 0; i < DP; i = i + 1 ) begin
				for ( by = 0; by < 8; by = by + 1 ) begin
					if ( | mem[i*8+by] ) begin
						`SRAM.ram[i][8*by +: 8] = mem[i*8+by];
					end
					else begin
						`SRAM.ram[i][8*by +: 8] = 8'h0;
					end
				end

				// $display("ITCM %h: %h,%h", i*4,`SRAM_ODD.ram[i],`SRAM_EVE.ram[i]);
			end

		end 


	wire [63:0] x3 = `RGF[(3*`RP+`INDEX)*64 +: 64];
	wire isEcall = s_riftChip.i_riftCore.i_backEnd.i_commit.isEcall;

always @(negedge CLK)begin 
	if (isEcall) begin
		if ( x3 == 64'd1 ) begin
			$display("PASS");
			$finish;
		end
		else begin
			$display("Fail");
			$stop;
		end



	end

end









initial
begin
	$dumpfile("./build/wave.vcd"); //生成的vcd文件名称
	$dumpvars(0, riftChip_TB);//tb模块名称
end

endmodule


