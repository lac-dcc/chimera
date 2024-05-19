// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 *  dsp_ma
 * @file dsp_ma.v
 * @date 2016-06-05  
 * @author  Andrey Filippov
 *     
 * @brief DSP with multi-input multiplier and accumulator
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * dsp_ma.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * dsp_ma.v is distributed in the hope that it will be useful,
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

module  dsp_ma #(
    parameter B_WIDTH = 18,
    parameter A_WIDTH = 25,
    parameter P_WIDTH = 48)
(
    input                       clk,
    input                       rst,
    input  signed [B_WIDTH-1:0] bin,
    input                       ceb1,     // load b1 register
    input                       ceb2,     // load b2 register
    input                       selb,     // 0 - select b1, 1 - select b2
    input  signed [A_WIDTH-1:0] ain,
    input                       cea1,
    input                       cea2,
    input  signed [A_WIDTH-1:0] din,
    input                       ced,
    input                       sela,     // 0 - select a1, 1 - select a2
    input                       seld,     // 0 - select a1/a2, 1 - select d
    input                       neg_m,    // 1 - negate multiplier result
    input                       accum,    // 0 - use multiplier result, 1 add to accumulator
    output signed [P_WIDTH-1:0] pout
);
`ifdef INSTANTIATE_DSP48E1
    wire [4:0] inmode = {~selb,
                          1'b0, // sub_d,
                          seld,
                          seld, // ~en_a,
                         ~sela};
    wire [3:0] alumode = {2'b0,
                          neg_m,
                          neg_m};
    wire [6:0] opmode =  {1'b0,
                          accum,
                          1'b0,
                          2'b01,
                          2'b01};
    DSP48E1 #(
        .ACASCREG            (1),
        .ADREG               (0), // (1),
        .ALUMODEREG          (1),
        .AREG                (1), // (2), // (1)  - means number in series, so "2" always reads the second
        .AUTORESET_PATDET    ("NO_RESET"),
        .A_INPUT             ("DIRECT"),
        .BCASCREG            (1),
        .BREG                (1), // (2), // (1)  - means number in series, so "2" always reads the second
        .B_INPUT             ("DIRECT"),
        .CARRYINREG          (1),
        .CARRYINSELREG       (1),
        .CREG                (0), //(1),
        .DREG                (1),
        .INMODEREG           (1),
        .IS_ALUMODE_INVERTED (4'b0),
        .IS_CARRYIN_INVERTED (1'b0),
        .IS_CLK_INVERTED     (1'b0),
        .IS_INMODE_INVERTED  (5'b0),
        .IS_OPMODE_INVERTED  (7'b0),
        .MASK                (48'hffffffffffff),
        .MREG                (1),
        .OPMODEREG           (1),
        .PATTERN             (48'h000000000000),
        .PREG                (1),
        .SEL_MASK            ("MASK"),
        .SEL_PATTERN         ("PATTERN"),
        .USE_DPORT           ("TRUE"), //("FALSE"),
        .USE_MULT            ("MULTIPLY"),
        .USE_PATTERN_DETECT  ("NO_PATDET"),
        .USE_SIMD            ("ONE48")
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
        .A              ({{30-A_WIDTH{ain[A_WIDTH-1]}}, ain}), // input[29:0] 
        .ACIN           (30'b0),      // input[29:0] 
        .ALUMODE        (alumode),    // input[3:0] 
        .B              (bin),        // input[17:0] 
        .BCIN           (18'b0),      // input[17:0] 
        .C              (48'hffffffffffff), // input[47:0] 
        .CARRYCASCIN    (1'b0),       // input
        .CARRYIN        (1'b0),       // input
        .CARRYINSEL     (3'h0),       // input[2:0] // later modify? 
        .CEA1           (cea1),       // input
        .CEA2           (cea2),       // input
        .CEAD           (1'b0),       // input
        .CEALUMODE      (1'b1),       // input
        .CEB1           (ceb1),       // input
        .CEB2           (ceb2),       // input
        .CEC            (1'b0),       // input
        .CECARRYIN      (1'b0),       // input
        .CECTRL         (1'b1),       // input
        .CED            (ced),        // input
        .CEINMODE       (1'b1),       // input
        .CEM            (1'b1),       // input
        .CEP            (1'b1),       // input
        .CLK            (clk),        // input
        .D              (din),        // input[24:0] 
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
        .RSTD           (rst),        // input
        .RSTINMODE      (rst),        // input
        .RSTM           (rst),        // input
        .RSTP           (rst)        // input
    );
`else
// Will try to make it infer DSP48e1
    reg  signed [B_WIDTH-1:0] b1_reg;
    reg  signed [B_WIDTH-1:0] b2_reg;
    reg  signed [A_WIDTH-1:0] a1_reg;
    reg  signed [A_WIDTH-1:0] a2_reg;
    reg  signed [A_WIDTH-1:0] d_reg;
    reg  signed [P_WIDTH-1:0] m_reg;
    reg  signed [P_WIDTH-1:0] p_reg;
    wire signed [A_WIDTH+B_WIDTH-1:0] m_wire;
    wire signed [B_WIDTH-1:0] b_wire;
    wire signed [A_WIDTH-1:0] a_wire;
    reg                       selb_r;
    reg                       sela_r;
    reg                       seld_r;
    reg                       neg_m_r;
    reg                       accum_r;

    wire signed [P_WIDTH-1:0] m_reg_pm;            
    wire signed [P_WIDTH-1:0] p_reg_cond;            
    
    
    assign pout = p_reg;
    assign b_wire = selb_r ? b2_reg : b1_reg;
    assign a_wire = seld_r ? d_reg : (sela_r ? a2_reg : a1_reg);
    assign m_wire = a_wire * b_wire;
    
    assign m_reg_pm =   neg_m_r ? - m_reg : m_reg;  
    assign p_reg_cond = accum_r ? p_reg : 0;  
    
    always @ (posedge clk) begin
        if      (rst)  b1_reg <= 0;
        else if (ceb1) b1_reg <= bin;
        
        if      (rst)  b2_reg <= 0;
        else if (ceb2) b2_reg <= bin;
        
        if      (rst)  a1_reg <= 0;
        else if (cea1) a1_reg <= ain;
        
        if      (rst)  a2_reg <= 0;
        else if (cea2) a2_reg <= ain;
        
        if      (rst)  d_reg <= 0;
        else if (ced)  d_reg <= din;
        
        selb_r <= selb;
        sela_r <= sela;
        seld_r <= seld;
        neg_m_r <= neg_m;
        accum_r <= accum;
        
        m_reg <= {{P_WIDTH - A_WIDTH - B_WIDTH{1'b0}}, m_wire};
        
        p_reg <= p_reg_cond + m_reg_pm;
        
    end
`endif
endmodule

