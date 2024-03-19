// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_demosaic_acpi_g_calc
        #(
            parameter   DATA_WIDTH = 10
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,

            input   wire    [1:0]                   param_phase,

            input   wire                            in_line_first,
            input   wire                            in_pixel_first,
            input   wire    [5*5*DATA_WIDTH-1:0]    in_raw,
            
            output  wire    [DATA_WIDTH-1:0]        out_raw,
            output  wire    [DATA_WIDTH-1:0]        out_g
        );
    
    
    // 計算用に余裕を持った幅を定義
    localparam      CALC_WIDTH = DATA_WIDTH + 6;
    
    wire    signed  [CALC_WIDTH-1:0]    max_value = {6'd0, {DATA_WIDTH{1'b1}}};
    wire    signed  [CALC_WIDTH-1:0]    min_value = {6'd0, {DATA_WIDTH{1'b0}}};
    
    function signed [CALC_WIDTH-1:0]    abs(input signed [CALC_WIDTH-1:0] a);
    begin
        abs = a >= 0 ? a : -a;
    end
    endfunction
    
    function signed [CALC_WIDTH-1:0]    absdiff(input signed [CALC_WIDTH-1:0] a, input signed [CALC_WIDTH-1:0] b);
    begin
        absdiff = a > b ? a - b : b - a;
    end
    endfunction
    
    
    wire    signed  [CALC_WIDTH-1:0]    in_raw11 = {6'd0, in_raw[(0*5+0)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw12 = {6'd0, in_raw[(0*5+1)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw13 = {6'd0, in_raw[(0*5+2)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw14 = {6'd0, in_raw[(0*5+3)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw15 = {6'd0, in_raw[(0*5+4)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw21 = {6'd0, in_raw[(1*5+0)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw22 = {6'd0, in_raw[(1*5+1)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw23 = {6'd0, in_raw[(1*5+2)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw24 = {6'd0, in_raw[(1*5+3)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw25 = {6'd0, in_raw[(1*5+4)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw31 = {6'd0, in_raw[(2*5+0)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw32 = {6'd0, in_raw[(2*5+1)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw33 = {6'd0, in_raw[(2*5+2)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw34 = {6'd0, in_raw[(2*5+3)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw35 = {6'd0, in_raw[(2*5+4)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw41 = {6'd0, in_raw[(3*5+0)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw42 = {6'd0, in_raw[(3*5+1)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw43 = {6'd0, in_raw[(3*5+2)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw44 = {6'd0, in_raw[(3*5+3)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw45 = {6'd0, in_raw[(3*5+4)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw51 = {6'd0, in_raw[(4*5+0)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw52 = {6'd0, in_raw[(4*5+1)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw53 = {6'd0, in_raw[(4*5+2)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw54 = {6'd0, in_raw[(4*5+3)*DATA_WIDTH +: DATA_WIDTH]};
    wire    signed  [CALC_WIDTH-1:0]    in_raw55 = {6'd0, in_raw[(4*5+4)*DATA_WIDTH +: DATA_WIDTH]};
    
    reg             [1:0]               reg_param_phase;

    reg             [1:0]               st0_phase;
    reg     signed  [CALC_WIDTH-1:0]    st0_raw;
    reg     signed  [CALC_WIDTH-1:0]    st0_a0;
    reg     signed  [CALC_WIDTH-1:0]    st0_a1;
    reg     signed  [CALC_WIDTH-1:0]    st0_b0;
    reg     signed  [CALC_WIDTH-1:0]    st0_b1;
    reg     signed  [CALC_WIDTH-1:0]    st0_v;
    reg     signed  [CALC_WIDTH-1:0]    st0_h;
    
    reg             [1:0]               st1_phase;
    reg     signed  [CALC_WIDTH-1:0]    st1_raw;
    reg     signed  [CALC_WIDTH-1:0]    st1_a0;
    reg     signed  [CALC_WIDTH-1:0]    st1_a1;
    reg     signed  [CALC_WIDTH-1:0]    st1_b0;
    reg     signed  [CALC_WIDTH-1:0]    st1_b1;
    reg     signed  [CALC_WIDTH-1:0]    st1_v;
    reg     signed  [CALC_WIDTH-1:0]    st1_h;
    
    reg             [1:0]               st2_phase;
    reg     signed  [CALC_WIDTH-1:0]    st2_raw;
    reg     signed  [CALC_WIDTH-1:0]    st2_a;
    reg     signed  [CALC_WIDTH-1:0]    st2_b;
    reg     signed  [CALC_WIDTH-1:0]    st2_v;
    reg     signed  [CALC_WIDTH-1:0]    st2_h;
    
    reg             [1:0]               st3_phase;
    reg     signed  [CALC_WIDTH-1:0]    st3_raw;
    reg     signed  [CALC_WIDTH-1:0]    st3_g0;
    reg     signed  [CALC_WIDTH-1:0]    st3_g1;
    
    reg             [1:0]               st4_phase;
    reg     signed  [CALC_WIDTH-1:0]    st4_raw;
    reg     signed  [CALC_WIDTH-1:0]    st4_g;
    
    reg             [1:0]               st5_phase;
    reg     signed  [CALC_WIDTH-1:0]    st5_raw;
    reg     signed  [CALC_WIDTH-1:0]    st5_g;

    reg             [1:0]               st6_phase;
    reg     signed  [CALC_WIDTH-1:0]    st6_raw;
    reg     signed  [CALC_WIDTH-1:0]    st6_g;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage 0
            st0_phase[0] <= ~st0_phase[0];
            if ( in_pixel_first ) begin
                if ( in_line_first ) begin
                    reg_param_phase <= param_phase;
                    st0_phase       <= param_phase;
                end
                else begin
                    st0_phase[0] <= reg_param_phase[0];
                    st0_phase[1] <= ~st0_phase[1];
                end
            end

            st0_raw <= in_raw33;
            st0_a0  <= in_raw13 + in_raw53;
            st0_a1  <= absdiff(in_raw23, in_raw43);
            st0_b0  <= in_raw31 + in_raw35;
            st0_b1  <= absdiff(in_raw32, in_raw34);
            st0_v   <= in_raw23 + in_raw43;
            st0_h   <= in_raw32 + in_raw34;
            

            // stage 1
            st1_phase <= st0_phase;
            st1_raw   <= st0_raw;
            st1_a0    <= st0_raw * 2 - st0_a0;
            st1_a1    <= st0_a1;
            st1_b0    <= st0_raw * 2 - st0_b0;
            st1_b1    <= st0_b1;
            st1_v     <= st0_v;
            st1_h     <= st0_h;
            
            // stage 2
            st2_phase <= st1_phase;
            st2_raw   <= st1_raw;
            st2_a     <= abs(st1_a0) + st1_a1;
            st2_b     <= abs(st1_b0) + st1_b1;
            st2_v     <= st1_v * 2 + st1_a0;
            st2_h     <= st1_h * 2 + st1_b0;
            
            // stage 3
            st3_phase <= st2_phase;
            st3_raw   <= st2_raw;
            st3_g0    <= (st2_a < st2_b ? st2_v : st2_h);
            st3_g1    <= (st2_a > st2_b ? st2_h : st2_v);
            
            // stage 4
            st4_phase <= st3_phase;
            st4_raw   <= st3_raw;
            st4_g     <= (st3_g0 + st3_g1) >>> 3;
            
            // stage 5
            st5_phase <= st4_phase;
            st5_raw   <= st4_raw;
            st5_g     <= st4_g;
            if ( st4_g < min_value ) begin st5_g <= min_value; end
            if ( st4_g > max_value ) begin st5_g <= max_value; end

            // stage 6
            st6_raw <= st5_raw;
            case ( st5_phase )
            2'b00:  begin st6_g <= st5_g;   end
            2'b01:  begin st6_g <= st5_raw; end
            2'b10:  begin st6_g <= st5_raw; end
            2'b11:  begin st6_g <= st5_g;   end
            endcase
        end
    end
    
    assign  out_raw  = st6_raw[DATA_WIDTH-1:0];
    assign  out_g    = st6_g  [DATA_WIDTH-1:0];
    
endmodule


`default_nettype wire


// end of file
