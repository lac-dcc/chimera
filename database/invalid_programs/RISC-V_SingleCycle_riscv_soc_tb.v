/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 ****************** Original test module. Do not Modify! ******************

 */

`timescale 1ps/1ps
`include "riscv.v"
`include "inst_mem.v"
`include "data_mem.v"

module riscv_soc_tb();

  reg     clk;
  reg     rst;
  
       
  initial begin
	clk = 1'b0;
	forever #50 clk = ~clk;
  end
      
  initial begin
            rst = 1'b1;
    #300    rst= 1'b0;
    #100000 $display("---     result is %d         ---\n",verify);
	#1000   $stop;   
  end
       
  wire[31:0] inst_addr;
  wire[31:0] inst;
  wire 		 inst_ce;

  wire       data_ce;
  wire       data_we;
  wire[31:0] data_addr;
  wire[31:0] wdata;
  wire[31:0] rdata; 
  wire[31:0] verify; 
 

 	riscv riscv0(
		.clk(clk),
		.rst(rst),
	
		.inst_addr_o(inst_addr),
		.inst_i(inst),
		.inst_ce_o(inst_ce),

		.data_ce_o(data_ce),	
		.data_we_o(data_we),
		.data_addr_o(data_addr),
		.data_i(rdata),
		.data_o(wdata)		
	);
	
	inst_mem inst_mem0(
		.ce(inst_ce),
		.addr(inst_addr),
		.inst(inst)	
	);

	data_mem data_mem0(
		.clk(clk),
		.ce(data_ce),
		.we(data_we),
		.addr(data_addr),
		.data_i(wdata),
		.data_o(rdata),
		.verify(verify)
	);

    endmodule