//
// hps_ext for Minimig
//
// Copyright (c) 2020 Alexey Melnikov
//
// This source file is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
///////////////////////////////////////////////////////////////////////

// change this to only control the HD access and mux on the FPGA core and the IDE stuff to the Controller CPU - Mazamars

module hps_ext
(
	input             clk_sys,

	input             io_strobe,
	input             io_fpga,
	input             io_uio,
	input      [15:0] io_din,
	output     [15:0] io_dout,
	input      [15:0] fpga_dout,
	
	output reg        kbd_mouse_level,
	output reg  [1:0] kbd_mouse_type,
	output reg  [7:0] kbd_mouse_data,
	output reg 	[2:0] mouse_buttons,

	input      [15:0] ide_din,
	output reg [15:0] ide_dout,
	output reg  [4:0] ide_addr,
	output reg        ide_rd,
	output reg        ide_wr,
	input       [5:0] ide_req);


assign io_dout = io_fpga ? fpga_dout : io_dout_reg;

localparam EXT_CMD_MIN2 = 'h61;
localparam EXT_CMD_MAX2 = 'h63;

localparam UIO_MOUSE_BUTTONS  = 'h02;
localparam UIO_MOUSE_X   		= 'h03;
localparam UIO_MOUSE_Y   		= 'h04;
localparam UIO_KEYBOARD  		= 'h05;

localparam UIO_DMA_WRITE = 'h61;
localparam UIO_DMA_READ  = 'h62;
localparam UIO_DMA_SDIO  = 'h63;

	
reg [15:0] 	io_dout_reg;
reg        	dout_en;
reg  [4:0] 	byte_cnt;
reg [15:0] 	cmd;
reg 			ide_cs = 0;

always@(posedge clk_sys) begin
	{ide_rd, ide_wr} <= 0;
	if((ide_rd | ide_wr) & ~&ide_addr[3:0]) ide_addr <= ide_addr + 1'd1;

	if(~io_uio) begin
		dout_en <= 0;
		io_dout_reg <= 0;
		byte_cnt <= 0;
		ide_cs <= 0;
	end
	else if(io_strobe) begin

		io_dout_reg <= 0;
		if(~&byte_cnt) byte_cnt <= byte_cnt + 1'd1;

		ide_dout <= io_din;
		if(byte_cnt == 1) begin
			ide_addr <= {io_din[8],io_din[3:0]};
			ide_cs   <= (io_din[15:9] == 7'b1111000);
		end

		if(byte_cnt == 0) begin
			cmd <= io_din;
			dout_en <= (io_din >= UIO_DMA_WRITE && io_din <= UIO_DMA_SDIO || io_din >= UIO_MOUSE_X && io_din <= UIO_KEYBOARD );
			if(io_din == 'h63) io_dout_reg <= {4'hE, 2'b00, 2'b00, 2'b00, ide_req};
		end 
		else begin
			case(cmd)	
				UIO_MOUSE_BUTTONS: begin
					if(byte_cnt == 1) begin
						mouse_buttons <= io_din[2:0];
					end
				end
				UIO_MOUSE_X: begin
					if(byte_cnt == 1) begin
						kbd_mouse_data <= io_din[7:0];
						kbd_mouse_type <= 0;
						kbd_mouse_level <= ~kbd_mouse_level;
					end
				end
				UIO_MOUSE_Y: begin
					if(byte_cnt == 1) begin
						kbd_mouse_data <= io_din[7:0];
						kbd_mouse_type <= 1;
						kbd_mouse_level <= ~kbd_mouse_level; 
					end
				end

				UIO_KEYBOARD:
					if(byte_cnt == 1) begin
						kbd_mouse_data <= io_din[7:0];
						kbd_mouse_type <= 2;
						kbd_mouse_level <= ~kbd_mouse_level;
					end
				UIO_DMA_WRITE: if(byte_cnt >= 3 && ide_cs) begin
							ide_wr <= 1;
						end

				UIO_DMA_READ: if(byte_cnt >= 3 && ide_cs) begin
							io_dout_reg <= ide_din;
							ide_rd <= 1;
						end
			endcase
		end
	end
end

endmodule
