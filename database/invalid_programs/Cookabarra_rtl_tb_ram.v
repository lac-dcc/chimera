/*-------------------------------------------------------------------------
// Module:  ram
// File:    ram_2p.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: two ports ram, one port from lsu and the other for instruction
//              fetch
--------------------------------------------------------------------------*/

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`include "defines.v"

module ram(
    // data port
	input wire				      clk_i,
	input wire					  ce_i,
	input wire[`DataAddrBus]	  addr_i,
	input wire					  we_i,	
	input wire[3:0]				  sel_i,
	input wire[`DataBus]		  data_i,
	output wire                   rvalid_o,
	output reg[`DataBus]		  data_o,
	
	// instrution port
    input  wire                    inst_ce_i,
    input  wire[`InstAddrBus]      pc_i,
    output reg[`InstBus]           inst_o	
);
    localparam reg[31:0] CHAR_OUT_ADDR = 32'h00020000;
    localparam reg[31:0] SIM_CTRL_ADDR = 32'h00020002;

    reg[`InstBus]  mem[0:`InstMemNum-1];

    assign rvalid_o = ce_i & (~we_i);

    /*------------------ data port ----------------------*/
	always @ (posedge clk_i) begin
		if( (ce_i != `ChipDisable) && (we_i == `WriteEnable) )begin										
			if (sel_i[3] == 1'b1) begin
				mem[addr_i[`DataMemNumLog2+1:2]][31:24] <= data_i[31:24];
			end 
			
			if (sel_i[2] == 1'b1) begin
				mem[addr_i[`DataMemNumLog2+1:2]][23:16] <= data_i[23:16];
			end 
			
			if (sel_i[1] == 1'b1) begin
				mem[addr_i[`DataMemNumLog2+1:2]][15:8] <= data_i[15:8];
			end

			if (sel_i[0] == 1'b1) begin
				mem[addr_i[`DataMemNumLog2+1:2]][7:0] <= data_i[7:0];
			end	
		end		   	    
	end
	
	always @ (*) begin
		if (ce_i == `ChipDisable) begin
			data_o = `ZeroWord;
	    end else if(we_i == `WriteDisable) begin
		    data_o =  mem[addr_i[`DataMemNumLog2+1:2]];
		end else begin
			data_o = `ZeroWord;
		end
	end		

    /*------------------ instruction port ----------------------*/
    always @ (*) begin
        if (inst_ce_i == `ChipDisable) begin
            inst_o = `NOP_INST;
        end else begin
            inst_o = mem[pc_i[`DataMemNumLog2+1:2]];  // the instruction address was aligned by 4 bytes
        end
    end


    // Task for loading 'mem' with SystemVerilog system task $readmemh()
    export "DPI-C" task simutil_memload;

    task simutil_memload;
        input string file;
        $readmemh(file, mem);
    endtask

    // Function for setting a specific element in |mem|
    // Returns 1 (true) for success, 0 (false) for errors.
    export "DPI-C" function simutil_set_mem;

    function int simutil_set_mem(input int index, input bit [`InstBus] val);
        if (index >= `InstMemNum) begin
            return 0;
        end
        mem[index] = val;
        return 1;
    endfunction

    // Function for getting a specific element in |mem|
    export "DPI-C" function simutil_get_mem;

    function int simutil_get_mem(input int index, output bit [31:0] val);
        if (index >= `InstMemNum) begin
          return 0;
        end

        val = 0;
        val = mem[index];
        return 1;
    endfunction

endmodule
