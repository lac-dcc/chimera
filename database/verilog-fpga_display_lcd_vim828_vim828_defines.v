// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`ifndef VIM828_DEFINES_VH
`define VIM828_DEFINES_VH

`define COM0 		19
`define COM1 		36
`define COM2 		18
`define COM3  		 1

`define SEG0_ABCP	20
`define SEG0__FED	16
`define SEG0_IJKN	17
`define SEG0_HGLM	21

`define SEG1_ABCP	22
`define SEG1__FED	14
`define SEG1_IJKN	15
`define SEG1_HGLM	23

`define SEG2_ABCP	24
`define SEG2__FED	12
`define SEG2_IJKN	13
`define SEG2_HGLM	25

`define SEG3_ABCP	26
`define SEG3__FED	10
`define SEG3_IJKN	11
`define SEG3_HGLM	27

`define SEG4_ABCP	28
`define SEG4__FED	 8
`define SEG4_IJKN	 9
`define SEG4_HGLM	29

`define SEG5_ABCP	30
`define SEG5__FED	 6
`define SEG5_IJKN	 7
`define SEG5_HGLM	31

`define SEG6_ABCP	32
`define SEG6__FED	 4
`define SEG6_IJKN	 5
`define SEG6_HGLM	33

`define SEG7_ABCP	34
`define SEG7__FED	 2
`define SEG7_IJKN	 3
`define SEG7_HGLM	35

`define BIT_A		 0
`define BIT_B		 1
`define BIT_C		 2
`define BIT_D		 3
`define BIT_E		 4
`define BIT_F		 5
`define BIT_G		 6
`define BIT_H		 7
`define BIT_I		 8
`define BIT_J		 9
`define BIT_K		10
`define BIT_L		11
`define BIT_M		12
`define BIT_N		13
`define BIT_P		14

`define COM_H_ACTIVE	2'd3
`define COM_H_PASSIVE	2'd1
`define SEG_H_ACTIVE	2'd0
`define SEG_H_PASSIVE	2'd2

`define COM_L_ACTIVE	2'd0
`define COM_L_PASSSIVE	2'd2
`define SEG_L_ACTIVE	2'd3
`define SEG_L_PASSIVE	2'd1

`endif // VIM828_DEFINES_VH
