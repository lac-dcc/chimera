/*
 * File: barrel_shifter.v
 * Project: rtl
 * File Created: Sunday, 5th August 2018 9:03:57 am
 * Author: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Last Modified: Sunday, 5th August 2018 9:12:40 am
 * Modified By: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Copyright (c) 2018 - Chen Rui
 * All rights reserved.
 */
module barrel_shifter
	(
		data_in,
		shift_number_in,
		data_after_shift_out
	);

input	[31 : 0]			data_in;
input	[4 : 0]				shift_number_in;
output	reg	[31 : 0]		data_after_shift_out;

always@(*)
	case(shift_number_in)
		5'b0_0000:	data_after_shift_out	<=	 data_in;
		5'b0_0001:	data_after_shift_out	<=	{data_in[31 - 1  : 0], data_in[31 : 31  - 1  + 1]};
		5'b0_0010:	data_after_shift_out	<=	{data_in[31 - 2  : 0], data_in[31 : 31  - 2  + 1]};
		5'b0_0011:	data_after_shift_out	<=	{data_in[31 - 3  : 0], data_in[31 : 31  - 3  + 1]};
		5'b0_0100:	data_after_shift_out	<=	{data_in[31 - 4  : 0], data_in[31 : 31  - 4  + 1]};
		5'b0_0101:	data_after_shift_out	<=	{data_in[31 - 5  : 0], data_in[31 : 31  - 5  + 1]};
		5'b0_0110:	data_after_shift_out	<=	{data_in[31 - 6  : 0], data_in[31 : 31  - 6  + 1]};
		5'b0_0111:	data_after_shift_out	<=	{data_in[31 - 7  : 0], data_in[31 : 31  - 7  + 1]};
		5'b0_1000:	data_after_shift_out	<=	{data_in[31 - 8  : 0], data_in[31 : 31  - 8  + 1]};
		5'b0_1001:	data_after_shift_out	<=	{data_in[31 - 9  : 0], data_in[31 : 31  - 9  + 1]};
		5'b0_1010:	data_after_shift_out	<=	{data_in[31 - 10 : 0], data_in[31 : 31  - 10 + 1]};
		5'b0_1011:	data_after_shift_out	<=	{data_in[31 - 11 : 0], data_in[31 : 31  - 11 + 1]};
		5'b0_1100:	data_after_shift_out	<=	{data_in[31 - 12 : 0], data_in[31 : 31  - 12 + 1]};
		5'b0_1101:	data_after_shift_out	<=	{data_in[31 - 13 : 0], data_in[31 : 31  - 13 + 1]};
		5'b0_1110:	data_after_shift_out	<=	{data_in[31 - 14 : 0], data_in[31 : 31  - 14 + 1]};
		5'b0_1111:	data_after_shift_out	<=	{data_in[31 - 15 : 0], data_in[31 : 31  - 15 + 1]};
		5'b1_0000:	data_after_shift_out	<=	{data_in[31 - 16 : 0], data_in[31 : 31  - 16 + 1]};
		5'b1_0001:	data_after_shift_out	<=	{data_in[31 - 17 : 0], data_in[31 : 31  - 17 + 1]};
		5'b1_0010:	data_after_shift_out	<=	{data_in[31 - 18 : 0], data_in[31 : 31  - 18 + 1]};
		5'b1_0011:	data_after_shift_out	<=	{data_in[31 - 19 : 0], data_in[31 : 31  - 19 + 1]};
		5'b1_0100:	data_after_shift_out	<=	{data_in[31 - 20 : 0], data_in[31 : 31  - 20 + 1]};
		5'b1_0101:	data_after_shift_out	<=	{data_in[31 - 21 : 0], data_in[31 : 31  - 21 + 1]};
		5'b1_0110:	data_after_shift_out	<=	{data_in[31 - 22 : 0], data_in[31 : 31  - 22 + 1]};
		5'b1_0111:	data_after_shift_out	<=	{data_in[31 - 23 : 0], data_in[31 : 31  - 23 + 1]};
		5'b1_1000:	data_after_shift_out	<=	{data_in[31 - 24 : 0], data_in[31 : 31  - 24 + 1]};
		5'b1_1001:	data_after_shift_out	<=	{data_in[31 - 25 : 0], data_in[31 : 31  - 25 + 1]};
		5'b1_1010:	data_after_shift_out	<=	{data_in[31 - 26 : 0], data_in[31 : 31  - 26 + 1]};
		5'b1_1011:	data_after_shift_out	<=	{data_in[31 - 27 : 0], data_in[31 : 31  - 27 + 1]};
		5'b1_1100:	data_after_shift_out	<=	{data_in[31 - 28 : 0], data_in[31 : 31  - 28 + 1]};
		5'b1_1101:	data_after_shift_out	<=	{data_in[31 - 29 : 0], data_in[31 : 31  - 29 + 1]};
		5'b1_1110:	data_after_shift_out	<=	{data_in[31 - 30 : 0], data_in[31 : 31  - 30 + 1]};
		5'b1_1111:	data_after_shift_out	<=	{data_in[31 - 31 : 0], data_in[31 : 31  - 31 + 1]}; 
	endcase

endmodule	