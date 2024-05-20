// This program was cloned from: https://github.com/kir486680/tt6_neurocore
// License: Apache License 2.0

`define DIMENSION 4
`define M_W 10
`define EXP_W 5
`define BIT_W 16
`define MULT_W `M_W+`M_W+2
`define EXP_MAX 2**(`EXP_W-1)+2**(`EXP_W)-3
`define PE_W 4
`define PE_H 4


`define DATA_W 16
`define A_M 2 // dimension 0 of A matrix
`define A_P 5  // dimension 1 of A matrix
`define B_P 5 // dimension 0 of B matrix
`define B_N 2 // dimension 1 of B matrix
`define J 2 //row max dim of the systolic mlutiplier 
`define K 2 //col max dim of the systolic mlutiplier