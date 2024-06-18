// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.
    
    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 27-10-2016
    */


//  Pipeline operator

module jt51_op(
    `ifdef TEST_SUPPORT
    input               test_eg,
    input               test_op0,
    `endif
    input               rst,
    input               clk,
    input               cen,            // P1
    input       [9:0]   pg_phase_X,
    input       [2:0]   con_I,
    input       [2:0]   fb_II,
    // volume
    input       [9:0]   eg_atten_XI,
    // modulation
    input               use_prevprev1,
    input               use_internal_x,
    input               use_internal_y,    
    input               use_prev2,
    input               use_prev1,
    input               test_214,
    
    input               m1_enters,
    input               c1_enters,
    `ifdef SIMULATION
    input               zero,
    `endif
    // output data
    output signed   [13:0]  op_XVII
);

/*  enters  exits
    m1      c1
    m2      S4
    c1      m1
    S4      m2
*/

wire signed [13:0] prev1, prevprev1, prev2;

jt51_sh #( .width(14), .stages(8)) prev1_buffer(
    .rst    ( rst   ),
    .clk    ( clk   ),
    .cen    ( cen   ),
    .din    ( c1_enters ? op_XVII : prev1 ),
    .drop   ( prev1 )
);

jt51_sh #( .width(14), .stages(8)) prevprev1_buffer(
    .rst    ( rst   ),
    .clk    ( clk   ),
    .cen    ( cen   ),
    .din    ( c1_enters ? prev1 : prevprev1 ),
    .drop   ( prevprev1 )
);

jt51_sh #( .width(14), .stages(8)) prev2_buffer(
    .rst    ( rst   ),
    .clk    ( clk   ),
    .cen    ( cen   ),
    .din    ( m1_enters ? op_XVII : prev2 ),
    .drop   ( prev2 )
);

// REGISTER/CYCLE 1
// Creation of phase modulation (FM) feedback signal, before shifting
reg [13:0]  x,  y;
reg [14:0]  xs, ys, pm_preshift_II;
reg         m1_II;

always @(*) begin
    x  = ( {14{use_prevprev1}}  & prevprev1 ) |
          ( {14{use_internal_x}} & op_XVII ) |
          ( {14{use_prev2}}      & prev2 );
    y  = ( {14{use_prev1}}      & prev1 ) |
          ( {14{use_internal_y}} & op_XVII );
    xs = { x[13], x }; // sign-extend
    ys = { y[13], y }; // sign-extend
end

always @(posedge clk) if(cen) begin
    pm_preshift_II <= xs + ys; // carry is discarded
    m1_II <= m1_enters;
end

/* REGISTER/CYCLE 2-7 (also YM2612 extra cycles 1-6)
   Shifting of FM feedback signal, adding phase from PG to FM phase
   In YM2203, phasemod_II is not registered at all, it is latched on the first edge 
   in add_pg_phase and the second edge is the output of add_pg_phase. In the YM2612, there
   are 6 cycles worth of registers between the generated (non-registered) phasemod_II signal
   and the input to add_pg_phase.     */

reg  [9:0]  phasemod_II;
wire [9:0]  phasemod_X;

always @(*) begin
    // Shift FM feedback signal
    if (!m1_II ) // Not m1
        phasemod_II = pm_preshift_II[10:1]; // Bit 0 of pm_preshift_II is never used
    else // m1
        case( fb_II )
            3'd0: phasemod_II = 10'd0;      
            3'd1: phasemod_II = { {4{pm_preshift_II[14]}}, pm_preshift_II[14:9] };
            3'd2: phasemod_II = { {3{pm_preshift_II[14]}}, pm_preshift_II[14:8] };
            3'd3: phasemod_II = { {2{pm_preshift_II[14]}}, pm_preshift_II[14:7] };
            3'd4: phasemod_II = {    pm_preshift_II[14],   pm_preshift_II[14:6] };
            3'd5: phasemod_II = pm_preshift_II[14:5];
            3'd6: phasemod_II = pm_preshift_II[13:4];
            3'd7: phasemod_II = pm_preshift_II[12:3];
            default: phasemod_II = 10'dx;
        endcase
