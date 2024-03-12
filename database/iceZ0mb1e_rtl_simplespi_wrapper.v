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

module simplespi_wrapper (
    input clk,
    input reset_n,
    output[7:0] data_out,
    input[7:0] data_in,
    input cs_n,
    input rd_n,
    input wr_n,
    input[2:0] addr,
    output sclk,
	output mosi,
	input  miso,
    output cs
);

    wire read_sel = !cs_n & !rd_n & wr_n;
    wire write_sel = !cs_n & rd_n & !wr_n;

	wire[7:0] reg_status;
	reg[7:0] reg_config = 8'h0;
	reg[7:0] reg_command = 8'h0;
	reg[7:0] reg_data_wr = 8'h0;
	reg[7:0] reg_clockdiv = 8'h0;
	wire[7:0] reg_data_rd;
	wire req_next;

    reg[7:0] read_data;
    reg      err;
    
	assign data_out = (read_sel) ? read_data : 8'b0;
	assign reg_status = {6'b0, err, req_next};

    always @(*)
	begin
		case(addr)
			3'h0 : read_data = reg_status;
			3'h1 : read_data = reg_config;
			3'h2 : read_data = reg_clockdiv;
			3'h3 : read_data = reg_command;
			3'h4 : read_data = reg_data_rd;
			3'h5 : read_data = reg_data_wr;
			default : read_data = 8'h00;
		endcase
	end

    always @(posedge clk)
    begin
        if (write_sel) begin
            err <= ~reg_status[0];
        end
    end
    
    
    always @(posedge clk)
    begin
        if ( write_sel ) begin
            case(addr)
				3'h1 : reg_config <= data_in;
				3'h2 : reg_clockdiv <= data_in;
				3'h3 : reg_command <= data_in;
				3'h5 : reg_data_wr <= data_in;
            endcase
        end

		if( reg_command[0] == 1'b1 ) begin
			reg_command[0] <= 1'b0;
		end
    end

	wire spi_clk_en;

	clk_enable spi_clk_divider (
		.reset(!reset_n),
		.divider({ 8'h 00, reg_clockdiv}), //f=12E6/12=1MHz => div=12/2
		.clk_in(clk),
		.clk_en(spi_clk_en)
	);

	simplespi master (
		.clk			(clk),
		.clk_spi_en		(spi_clk_en),
		.reset			(!reset_n),

		.req_next		(req_next),

		.start			(reg_command[0]),
		.finish			(reg_command[1]),

		.CPOL			(reg_config[1]),
		.CPHA			(reg_config[0]),

		.data_write		(reg_data_wr),
		.data_read		(reg_data_rd),

		.sclk			(sclk),
		.mosi			(mosi),
		.miso			(miso),
		.cs				(cs)
	);

endmodule
