// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** TTL 74139                                                                **
 **                                                                          **
 ** DUAL 2-LINE to 4-LINE DECODERS/DEMULTIPLEXERS                            **
 ** https://www.ti.com/lit/ds/symlink/sn54ls139a-sp.pdf?ts=1702906423213     **
 **                                                                          **
 *****************************************************************************/

module TTL_74139(
    input A1, B1,     // Decoder 1 inputs
    input G1_n,       // Decoder 1 enable, active low
    output Y1_0_n,    // Decoder 1 outputs, active low
    output Y1_1_n,
    output Y1_2_n,
    output Y1_3_n,
    input A2, B2,     // Decoder 2 inputs
    input G2_n,       // Decoder 2 enable, active low
    output Y2_0_n,    // Decoder 2 outputs, active low
    output Y2_1_n,
    output Y2_2_n,
    output Y2_3_n
);
   // DECODER 1

    // Check the enable signal and set outputs
    // When G_n is low, one output goes low based on the combination of B and A
    // When G_n is high, all outputs are high
    assign Y1_0_n = G1_n ? 1'b1 : ~((~B1) & (~A1));  // Y[0] is low when B=0, A=0
    assign Y1_1_n = G1_n ? 1'b1 : ~((~B1) & A1);     // Y[1] is low when B=0, A=1
    assign Y1_2_n = G1_n ? 1'b1 : ~(B1 & (~A1));     // Y[2] is low when B=1, A=0
    assign Y1_3_n = G1_n ? 1'b1 : ~(B1 & A1);        // Y[3] is low when B=1, A=1

   // DECODER 2   

    // Check the enable signal and set outputs
    // When G_n is low, one output goes low based on the combination of B and A
    // When G_n is high, all outputs are high
    assign Y2_0_n = G2_n ? 1'b1 : ~((~B2) & (~A2));  // Y[0] is low when B=0, A=0
    assign Y2_1_n = G2_n ? 1'b1 : ~((~B2) & A2);     // Y[1] is low when B=0, A=1
    assign Y2_2_n = G2_n ? 1'b1 : ~(B2 & (~A2));     // Y[2] is low when B=1, A=0
    assign Y2_3_n = G2_n ? 1'b1 : ~(B2 & A2);        // Y[3] is low when B=1, A=1


endmodule
