// This program was cloned from: https://github.com/churchmice/secdec
// License: GNU General Public License v3.0

//***********************************************************************
//    Copyright (c) 2024 @freecity
//    All Rights Reserved.
//***********************************************************************
//-----------------------------------------------------------------------
// File:        cbb_ecc_dec.v
// Auther:      churchmice ( firefoxelectric@gmail.com )
// Created:     17:25:11, May 19, 2024
//-----------------------------------------------------------------------
// Abstract:    SECDED decoding logic
//
`ifndef __CBB_ECC_DEC__
`define __CBB_ECC_DEC__
module cbb_ecc_dec #(
    parameter   DW = 32,
    parameter   EW = 7      //shall set accordingly to the DW length
)(
    input   wire                clk,
    input   wire                rst_n,
    input   wire  [DW+EW-1:0]   din,
    output  reg  [DW-1:0]       dout,
    output  reg                 sec, //single error corrected
    output  reg                 ded  //double error detected
);
    wire [255:0] g_matrix [8:0];
    assign  g_matrix[00] = 256'b1010101011010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101101010101010101010101010101010101010101010101010101010101010101101010101010101010101010101010110101010101010110101011011;
    assign  g_matrix[01] = 256'b0011001101100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110110011001100110011001100110011001100110011001100110011001100110110011001100110011001100110011011001100110011011001101101;
    assign  g_matrix[02] = 256'b0011110001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000111100001111000011110000111100001111000011110000111100001111000111100001111000011110000111100011110000111100011110001110;
    assign  g_matrix[03] = 256'b1100000001111111100000000111111110000000011111111000000001111111100000000111111110000000011111111000000001111111100000000111111110000000111111110000000011111111000000001111111100000000111111110000000111111110000000011111111000000011111111000000011111110000;
    assign  g_matrix[04] = 256'b0000000001111111111111111000000000000000011111111111111110000000000000000111111111111111100000000000000001111111111111111000000000000000111111111111111100000000000000001111111111111111000000000000000111111111111111100000000000000011111111111111100000000000;
    assign  g_matrix[05] = 256'b0000000001111111111111111111111111111111100000000000000000000000000000000111111111111111111111111111111110000000000000000000000000000000111111111111111111111111111111110000000000000000000000000000000111111111111111111111111111111100000000000000000000000000;
    assign  g_matrix[06] = 256'b0000000001111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000;
    assign  g_matrix[07] = 256'b0000000001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    assign  g_matrix[08] = 256'b1111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

    wire [EW-1:0] ecc;
    assign  ecc = din[DW+:EW];

    //now calculate the syndrome
    wire [EW-2:0] syndrome;
    wire    parity;
    generate 
        for ( genvar g = 0 ; g < EW - 1 ; g ++ ) begin: gen_syndrome
            assign syndrome[g] = ^{ecc[g],din[0+:DW] & g_matrix[g][0+:DW] } ;
        end
    endgenerate
    assign  parity= ^din;

    wire  [DW+EW-1:0]   repair_bit;
    //checking whether the repair is done on the data bits
    generate
        for ( genvar g = 0 ; g < DW; g ++ ) begin: gen_repair_data
            reg [EW-2:0] mask;
            always @( * ) begin
                for ( int i = 0 ; i < EW-1; i ++ ) begin
                    mask[i] = g_matrix[i][g];
                end
            end
            assign repair_bit[g] = syndrome == mask;
        end
    endgenerate

    //checking whether the repair is done on the checking bit
    generate
        for ( genvar g = 0 ; g < EW -1 ;g ++ ) begin: gen_repair_parity
            assign  repair_bit[DW+g] = 1 << g;
        end
    endgenerate

    always @( posedge clk or negedge rst_n ) begin
        if ( ~rst_n ) begin
            dout    <= {DW{1'b0}};
            sec     <= 1'b0;
            ded     <= 1'b0;
        end
        else begin
            dout    <= din[0+:DW] ^ repair_bit[0+:DW];
            //1. parity is ok, it means there are two bits error
            //2. or the syndrome is non-zero but can't be associated with a certain repair location
            ded     <= ( ~parity | ~|repair_bit ) & (|syndrome);
            sec     <= parity & (|repair_bit );
        end
    end
endmodule 
`endif
//-----------------------------------------------------------------------
// Local Variables:
// verilog-library-directories:()
// End:

