// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


//
module jelly_mul_add_dsp48e1
        #(
            parameter   A_WIDTH    = 25,
            parameter   B_WIDTH    = 18,
            parameter   C_WIDTH    = 48,
            parameter   P_WIDTH    = 48,
            parameter   M_WIDTH    = A_WIDTH + B_WIDTH,
            parameter   PC_WIDTH   = P_WIDTH >= 48 ? P_WIDTH : 48,
            
            parameter   OPMODEREG  = 1,
            parameter   ALUMODEREG = 1,
            parameter   AREG       = 2,
            parameter   BREG       = 2,
            parameter   CREG       = 1,
            parameter   MREG       = 1,
            parameter   PREG       = 1,
            
            parameter   USE_PCIN   = 0,
            parameter   USE_PCOUT  = 0,
            
            parameter   DEVICE     = "RTL" // "7SERIES"
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            cke_ctrl,
            input   wire                            cke_alumode,
            input   wire                            cke_a0,
            input   wire                            cke_a1,
            input   wire                            cke_b0,
            input   wire                            cke_b1,
            input   wire                            cke_c,
            input   wire                            cke_m,
            input   wire                            cke_p,
            
            input   wire                            op_load,
            input   wire                            alu_sub,
            
            input   wire    signed  [A_WIDTH-1:0]   a,
            input   wire    signed  [B_WIDTH-1:0]   b,
            input   wire    signed  [C_WIDTH-1:0]   c,
            output  wire    signed  [P_WIDTH-1:0]   p,
            
            input   wire    signed  [PC_WIDTH-1:0]  pcin,
            output  wire    signed  [PC_WIDTH-1:0]  pcout
        );
    
    // verilator lint_off WIDTH
    
    localparam CAN_USE_DSP48E1 = (((A_WIDTH <= 25) && (B_WIDTH <= 18)) || ((A_WIDTH <= 18) && (B_WIDTH <= 25))
                                    && (C_WIDTH <= 48) && (P_WIDTH <= 48) && (M_WIDTH <= 43));
    
    localparam SWAP_AB         = !((A_WIDTH <= 25) && (B_WIDTH <= 18));
    localparam DSP_A_WIDTH     = SWAP_AB ? 18 : 25;
    localparam DSP_B_WIDTH     = SWAP_AB ? 25 : 18;
        
    generate
    if ( CAN_USE_DSP48E1 && (DEVICE == "VIRTEX6" || DEVICE == "SPARTAN6" || DEVICE == "7SERIES") ) begin : blk_dsp48e1
        wire    signed  [DSP_A_WIDTH-1:0]   sig_a;
        wire    signed  [DSP_B_WIDTH-1:0]   sig_b;
        wire    signed  [47:0]              sig_c;
        wire    signed  [47:0]              sig_p;
        wire            [6:0]               sig_opmode;
        wire            [3:0]               sig_alumode;
        
        assign sig_a     = a;
        assign sig_b     = b;
        assign sig_c     = c;
        assign p         = sig_p;
        
        if ( USE_PCIN ) begin
            assign sig_opmode = 7'b001_01_01;
        end
        else begin
            assign sig_opmode[6:4] = {2'b01, op_load};
            assign sig_opmode[3:2] = 2'b01;
            assign sig_opmode[1:0] = 2'b01;
        end
        
        assign sig_alumode = {2'b00, alu_sub, alu_sub};
        
        DSP48E1
                #(
                    .A_INPUT            ("DIRECT"),
                    .B_INPUT            ("DIRECT"),
                    .USE_DPORT          ("FALSE"),
                    .USE_MULT           ("MULTIPLY"),
                    .USE_SIMD           ("ONE48"),
                    
                    .AUTORESET_PATDET   ("NO_RESET"),
                    .MASK               (48'h3fffffffffff),
                    .PATTERN            (48'h000000000000),
                    .SEL_MASK           ("MASK"),
                    .SEL_PATTERN        ("PATTERN"),
                    .USE_PATTERN_DETECT ("NO_PATDET"),
                    
                    .ACASCREG           (SWAP_AB ? BREG : AREG),
                    .ADREG              (0),
                    .ALUMODEREG         (ALUMODEREG),
                    .AREG               (SWAP_AB ? BREG : AREG),
                    .BCASCREG           (SWAP_AB ? AREG : BREG),
                    .BREG               (SWAP_AB ? AREG : BREG),
                    .CARRYINREG         (1),
                    .CARRYINSELREG      (1),
                    .CREG               (CREG),
                    .DREG               (0),
                    .INMODEREG          (0),
                    .MREG               (MREG),
                    .OPMODEREG          (OPMODEREG),
                    .PREG               (PREG)
                )
            i_dsp48e1
                (
                    .ACOUT              (),
                    .BCOUT              (),
                    .CARRYCASCOUT       (),
                    .MULTSIGNOUT        (),
                    .PCOUT              (pcout),
                    
                    .OVERFLOW           (),
                    .PATTERNBDETECT     (),
                    .PATTERNDETECT      (),
                    .UNDERFLOW          (),
                    
                    .CARRYOUT           (),
                    .P                  (sig_p),
                    
                    .ACIN               (),
                    .BCIN               (),
                    .CARRYCASCIN        (),
                    .MULTSIGNIN         (),
                    .PCIN               (pcin),
                    
                    .ALUMODE            (sig_alumode),
                    .CARRYINSEL         (3'b000),
                    .CLK                (clk),
                    .INMODE             (5'b00100),
                    .OPMODE             (sig_opmode),
                    
                    .A                  (SWAP_AB ? {5'b11111, sig_b} : {5'b11111, sig_a}),
                    .B                  (SWAP_AB ? sig_a : sig_b),
                    .C                  (sig_c),
                    .CARRYIN            (1'b0),
                    .D                  (25'd0),
                    
                    .CEA1               (SWAP_AB ? cke_b0 : cke_a0),
                    .CEA2               (SWAP_AB ? cke_b1 : cke_a1),
                    .CEAD               (1'b0),
                    .CEALUMODE          (cke_alumode),
                    .CEB1               (SWAP_AB ? cke_a0 : cke_b0),
                    .CEB2               (SWAP_AB ? cke_a1 : cke_b1),
                    .CEC                (cke_c),
                    .CECARRYIN          (1'b0),
                    .CECTRL             (cke_ctrl),
                    .CED                (1'b0),
                    .CEINMODE           (1'b0),
                    .CEM                (cke_m),
                    .CEP                (cke_p),
                    
                    .RSTA               (reset),
                    .RSTALLCARRYIN      (reset),
                    .RSTALUMODE         (reset),
                    .RSTB               (reset),
                    .RSTC               (reset),
                    .RSTCTRL            (reset),
                    .RSTD               (reset),
                    .RSTINMODE          (reset),
                    .RSTM               (reset),
                    .RSTP               (reset)
                );
    end
    else begin : blk_rtl
        
        // opmode
        wire    opmode_load;
        if ( OPMODEREG >= 1 ) begin : blk_opmode
            reg     reg_opmode_load;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_opmode_load <= 1'b0;
                end
                else if ( cke_ctrl ) begin
                    reg_opmode_load <= op_load;
                end
            end
            assign opmode_load = reg_opmode_load;
        end
        else begin
            assign opmode_load = op_load;
        end
        
        // alumode
        wire    alumode_sub;
        if ( ALUMODEREG >= 1 ) begin : blk_alumode
            reg     reg_alumode_sub;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_alumode_sub <= 1'b0;
                end
                else if ( cke_alumode ) begin
                    reg_alumode_sub <= alu_sub;
                end
            end
            assign alumode_sub = reg_alumode_sub;
        end
        else begin
            assign alumode_sub = alu_sub;
        end
        
        
        // a0
        wire    signed  [A_WIDTH-1:0]   a0;
        if ( AREG >= 2 ) begin : blk_a0
            reg     signed  [A_WIDTH-1:0]   reg_a0;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_a0 <= {A_WIDTH{1'b0}};
                end
                else if ( cke_a0 ) begin
                    reg_a0 <= a;
                end
            end
            assign a0 = reg_a0;
        end
        else begin
            assign a0 = a;
        end
        
        // a1
        wire    signed  [A_WIDTH-1:0]   a1;
        if ( AREG >= 1 ) begin : blk_a1
            reg     signed  [A_WIDTH-1:0]   reg_a1;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_a1 <= {A_WIDTH{1'b0}};
                end
                else if ( cke_a1 ) begin
                    reg_a1 <= a0;
                end
            end
            assign a1 = reg_a1;
        end
        else begin
            assign a1 = a0;
        end
        
        
        // b0
        wire    signed  [B_WIDTH-1:0]   b0;
        if ( BREG >= 2 ) begin : blk_b0
            reg     signed  [B_WIDTH-1:0]   reg_b0;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_b0 <= {B_WIDTH{1'b0}};
                end
                else if ( cke_b0 ) begin
                    reg_b0 <= b;
                end
            end
            assign b0 = reg_b0;
        end
        else begin
            assign b0 = b;
        end
        
        // b1
        wire    signed  [B_WIDTH-1:0]   b1;
        if ( BREG >= 1 ) begin : blk_b1
            reg     signed  [B_WIDTH-1:0]   reg_b1;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_b1 <= {B_WIDTH{1'b0}};
                end
                else if ( cke_b1 ) begin
                    reg_b1 <= b0;
                end
            end
            assign b1 = reg_b1;
        end
        else begin
            assign b1 = b0;
        end
        
        
        // c
        wire    signed  [C_WIDTH-1:0]   c0;
        if ( CREG >= 1 ) begin : blk_c
            reg     signed  [C_WIDTH-1:0]   reg_c0;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_c0 <= {C_WIDTH{1'b0}};
                end
                else if ( cke_c ) begin
                    reg_c0 <= c;
                end
            end
            assign c0 = reg_c0;
        end
        else begin
            assign c0 = c;
        end
        
        
        // m
        wire    signed  [M_WIDTH-1:0]   m0;
        if ( MREG >= 1 ) begin : blk_m
            reg     signed  [M_WIDTH-1:0]   reg_m0;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_m0 <= {M_WIDTH{1'b0}};
                end
                else if ( cke_m ) begin
                    reg_m0 <= a1 * b1;
                end
            end
            assign m0 = reg_m0;
        end
        else begin
            assign m0 = a1 * b1;
        end
        
        
        // p
        wire    signed  [P_WIDTH-1:0]   p0;
        if ( PREG >= 1 ) begin : blk_p
            reg     signed  [P_WIDTH-1:0]   reg_p0;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_p0 <= {P_WIDTH{1'b0}};
                end
                else if ( cke_p ) begin
                    if ( USE_PCIN ) begin
                        reg_p0 <= alumode_sub ? pcin - m0 : pcin + m0;
                    end
                    else begin
                        if ( opmode_load ) begin
                            reg_p0 <= alumode_sub ? c0 - m0 : c0 + m0;
                        end
                        else begin
                            reg_p0 <= alumode_sub ? p0 - m0 : p0 + m0;
                        end
                    end
                end
            end
            assign p0 = reg_p0;
        end
        else begin
            assign p0 = alumode_sub ? c0 - m0 : c0 + m0;
        end
        
        assign p     = p0;
        assign pcout = p0;
    end
    endgenerate
    
    // verilator lint_on WIDTH
    
endmodule


`default_nettype wire


// end of file
