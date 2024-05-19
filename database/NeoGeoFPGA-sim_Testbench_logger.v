// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

// Sim only

module logger(
	input CLK_6MB,
	input nBNKB,
	input SHADOW,
	input COUNTER1, COUNTER2, LOCKOUT1, LOCKOUT2
);

	wire [6:0] LOG_VIDEO_R;
	wire [6:0] LOG_VIDEO_G;
	wire [6:0] LOG_VIDEO_B;
	
	reg [5:0] MARQUEE;
	reg [7:0] LED1;
	reg [7:0] LED2;

	integer sim_line;
	integer sim_frame;
	integer i;
	integer f_video;
	integer f_cab_io;
	integer f_ram;
	
	initial
	begin
		sim_line = 0;
		sim_frame = 0;
		f_video = $fopen("log_video.txt", "w");
		f_cab_io = $fopen("log_cab_io.txt", "w");
		
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		#500000000	// Run for 500ms
		
		// Save backup RAM contents
		f_ram = $fopen("raminit_sram_l.txt", "w");
		for (i = 0; i < 32768; i = i + 1)
			$fwrite (f_ram, "%x\n", neogeo.SRAM.SRAML.RAMDATA[i]);
		$fclose(f_ram);
		f_ram = $fopen("raminit_sram_u.txt", "w");
		for (i = 0; i < 32768; i = i + 1)
			$fwrite (f_ram, "%x\n", neogeo.SRAM.SRAMU.RAMDATA[i]);
		$fclose(f_ram);
		
		// Save memory card contents
		f_ram = $fopen("raminit_memcard.txt", "w");
		for (i = 0; i < 2048; i = i + 1)
			$fwrite (f_ram, "%x\n", testbench_1.MC.RAMDATA[i]);
		$fclose(f_ram);
		
		$fclose(f_video);
		$fclose(f_cab_io);
		$stop;
	end
	
	// Simulates MV-ELA board
	always @(negedge neogeo.LED_LATCH[0])
		MARQUEE <= neogeo.LED_DATA[5:0];
	
	// Simulates MV-LED boards
	always @(negedge neogeo.LED_LATCH[1])
		LED1 <= neogeo.LED_DATA;
	always @(negedge neogeo.LED_LATCH[2])
		LED2 <= neogeo.LED_DATA;
	
	assign LOG_VIDEO_R = nBNKB ? {~SHADOW, neogeo.PC[11:8], neogeo.PC[14], neogeo.PC[15]} : 7'b0000000;
	assign LOG_VIDEO_G = nBNKB ? {~SHADOW, neogeo.PC[7:4], neogeo.PC[13], neogeo.PC[15]} : 7'b0000000;
	assign LOG_VIDEO_B = nBNKB ? {~SHADOW, neogeo.PC[3:0], neogeo.PC[12], neogeo.PC[15]} : 7'b0000000;
	
	always @(posedge CLK_6MB)
	begin
		// Write each pixel
		// 0RRRRRRR 0GGGGGGG 0BBBBBBB
		$fwrite(f_video, "%06X ", {1'b0, LOG_VIDEO_R, 1'b0, LOG_VIDEO_G, 1'b0, LOG_VIDEO_B});

		if (neogeo.LSPC2.VS.PIXELC == 9'h0F0)
		begin
			$fwrite(f_video, "YYYYYY ");
			// $display("Line %d rendered", sim_line);
			if (neogeo.LSPC2.VS.RASTERC == 9'd263)
			begin
				sim_line = 0;
				$display("Frame %d rendered", sim_frame);
				
				// Write cab I/O data each frame
				// 000000MM MMMMCCKK LLLLLLLL llllllll
				$fwrite(f_cab_io, "%08X ", {MARQUEE, COUNTER1, COUNTER2, LOCKOUT1, LOCKOUT2, LED2, LED1});
				
				sim_frame = sim_frame + 1;
			end
			else
				sim_line = sim_line + 1;
		end
	end

endmodule
