// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

/*
--------------------------------------------------------------------------------
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Library General Public
License as published by the Free Software Foundation; either
version 2 of the License, or (at your option) any later version.
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Library General Public License for more details.
You should have received a copy of the GNU Library General Public
License along with this library; if not, write to the
Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
Boston, MA  02110-1301, USA.
--------------------------------------------------------------------------------
*/


//------------------------------------------------------------------------------
//           Copyright (c) 2008 Alex Shovkoplyas, VE3NEA
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//           Copyright (c) 2013,2015 Phil Harman, VK6(A)PH 
//------------------------------------------------------------------------------

// 2013 Jan 26 - varcic now accepts 2...40 as decimation and CFIR
//               replaced with Polyphase FIR - VK6APH
// 2015 Apr 20 - cic now by Jeremy McDermond, NH6Z
//					- single polyphase FIR Filter
//      Jul 25 - add reset to CORDIC, CIC and FIR for Sync operation



module receiver2(
  input reset,
  input clock,                  //122.88 MHz
  input [31:0] frequency,
  input [15:0] sample_rate,
  output out_strobe,
  input signed [15:0] in_data,
  output signed [23:0] out_data_I,
  output signed [23:0] out_data_Q
  );

wire signed [21:0] cordic_outdata_I;
wire signed [21:0] cordic_outdata_Q;
reg [5:0] rate0, rate1;

//------------------------------------------------------------------------------
//                               cordic
//------------------------------------------------------------------------------

cordic cordic_inst(
  .reset(reset),
  .clock(clock),
  .in_data(in_data),             //16 bit 
  .frequency(frequency),         //32 bit
  .out_data_I(cordic_outdata_I), //22 bit
  .out_data_Q(cordic_outdata_Q)
  );

  
 
// Select CIC decimation rates based on sample_rate

	always @ (sample_rate)				
	begin 
		case (sample_rate)	
		 16'd48: begin rate0 <= 6'd40; rate1 <= 6'd32; end
		 16'd96: begin rate0 <= 6'd20; rate1 <= 6'd32; end		 
		16'd192: begin rate0 <= 6'd10; rate1 <= 6'd32; end		  
		16'd384: begin rate0 <= 6'd5;	 rate1 <= 6'd32; end	  
		16'd768: begin rate0 <= 6'd5;	 rate1 <= 6'd16; end	
	  16'd1536: begin rate0 <= 6'd5;	 rate1 <= 6'd8;  end
	  
		default: begin rate0 <= 6'd40; rate1 <= 6'd32; end
		endcase
	end 

  
// Receive CIC filters followed by FIR filter
wire decimA_avail, decimB_avail;
wire signed [17:0] decimA_real;
wire signed [17:0] decimA_imag;
wire signed [23:0] decimB_real, decimB_imag;

wire cic_outstrobe_2;
wire signed [23:0] cic_outdata_I2;
wire signed [23:0] cic_outdata_Q2;

//I channel
cic #(.STAGES(3), .MIN_DECIMATION(5), .MAX_DECIMATION(40), .IN_WIDTH(22), .OUT_WIDTH(18))
 cic_inst_I2(.reset(reset),
				 .decimation(rate0),
				 .clock(clock), 
				 .in_strobe(1'b1),
				 .out_strobe(decimA_avail),
				 .in_data(cordic_outdata_I),
				 .out_data(decimA_real)
				 );
				 
//Q channel
cic #(.STAGES(3), .MIN_DECIMATION(5), .MAX_DECIMATION(40), .IN_WIDTH(22), .OUT_WIDTH(18)) 
 cic_inst_Q2(.reset(reset),
				 .decimation(rate0),
				 .clock(clock), 
				 .in_strobe(1'b1),
				 .out_strobe(),
				 .in_data(cordic_outdata_Q),
				 .out_data(decimA_imag)
				 );			
			

wire cic_outstrobe_1;
wire signed [22:0] cic_outdata_I1;
wire signed [22:0] cic_outdata_Q1;


cic #(.STAGES(11), .MIN_DECIMATION(8), .MAX_DECIMATION(32), .IN_WIDTH(18), .OUT_WIDTH(24)) 
 varcic_inst_I1(.reset(reset),
				 .decimation(rate1),
				 .clock(clock), 
				 .in_strobe(decimA_avail),
				 .out_strobe(decimB_avail),
				 .in_data(decimA_real),
				 .out_data(decimB_real)
				 );
				 

//Q channel
cic #(.STAGES(11), .MIN_DECIMATION(8), .MAX_DECIMATION(32), .IN_WIDTH(18), .OUT_WIDTH(24)) 
 varcic_inst_Q1(.reset(reset),
				 .decimation(rate1),
				 .clock(clock), 
				 .in_strobe(decimA_avail),
				 .out_strobe(),
				 .in_data(decimA_imag),
				 .out_data(decimB_imag)
				 );
				 

wire signed [23:0]temp_out_I;
wire signed [23:0]temp_out_Q;	

// scale output level to full 24 bits. Multiply by 5. 

//assign out_data_I = 	(temp_out_I <<< 2) + (temp_out_I); 
//assign out_data_Q =  (temp_out_Q <<< 2) + (temp_out_Q); 	
			
// Polyphase decimate by 2 FIR Filter
firX2R2 fir3 (reset, clock, decimB_avail, decimB_real, decimB_imag, out_strobe, out_data_I, out_data_Q);


endmodule
