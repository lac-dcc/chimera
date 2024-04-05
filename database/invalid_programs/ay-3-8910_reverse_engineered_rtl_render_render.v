// (c) 2019 lvd

// Testbench that could be used to render AY music (in .psg format) into sound files.
// Compile this file with definitions:
//
//  +define+PSG_FILE="path/to/psg.file"
//  +define+DUMP_FILES="path/to/temporary/dump.files"
//
// The result will be dump.files_a, dump.files_b and dump.files_c files,
// each containing single AY channel, unsigned 16bit little-endian values,
// written at clk/8 rate (i.e. no resampling is done).

/*  This file is part of AY-3-8910 restoration and preservation project.

    AY-3-8910 restoration and preservation project is free software: you
    can redistribute it and/or modify it under the terms of the
    GNU General Public License as published by the Free Software Foundation,
    either version 3 of the License, or (at your option) any later version.

    AY-3-8910 restoration and preservation project is distributed in the
    hope that it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
    PURPOSE. See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
*/


`timescale 1ns/10ps

// AY clock timing
`define HALF_CLK (285.71) /* 280 ns => 1.75 MHz */

// access timing (Z80 at 3.5MHz)
`define PRE_ACC  (`HALF_CLK)
`define ACT_ACC  (`HALF_CLK*2.5)
`define POST_ACC (`HALF_CLK*0.5)


import Psg::*;
import SaveChan::*;


module render;

	reg clk;
	reg rst_n;

	reg bdir,bc2,bc1;

	reg [7:0] da_out;
	reg       da_oe;

	wire [7:0] da;

	reg a8,_a9;

	wire [3:0] cha,chb,chc;
	wire [15:0] val_a_pre, val_b_pre, val_c_pre;

	reg [15:0] val_a, val_b, val_c;




	save_chan a,b,c;



	reg frame_sync = 1'b0;

	int frame_counter=0;

	wire sound_clk;




	// bus output
	assign da = da_oe ? da_out : 8'hZZ;



	initial
	begin
		clk = 1'b1;
		forever
		begin
			#(`HALF_CLK);
			clk = ~clk;
		end
	end

	initial
	begin
		rst_n = 1'b0;
		repeat(128) @(negedge clk);
		rst_n <= 1'b1;
	end

	initial
		{bdir,bc2,bc1} <= 3'b000; // inactive








	// frame counter
	always @(posedge clk)
	if( !rst_n )
	begin
		frame_sync = 1'b0;
		frame_counter = 0;
	end
	else
	begin
		frame_counter++;
		if( frame_counter>=(71680/2) )
		begin
			frame_counter = 0;

			frame_sync = 1;
			#0.01;
			frame_sync = 0;
		end
	end



	initial
	begin : render_sequence

		psg_dump dump;
		psg_regs regs;
		int i,j;
		int size;
	
		int prev_frames=0;

		
		dump = new;
		dump.load_psg(`PSG_FILE);

		size = dump.dump.size();

		$display("%d frames",size);

		for(i=0;i<size;i++)
		begin
			@(posedge frame_sync);

			regs = dump.dump[i];

			for(j=0;j<16;j++)
			begin
				if( regs.update[j] )
				begin
					set_reg(6'h30,j[3:0]);
					wr_reg(regs.value[j]);
				end
			end


			if( (i-prev_frames)>=50 )
			begin
				prev_frames=i;

				$display("frames: %d/%5d, time: min:sec: %3d:%02d",i,size,i/3000,(i/50)%60);
			end
		end

		@(posedge frame_sync);

		a.finish();
		b.finish();
		c.finish();

		$stop;
	end




	initial
	begin : save_files

		a = new;
		b = new;
		c = new;
	
		a.open_file({`DUMP_FILES,"_a"});
		b.open_file({`DUMP_FILES,"_b"});
		c.open_file({`DUMP_FILES,"_c"});
	end


	always @(posedge sound_clk)
	if( rst_n )
	begin
		a.add_data(val_a);
		b.add_data(val_b);
		c.add_data(val_c);
	end




	ay_model ay_model
	(
		.clk (clk  ),
		._rst(rst_n),

		.da(da),

		.bdir(bdir),
		.bc1 (bc1 ),
		.bc2 (bc2 ),

		. a8( a8),
		._a9(_a9),

		.ioa(),
		.iob(),

		.test1(),
		.test2(1'b0),

		.ch_a(cha),
		.ch_b(chb),
		.ch_c(chc)
	);




	// exponentiate outputs
	aytab channel_a ( .in(cha), .out(val_a_pre) );
	aytab channel_b ( .in(chb), .out(val_b_pre) );
	aytab channel_c ( .in(chc), .out(val_c_pre) );

	// register outputs
	assign sound_clk = ay_model.f1;


	always @(posedge sound_clk)
	begin
		val_a <= val_a_pre;
		val_b <= val_b_pre;
		val_c <= val_c_pre;
	end




	
	
	
	task set_reg;
		input [5:0] chip_addr;
		input [3:0] reg_addr;
		
		begin
			int a;
                        
			_a9 <= ~chip_addr[5];
			a8  <=  chip_addr[4];
                        
			da_oe <= 1'b1;
                        
			da_out[7:4] <= chip_addr[3:0];
			da_out[3:0] <= reg_addr;
                        
			#(`PRE_ACC);
                        
			a=$random();
			while( !(a&32'hC000_0000) )
				a=$random();
                        
			case((a>>30)&3)
			2'd1: {bdir,bc2,bc1} <= 3'b100;
			2'd2: {bdir,bc2,bc1} <= 3'b111;
			2'd3: {bdir,bc2,bc1} <= 3'b001;
			endcase
                        
			#(`ACT_ACC);
                        
			{bdir,bc2,bc1} <= 3'b000;
                        
			#(`POST_ACC);
                        
			da_oe <= 1'b0;
		end
	endtask

	task wr_reg;
		input [7:0] indata;

		begin
			da_oe <= 1'b1;
			da_out <= indata;

			#(`PRE_ACC);

			{bdir,bc2,bc1} <= 3'b110;

			#(`ACT_ACC);

			{bdir,bc2,bc1} <= 3'b000;

			#(`POST_ACC);

			da_oe <= 1'b0;
		end
	endtask

	task rd_reg;
		output [7:0] outdata;

		begin
			da_oe <= 1'b0;

			#(`PRE_ACC);

			{bdir,bc2,bc1} <= 3'b011;

			#(`ACT_ACC);

			outdata = da;
			{bdir,bc2,bc1} <= 3'b000;

			#(`POST_ACC);
		end
	endtask




endmodule

