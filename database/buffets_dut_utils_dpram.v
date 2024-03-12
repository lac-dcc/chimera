// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



// Simple RAM File

module dpram (
				CLK,
				RESET,
				ARADDR,
				WADDR0,
				WVALID0,
				WADDR1,
				WVALID1,
				RDATA,
				WDATA0,
				WDATA1,
				RVALID,
				ARVALID
				);

parameter   ADDR_WIDTH  = 10;
parameter   DATA_WIDTH  = 64;
parameter   SEPARATE_WRITE_PORTS = 0;

localparam  SIZE        = 2 ** ADDR_WIDTH;

input 					CLK, RESET;
input [ADDR_WIDTH-1:0] 	ARADDR;
input [ADDR_WIDTH-1:0] 	WADDR0, WADDR1;
input 					ARVALID;
input 					WVALID0, WVALID1;
input [DATA_WIDTH-1:0]	WDATA0, WDATA1;

output reg [DATA_WIDTH-1:0]		RDATA;
output reg				        RVALID;

reg [DATA_WIDTH-1:0] memory [SIZE-1:0];

// Return the read data
always @(posedge CLK or negedge RESET) begin
	if(~RESET) begin
		RVALID <= 1'b0;
	end
	else begin
		RVALID 	<= (ARVALID)? 1'b1 : 1'b0;
	end
end

// read data
always @(posedge CLK) begin
	if(ARVALID)
        RDATA <= memory[ARADDR];
end

generate
    if(SEPARATE_WRITE_PORTS == 0) begin
        always @(posedge CLK) begin
            if(WVALID0) begin
                memory[WADDR0]	<= WDATA0;
            end
        end
    end
    else begin
        always @(posedge CLK) begin
            if(WVALID0) begin
                memory[WADDR0]	<= WDATA0;
            end
            if(WVALID1) begin
                memory[WADDR1]	<= WDATA1;
            end
        end
    end
endgenerate

endmodule
