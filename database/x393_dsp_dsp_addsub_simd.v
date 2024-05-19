// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dsp_addsub_simd
 * @file dsp_addsub_simd.v
 * @date 2016-06-05  
 * @author  Andrey Filippov
 *     
 * @brief SIMD adder/subtracter
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dsp_addsub_simd.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dsp_addsub_simd.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  dsp_addsub_simd#(
    parameter NUM_DATA =  2,   // Currently with INSTANTIATE_DSP48E1 should be 2
    parameter WIDTH =    24    // Currently with INSTANTIATE_DSP48E1 should be 24
)(
    input                          clk,
    input                          rst,
    input  [NUM_DATA * WIDTH -1:0] ain,
    input  [NUM_DATA * WIDTH -1:0] bin,
    input                          cea,      // load a registers
    input                          ceb,      // load b registers
    input                          subtract, // 0 - add, 1 - subtract
    input                          cep,      // load output registers
    output [NUM_DATA * WIDTH -1:0] pout);

`ifdef INSTANTIATE_DSP48E1
    wire [4:0] inmode = { 1'b1,  // ~selb,
                          1'b0,  // sub_d,
                          1'b0,  // seld,
                          1'b0,  // seld, // ~en_a,
                          1'b1}; // ~sela};
// No CIN in the middle of SIMD words!                          
//    wire [3:0] alumode = {2'b0,        // Z + X + Y + CIN  / -Z +( X + Y + CIN) -1
    wire [3:0] alumode = {2'b0,        // Z + X + Y + CIN  / Z -( X + Y + CIN)
                          subtract, // 1'b0,     
                          subtract};
    wire [6:0] opmode =  {3'b011, // Z = C-input
                          2'b00,  // Y = 0
                          2'b11}; // X = A:B
//    wire cryin = subtract;                      
                          
    DSP48E1 #(
        .ACASCREG            (1),
        .ADREG               (1),
        .ALUMODEREG          (1),
        .AREG                (1), // (1)
        .AUTORESET_PATDET    ("NO_RESET"),
        .A_INPUT             ("DIRECT"),
        .BCASCREG            (1),
        .BREG                (1), // (1)
        .B_INPUT             ("DIRECT"),
        .CARRYINREG          (1),
        .CARRYINSELREG       (1),
        .CREG                (1), //(1),
        .DREG                (1),
        .INMODEREG           (1),
        .IS_ALUMODE_INVERTED (4'b0),
        .IS_CARRYIN_INVERTED (1'b0),
        .IS_CLK_INVERTED     (1'b0),
        .IS_INMODE_INVERTED  (5'b0),
        .IS_OPMODE_INVERTED  (7'b0),
        .MASK                (48'hffffffffffff),
        .MREG                (0),
        .OPMODEREG           (1),
        .PATTERN             (48'h000000000000),
        .PREG                (1),
        .SEL_MASK            ("MASK"),
        .SEL_PATTERN         ("PATTERN"),
        .USE_DPORT           ("TRUE"), //("FALSE"),
        .USE_MULT            ("NONE"), //("MULTIPLY"),
        .USE_PATTERN_DETECT  ("NO_PATDET"),
        .USE_SIMD            ("TWO24") // ("ONE48")
    ) DSP48E1_i (
        .ACOUT          (),           // output[29:0] 
        .BCOUT          (),           // output[17:0] 
        .CARRYCASCOUT   (),           // output
        .CARRYOUT       (),           // output[3:0] 
        .MULTSIGNOUT    (),           // output
        .OVERFLOW       (),           // output
        .P              (pout),       // output[47:0] 
        .PATTERNBDETECT (),           // output
        .PATTERNDETECT  (),           // output
        .PCOUT          (),           // output[47:0] 
        .UNDERFLOW      (),           // output
        .A              (bin[47:18]), // input[29:0] 
        .ACIN           (30'b0),      // input[29:0] 
        .ALUMODE        (alumode),    // input[3:0] 
        .B              (bin[17:0]),  // input[17:0] 
        .BCIN           (18'b0),      // input[17:0] 
        .C              (ain),        // input[47:0] 
        .CARRYCASCIN    (1'b0),       // input
        .CARRYIN        (1'b0),       // cryin),      // input
        .CARRYINSEL     (3'h0),       // input[2:0] // later modify? 
        .CEA1           (1'b0),       // input
        .CEA2           (ceb),        // input
        .CEAD           (1'b0),       // input
        .CEALUMODE      (1'b1),       // input
        .CEB1           (1'b0),       // input
        .CEB2           (ceb),        // input
        .CEC            (cea),        // input
        .CECARRYIN      (1'b1),       // input
        .CECTRL         (1'b1),       // input
        .CED            (1'b0),       // input
        .CEINMODE       (1'b1),       // input
        .CEM            (1'b0),       // input
        .CEP            (cep),        // input
        .CLK            (clk),        // input
        .D              (25'h1ffffff),// input[24:0] 
        .INMODE         (inmode),     // input[4:0] 
        .MULTSIGNIN     (1'b0),       // input
        .OPMODE         (opmode),     // input[6:0] 
        .PCIN           (48'b0),      // input[47:0] 
        .RSTA           (rst),        // input
        .RSTALLCARRYIN  (rst),        // input
        .RSTALUMODE     (rst),        // input
        .RSTB           (rst),        // input
        .RSTC           (rst),        // input
        .RSTCTRL        (rst),        // input
        .RSTD           (1'b0),       // input
        .RSTINMODE      (rst),        // input
        .RSTM           (1'b0),        // input
        .RSTP           (rst)         // input
    );
`else
    reg    [NUM_DATA * WIDTH -1:0] a_reg;
    reg    [NUM_DATA * WIDTH -1:0] b_reg;
    reg    [NUM_DATA * WIDTH -1:0] p_reg;
    reg                            sub_r;
    wire   [NUM_DATA * WIDTH -1:0] p_w;
    assign pout = p_reg;                        

    generate
        genvar i;
        for (i = 0; i < 4; i = i+1) begin: byte_fifo_block
            assign p_w[WIDTH*i +: WIDTH] = a_reg[WIDTH*i +: WIDTH] + sub_r ? -b_reg[WIDTH*i +: WIDTH]  : b_reg[WIDTH*i +: WIDTH];
        end
    endgenerate            

    
    always @ (posedge clk) begin
        if      (rst) a_reg <= 0;
        else if (cea) a_reg <= ain;

        if      (rst) b_reg <= 0;
        else if (ceb) b_reg <= bin;
        
        sub_r <= subtract;
        
        if      (rst) p_reg <= 0;
        if      (cep) p_reg <= p_w;
    end
`endif
endmodule

