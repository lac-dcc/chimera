// This program was cloned from: https://github.com/SySS-Research/icestick-lpc-tpm-sniffer
// License: GNU General Public License v3.0

/*
 * iCEstick LPC TPM Sniffer (ringbuffer.v)
 * 
 * Ring buffer
 */

module ringbuffer #(parameter AW = 8, DW = 32)(
        input wire clk,
        input wire reset,
        input wire read_clk_enable,
        input wire write_clk_enable,
        input wire [DW-1:0] write_data,
        output reg [DW-1:0] read_data,
        output wire empty,
        output wire overflow
);

    // registers
	reg [AW-1:0] next_write_addr;
	reg [AW-1:0] read_addr;
	reg [AW-1:0] write_addr;

    // wires
	wire mem_read_clk_enable;
	wire mem_write_clk_enable;

    // combinatorial logic
	assign empty = read_addr == write_addr;
	assign overflow = next_write_addr == read_addr;
	assign mem_read_clk_enable = ~empty & read_clk_enable;
	assign mem_write_clk_enable = ~overflow & write_clk_enable;

    // synchronous logic
	always @(posedge clk or negedge reset)
    begin
		if (~reset)
        begin
			write_addr <= 0;
			next_write_addr <= 1;
		end
        else if (write_clk_enable)
            if (~overflow)
            begin
                write_addr <= write_addr + 1'b1;
                next_write_addr <= next_write_addr + 1'b1;
            end
	end

	always @(posedge clk or negedge reset)
    begin
		if (~reset) 
        begin
			read_addr <= 0;
		end
		else begin
			if (read_clk_enable)
				if (~empty)
					read_addr <= read_addr + 1'b1;
		end
	end

    // buffer 
	buffer #(.AW(AW), .DW(DW))
		MEM (
			.clk(clk),
			.write_clk_enable(mem_write_clk_enable),
			.write_data(write_data),
			.write_addr(write_addr),
			.read_clk_enable(mem_read_clk_enable),
			.read_data(read_data),
			.read_addr(read_addr)
        );

endmodule