end

// REGISTER/CYCLE 2-9
jt51_sh #( .width(10), .stages(8)) phasemod_sh(
    .rst    ( rst           ),
    .clk    ( clk           ),
    .cen    ( cen           ),
    .din    ( phasemod_II   ),
    .drop   ( phasemod_X    )
);


// REGISTER/CYCLE 10
reg [ 9:0]  phase;
// Sets the maximum number of fanouts for a register or combinational
// cell.  The Quartus II software will replicate the cell and split
// the fanouts among the duplicates until the fanout of each cell
// is below the maximum.

reg [ 7:0]  phaselo_XI, aux_X;
reg signbit_X;

always @(*) begin
    phase   = phasemod_X + pg_phase_X;
    aux_X   = phase[7:0] ^ {8{~phase[8]}};
    signbit_X = phase[9];
end

always @(posedge clk) if(cen) begin    
    phaselo_XI <= aux_X;
end

wire [45:0] sta_XI;

jt51_phrom u_phrom(
    .clk    ( clk       ),
    .cen    ( cen       ),
    .addr   ( aux_X[5:1]),
    .ph     ( sta_XI    )
);

// REGISTER/CYCLE 11
// Sine table    
// Main sine table body
reg [18:0]  stb;
reg [10:0]  stf, stg;
reg [11:0]  logsin;
reg [10:0]  subtresult;
reg [11:0]  atten_internal_XI;

