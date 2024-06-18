// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal

// TODO:
// ym6045c_cell_27_delay_short
// ym6045c_cell_33_delay_med
// ym6045c_cell_34_delay_long
//

// Module Definitions [It is possible to wrap here on your primitives]

module ym6045c_cell_1_not (  i2, o3);

	input wire i2;
	output wire o3;
	
	assign o3 = ~i2;

endmodule // ym6045c_cell_1_not

module ym6045c_cell_6_and (  o2, i3, i4);

	output wire o2;
	input wire i3;
	input wire i4;
	
	assign o2 = i3 & i4;

endmodule // ym6045c_cell_6_and

module ym6045c_cell_5_nand (  i1, i2, o3);

	input wire i1;
	input wire i2;
	output wire o3;
	
	assign o3 = ~(i1 & i2);

endmodule // ym6045c_cell_5_nand

module ym6045c_cell_7_buf (  o2, i3);

	output wire o2;
	input wire i3;
	
	assign o2 = i3;

endmodule // ym6045c_cell_7_buf

module ym6045c_cell_4_nand3 (  i1, i2, i3, o4);

	input wire i1;
	input wire i2;
	input wire i3;
	output wire o4;
	
	assign o4 = ~(i1 & i2 & i3);

endmodule // ym6045c_cell_4_nand3

module ym6045c_cell_16_buf (  o2, i4);

	output wire o2;
	input wire i4;
	
	assign o2 = i4;

endmodule // ym6045c_cell_16_buf

module ym6045c_cell_29_and6 (  o1, i2, i3, i4, i5, i6, i7);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;
	input wire i6;
	input wire i7;
	
	assign o1 = i2 & i3 & i4 & i5 & i6 & i7;

endmodule // ym6045c_cell_29_and6

module ym6045c_cell_30_nor4 (  o2, i3, i4, i5, i6);

	output wire o2;
	input wire i3;
	input wire i4;
	input wire i5;
	input wire i6;
	
	assign o2 = ~(i3 | i4 | i5 | i6);

endmodule // ym6045c_cell_30_nor4

module ym6045c_cell_19_and4 (  o1, i2, i3, i4, i5);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;
	
	assign o1 = i2 & i3 & i4 & i5;

endmodule // ym6045c_cell_19_and4

module ym6045c_cell_10_or (  i2, o3, i4);

	input wire i2;
	output wire o3;
	input wire i4;
	
	assign o3 = i2 | i4;

endmodule // ym6045c_cell_10_or

module ym6045c_cell_8_nor (  o1, i2, i3);

	output wire o1;
	input wire i2;
	input wire i3;
	
	assign o1 = ~(i2 | i3);

endmodule // ym6045c_cell_8_nor

module ym6045c_cell_18_or3 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	
	assign o1 = i2 | i3 | i4;

endmodule // ym6045c_cell_18_or3

module ym6045c_cell_3_nand4 (  i2h, i2l, i3h, i3l, o4);

	input wire i2h;
	input wire i2l;
	input wire i3h;
	input wire i3l;
	output wire o4;
	
	assign o4 = ~(i2h & i2l & i3h & i3l);

endmodule // ym6045c_cell_3_nand4

module ym6045c_cell_15_and3 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	
	assign o1 = i2 & i3 & i4;

endmodule // ym6045c_cell_15_and3

module ym6045c_cell_24_nand6 (  i1h, i1l, i2h, i2l, i4h, i4l, o7);

	input wire i1h;
	input wire i1l;
	input wire i2h;
	input wire i2l;
	input wire i4h;
	input wire i4l;
	output wire o7;
	
	assign o7 = ~(i1h & i1l & i2h & i2l & i4h & i4l);

endmodule // ym6045c_cell_24_nand6

module ym6045c_cell_21_or4 (  o1, i2, i3, i4, i5);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;
	
	assign o1 = i2 | i3 | i4 | i5;

endmodule // ym6045c_cell_21_or4

module ym6045c_cell_12_nor3 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	
	assign o1 = ~(i2 | i3 | i4);

endmodule // ym6045c_cell_12_nor3

module ym6045c_cell_22_mux4bit (  i1, o2, i6, i7, i8, i9, o11, o12, i13, i14, i15, i17, o19);

	input wire i1;
	output wire o2;
	input wire i6;
	input wire i7;
	input wire i8;
	input wire i9;
	output wire o11;
	output wire o12;
	input wire i13;
	input wire i14;
	input wire i15;
	input wire i17;
	output wire o19;
	
	assign o2 = i1 ? i7 : i6;
	assign o11 = i1 ? i9 : i8;
	assign o12 = i1 ? i13 : i14;
	assign o19 = i1 ? i17 : i15;

endmodule // ym6045c_cell_22_mux4bit

module ym6045c_cell_26_xnor (  i2, i4, o5);

	input wire i2;
	input wire i4;
	output wire o5;
	
	assign o5 = ~(i2 ^ i4);

endmodule // ym6045c_cell_26_xnor

module ym6045c_cell_28_mux (  i1, o2, i5, i6);

	input wire i1;
	output wire o2;
	input wire i5;
	input wire i6;
	
	assign o2 = i1 ? i6 : i5;

endmodule // ym6045c_cell_28_mux

