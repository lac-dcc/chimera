// This program was cloned from: https://github.com/abnoname/iceZ0mb1e
// License: MIT License

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

module simpleuart_wrapper (
    input clk,
    input reset_n,
    output[7:0] data_out,
    input[7:0] data_in,
    input cs_n,
    input rd_n,
    input wr_n,
    input[2:0] addr,
    output tx,
    input rx
);

    wire read_sel = !cs_n & !rd_n & wr_n;
    wire write_sel = !cs_n & rd_n & !wr_n;

	reg[7:0] reg_status = 8'h0;
	reg[7:0] reg_command = 8'h0;
	reg[7:0] reg_data_wr = 8'h0;
	reg[7:0] reg_baudlow = 8'h0;
	reg[7:0] reg_baudhigh = 8'h0;
	wire[7:0] reg_data_rd;
	wire received;
	wire ready;

    reg[7:0] read_data;
    
	assign data_out = (read_sel) ? read_data : 8'b0;

    always @(*)
	begin
		case(addr)
			3'h0 : read_data = reg_status;
			3'h1 : read_data = reg_baudlow;
			3'h2 : read_data = reg_baudhigh;
			3'h3 : read_data = reg_command;
			3'h4 : read_data = reg_data_rd;
			3'h5 : read_data = reg_data_wr;
			default : read_data = 8'h00;
		endcase
	end
    
    always @(posedge clk)
    begin
        if ( write_sel ) begin
            case(addr)
				3'h1 : reg_baudlow <= data_in;
				3'h2 : reg_baudhigh <= data_in;
				3'h3 : reg_command <= data_in;
				3'h5 : reg_data_wr <= data_in;
            endcase
        end

        if ( read_sel ) begin
            if( addr == 3'h4 )begin
                reg_status[0] <= 1'b 0; // clear after read data
            end
        end
        if( received ) begin // is one clk active
            reg_status[0] <= 1'b 1;
        end

        reg_status[1] <= ready;
    end

    simpleuart uart (
        .clk        (clk),
	    .reset      (!reset_n),

        .baud_divider   ( {reg_baudhigh, reg_baudlow} ),

        .data_write (reg_data_wr),
        .transmit   (reg_command[0]),

        .data_read  (reg_data_rd),
        .received   (received),
        .ready      (ready),

        .tx         (tx),
        .rx         (rx)
    );

endmodule