always @(*) begin
    //sta_XI = sinetable[ phaselo_XI[5:1] ];
    // 2-bit row chooser
    case( phaselo_XI[7:6] )
        2'b00: stb = { 10'b0, sta_XI[29], sta_XI[25], 2'b0, sta_XI[18], 
            sta_XI[14], 1'b0, sta_XI[7] , sta_XI[3] };
        2'b01: stb = { 6'b0 , sta_XI[37], sta_XI[34], 2'b0, sta_XI[28], 
            sta_XI[24], 2'b0, sta_XI[17], sta_XI[13], sta_XI[10], sta_XI[6], sta_XI[2] };
        2'b10: stb = { 2'b0, sta_XI[43], sta_XI[41], 2'b0, sta_XI[36],
            sta_XI[33], 2'b0, sta_XI[27], sta_XI[23], 1'b0, sta_XI[20],
            sta_XI[16], sta_XI[12], sta_XI[9], sta_XI[5], sta_XI[1] };
        2'b11: stb = {
              sta_XI[45], sta_XI[44], sta_XI[42], sta_XI[40]
            , sta_XI[39], sta_XI[38], sta_XI[35], sta_XI[32]
            , sta_XI[31], sta_XI[30], sta_XI[26], sta_XI[22]
            , sta_XI[21], sta_XI[19], sta_XI[15], sta_XI[11]
            , sta_XI[8], sta_XI[4], sta_XI[0] };
        default: stb = 19'dx;
    endcase
    // Fixed value to sum
    stf = { stb[18:15], stb[12:11], stb[8:7], stb[4:3], stb[0] };
    // Gated value to sum; bit 14 is indeed used twice
    if( phaselo_XI[0] )
        stg = { 2'b0, stb[14], stb[14:13], stb[10:9], stb[6:5], stb[2:1] };
    else
        stg = 11'd0;
    // Sum to produce final logsin value
    logsin = stf + stg; // Carry-out of 11-bit addition becomes 12th bit
    // Invert-subtract logsin value from EG attenuation value, with inverted carry
    // In the actual chip, the output of the above logsin sum is already inverted.
    // The two LSBs go through inverters (so they're non-inverted); the eg_atten_XI signal goes through inverters.
    // The adder is normal except the carry-in is 1. It's a 10-bit adder.
    // The outputs are inverted outputs, including the carry bit.
    //subtresult = not (('0' & not eg_atten_XI) - ('1' & logsin([11:2])));
    // After a little pencil-and-paper, turns out this is equivalent to a regular adder!
    subtresult = eg_atten_XI + logsin[11:2];
    // Place all but carry bit into result; also two LSBs of logsin
    // If addition overflowed, make it the largest value (saturate)
    atten_internal_XI = { subtresult[9:0], logsin[1:0] } | {12{subtresult[10]}};
end


// Register cycle 12
// Exponential table
wire [44:0] exp_XII;
reg  [11:0] totalatten_XII;
reg  [12:0] etb;
reg  [ 9:0] etf;
reg  [ 2:0] etg;

jt51_exprom u_exprom(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .addr   ( atten_internal_XI[5:1] ),
    .exp    ( exp_XII       )
);

always @(posedge clk) if(cen) begin
    totalatten_XII <= atten_internal_XI;
end

//wire [1:0] et_sel  = totalatten_XII[7:6];
//wire [4:0] et_fine = totalatten_XII[5:1];

// Main sine table body
always @(*) begin    
    // 2-bit row chooser    
    case( totalatten_XII[7:6] )
        2'b00: begin
                etf = { 1'b1, exp_XII[44:36]  };
                etg = { 1'b1, exp_XII[35:34] };             
            end
        2'b01: begin
                etf = exp_XII[33:24];
                etg = { 2'b10, exp_XII[23] };               
            end
        2'b10: begin
                etf = { 1'b0, exp_XII[22:14]  };
                etg = exp_XII[13:11];               
            end
        2'b11: begin
                etf = { 2'b00, exp_XII[10:3]  };
                etg = exp_XII[2:0];
            end
    endcase 
end

reg [9:0]   mantissa_XIII;
reg [3:0]   exponent_XIII;

always @(posedge clk) if(cen) begin
    //RESULT
    mantissa_XIII <= etf + { 7'd0, totalatten_XII[0] ? 3'd0 : etg }; //carry-out discarded
    exponent_XIII <= totalatten_XII[11:8];
end

// REGISTER/CYCLE 13
// Introduce test bit as MSB, 2's complement & Carry-out discarded
reg [12:0]  shifter, shifter_2, shifter_3;

always @(*) begin    
    // Floating-point to integer, and incorporating sign bit
    // Two-stage shifting of mantissa_XIII by exponent_XIII
    shifter = { 3'b001, mantissa_XIII };
    case( ~exponent_XIII[1:0] )
        2'b00: shifter_2 = { 1'b0, shifter[12:1] }; // LSB discarded
        2'b01: shifter_2 = shifter;
        2'b10: shifter_2 = { shifter[11:0], 1'b0 };
        2'b11: shifter_2 = { shifter[10:0], 2'b0 };
    endcase
    case( ~exponent_XIII[3:2] )
        2'b00: shifter_3 = {12'b0, shifter_2[12]   };
        2'b01: shifter_3 = { 8'b0, shifter_2[12:8] };
        2'b10: shifter_3 = { 4'b0, shifter_2[12:4] };
        2'b11: shifter_3 = shifter_2;
    endcase
end

reg signed [13:0] op_XIII;
wire signbit_XIII;

always @(*) begin
    op_XIII = ({ test_214, shifter_3 } ^ {14{signbit_XIII}}) + {13'd0, signbit_XIII};               
end

jt51_sh #( .width(14), .stages(4)) out_padding(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( op_XIII   ), // note op_XIII was not latched, is a comb output
    .drop   ( op_XVII   )
);

jt51_sh #( .width(1), .stages(3)) shsignbit(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( signbit_X ),
    .drop   ( signbit_XIII  )
);

/////////////////// Debug
`ifdef JT51_DEBUG
`ifdef SIMULATION
/* verilator lint_off PINMISSING */
wire [4:0] cnt;

sep32_cnt u_sep32_cnt (.clk(clk), .cen(cen), .zero(zero), .cnt(cnt));

sep32 #(.width(14),.stg(17)) sep_op(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( op_XVII       ),
    .cnt    ( cnt           )
    );
/* verilator lint_on PINMISSING */
`endif
`endif

endmodule