module ym6045c_cell_36_or8 (  i1h, i1l, i2h, i2l, o3, i7h, i7l, i8h, i8l);

	input wire i1h;
	input wire i1l;
	input wire i2h;
	input wire i2l;
	output wire o3;
	input wire i7h;
	input wire i7l;
	input wire i8h;
	input wire i8l;
	
	assign o3 = i1h | i1l | i2h | i2l | i7h | i7l | i8h | i8l;

endmodule // ym6045c_cell_36_or8

module ym6045c_cell_25_dec2to4 (  i1, o2, o3, i6, o10, o11);

	input wire i1;
	output wire o2;
	output wire o3;
	input wire i6;
	output wire o10;
	output wire o11;
	
	assign o11 = ~i1 & ~i6;
	assign o3 = ~i1 & i6;
	assign o10 = i1 & ~i6;
	assign o2 = i1 & i6;

endmodule // ym6045c_cell_25_dec2to4

module ym6045c_cell_39_oai21 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	
	assign o1 = ~(i3 & (i2 | i4));

endmodule // ym6045c_cell_39_oai21

module ym6045c_cell_37_nor8 (  i1, i2, i3, i4, o5, i6, i7, i8, i9);

	input wire i1;
	input wire i2;
	input wire i3;
	input wire i4;
	output wire o5;
	input wire i6;
	input wire i7;
	input wire i8;
	input wire i9;
	
	assign o5 = ~(i1 | i2 | i3 | i4 | i6 | i7 | i8 | i9);

endmodule // ym6045c_cell_37_nor8

module ym6045c_cell_14_cnt_bit (  o2, o3, i6, i7, i13, i14, o15, i18);

	output wire o2;
	output wire o3;
	input wire i6;
	input wire i7;
	input wire i13;
	input wire i14;
	output wire o15;
	input wire i18;
	
	reg data;
	
	wire s = data ^ i18;
	assign o15 = data & i18;
	
	assign o2 = data;
	assign o3 = ~data;
	
	always @(posedge i6, negedge i7)
	begin
		if (~i7)
			data <= 1'h0;
		else if (~i14)
			data <= i13;
		else
			data <= s;
	end

endmodule // ym6045c_cell_14_cnt_bit

module ym6045c_cell_9_dffs (  i3, i4, i7, o11, o13);

	input wire i3;
	input wire i4;
	input wire i7;
	output wire o11;
	output wire o13;
	
	reg data;
	
	assign o13 = data;
	assign o11 = ~data;
	
	always @(posedge i3, negedge i7)
	begin
		if (~i7)
			data <= 1'h1;
		else
			data <= i4;
	end

endmodule // ym6045c_cell_9_dffs

module ym6045c_cell_2_dffr (  o2, o4, i9, i11, i13);

	output wire o2;
	output wire o4;
	input wire i9;
	input wire i11;
	input wire i13;
	
	reg data;
	
	assign o4 = data;
	assign o2 = ~data;
	
	always @(posedge i13, negedge i9)
	begin
		if (~i9)
			data <= 1'h0;
		else
			data <= i11;
	end

endmodule // ym6045c_cell_2_dffr

module ym6045c_cell_23_dff (  o2, o5, i10, i11);

	output wire o2;
	output wire o5;
	input wire i10;
	input wire i11;
	
	reg data;
	
	assign o5 = data;
	assign o2 = ~data;
	
	always @(posedge i11)
	begin
		data <= i10;
	end

endmodule // ym6045c_cell_23_dff

module ym6045c_cell_17_sr8 (  i2, o3, o10, o16, o23, o29, o36, o42, o49, i56, i57);

	input wire i2;
	output wire o3;
	output wire o10;
	output wire o16;
	output wire o23;
	output wire o29;
	output wire o36;
	output wire o42;
	output wire o49;
	input wire i56;
	input wire i57;
	
	reg [7:0] data;
	
	assign o3 = data[0];
	assign o10 = data[1];
	assign o16 = data[2];
	assign o23 = data[3];
	assign o29 = data[4];
	assign o36 = data[5];
	assign o42 = data[6];
	assign o49 = data[7];
	
	always @(posedge i57, negedge i2)
	begin
		if (~i2)
			data <= 8'h0;
		else
			data <= { i56, data[7:1] };
	end

endmodule // ym6045c_cell_17_sr8

module ym6045c_cell_38 (  o1, o2, i10, i12);

	output wire o1;
	output wire o2;
	input wire i10;
	input wire i12;
	
	reg data;
	
	assign o1 = data;
	assign o2 = ~data;
	
	always @(posedge i12, negedge i10)
	begin
		if (~i10)
			data <= 1'h0;
		else
			data <= ~data;
	end

endmodule // ym6045c_cell_38

module ym6045c_cell_31 (  i2, i3, i4, i13, o16, o17);

	input wire i2;
	input wire i3;
	input wire i4;
	input wire i13;
	output wire o16;
	output wire o17;
	
	reg data;
	assign o16 = data;
	assign o17 = ~data;
	
	always @(negedge i2, negedge i13)
	begin
		if (~i13)
			data <= 1'h0;
		else
			data <= ~(~(i3 | data) | (i4 & data));
	end

endmodule // ym6045c_cell_31

module ym6045c_cell_32 (  i1, o2);

	input wire i1;
	output wire o2;
	
	assign o2 = i1;

endmodule // ym6045c_cell_32

module ym6045c_cell_35_not (  o1, i2);

	output wire o1;
	input wire i2;
	
	assign o1 = ~i2;

endmodule // ym6045c_cell_35_not
