//
// iceZ0mb1e - FPGA 8-Bit TV80 SoC for Lattice iCE40
// with complete open-source toolchain flow using yosys and SDCC
//
// Copyright (c) 2018 Franz Neumann (netinside2000@gmx.de)
//
// Permission is hereby granted, free of charge, to any person obtaining a 
// copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included 
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

module simpleio (
    input clk,
    input reset_n,
    output[7:0] data_out,
    input[7:0] data_in,
    input cs_n,
    input rd_n,
    input wr_n,
    input[1:0] addr,
    output[7:0] P1_out,
    input[7:0] P1_in,
    output P1_oen,
    output[7:0] P2_out,
    input[7:0] P2_in,
    output P2_oen
);
    `define MODE_WR 1'b0
    `define MODE_RD 1'b1
    reg[7:0] cfgreg;

    wire read_sel = !cs_n & !rd_n & wr_n;
    wire write_sel = !cs_n & rd_n & !wr_n;

    reg[7:0] out_1, out_2;
    reg[7:0] in_1, in_2;

    reg[7:0] read_data;

    assign P1_oen = (cfgreg[0] == `MODE_WR) ? 1'b1 : 1'b0;
    assign P2_oen = (cfgreg[1] == `MODE_WR) ? 1'b1 : 1'b0;
    assign P1_out = out_1;
    assign P2_out = out_2;

	assign data_out = (read_sel) ? read_data : 8'b0;

    always @(*)
	begin
		case(addr)
			2'h0 : read_data = ((cfgreg[0] == `MODE_RD) ? in_1 : out_1);
			3'h1 : read_data = ((cfgreg[1] == `MODE_RD) ? in_2 : out_2);
			default : read_data = 8'h00;
		endcase
	end

    always @(posedge clk)
    begin
        if ( write_sel ) begin
            case(addr)
                2'b00 : out_1 <= data_in;
                2'b01 : out_2 <= data_in;
                2'b10 : cfgreg <= data_in;
            endcase
        end
        in_1 <= P1_in;
        in_2 <= P2_in;
    end

endmodule
