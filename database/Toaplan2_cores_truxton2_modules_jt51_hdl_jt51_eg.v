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


module jt51_eg(
    `ifdef TEST_SUPPORT
    input               test_eg,
    `endif
    input               rst,
    input               clk,
    input               cen,
    input               zero,
    // envelope configuration
    input       [4:0]   keycode_III,
    input       [4:0]   arate_II,
    input       [4:0]   rate1_II,
    input       [4:0]   rate2_II,
    input       [3:0]   rrate_II,
    input       [3:0]   d1l_I,
    input       [1:0]   ks_III,
    // envelope operation
    input               keyon_II,
    output  reg         pg_rst_III,
    // envelope number
    input       [6:0]   tl_VII,
    input       [7:0]   am,
    input       [1:0]   ams_VII,
    input               amsen_VII,
    output      [9:0]   eg_XI
);

 // eg[9:6] -> direct attenuation (divide by 2)
        // eg[5:0] -> mantisa attenuation (uses LUT)
        // 1 LSB of eg is -0.09257 dB

localparam ATTACK=2'd0,
           DECAY1=2'd1,
           DECAY2=2'd2,
           RELEASE=2'd3;

reg     [ 4:0]  d1level_II;
reg     [ 2:0]  cnt_V;
reg     [ 5:0]  rate_IV;
wire    [ 9:0]  eg_VI;
reg     [ 9:0]  eg_VII, eg_VIII;
wire    [ 9:0]  eg_II;
reg     [11:0]  sum_eg_tl_VII;

reg     step_V, step_VI;
reg     sum_up;
reg     [5:0]   rate_V;
reg     [5:1]   rate_VI;

// remember: { log_msb, pow_addr } <= log_val[11:0] + { tl, 5'd0 } + { eg, 2'd0 };

reg     [ 1:0]  eg_cnt_base;
reg     [14:0]  eg_cnt;

reg     [ 9:0]  am_final_VII;

always @(posedge clk) begin : envelope_counter
    if( rst ) begin
        eg_cnt_base <= 2'd0;
        eg_cnt      <=15'd0;
    end
    else if(cen) begin
        if( zero ) begin
            // envelope counter increases every 3 output samples,
            // there is one sample every 32 clock ticks
            if( eg_cnt_base == 2'd2 ) begin
                eg_cnt      <= eg_cnt + 1'b1;
                eg_cnt_base <= 2'd0;
            end
            else eg_cnt_base <= eg_cnt_base + 1'b1;
        end
    end
end

wire            cnt_out; // = all_cnt_last[3*31-1:3*30];

reg     [6:0]   pre_rate_III;
reg     [4:0]   kshift_III;
reg     [4:0]   cfg_III;

always @(*) begin : pre_rate_calc
    kshift_III = keycode_III >> ~ks_III;
    pre_rate_III = { 1'b0, cfg_III, 1'b0 } + { 2'b0, kshift_III };
end



reg [7:0]   step_idx;
reg [1:0]   state_in_III, state_in_IV, state_in_V, state_in_VI;

always @(*) begin : rate_step
    if( rate_V[5:4]==2'b11 ) begin // 0 means 1x, 1 means 2x
        if( rate_V[5:2]==4'hf && state_in_V == ATTACK)
            step_idx = 8'b11111111; // Maximum attack speed, rates 60&61
        else
        case( rate_V[1:0] )
            2'd0: step_idx = 8'b00000000;
            2'd1: step_idx = 8'b10001000; // 2
            2'd2: step_idx = 8'b10101010; // 4
            2'd3: step_idx = 8'b11101110; // 6
        endcase
    end
    else begin
        if( rate_V[5:2]==4'd0 && state_in_V != ATTACK)
            step_idx = 8'b11111110; // limit slowest decay rate_IV
        else
        case( rate_V[1:0] )
            2'd0: step_idx = 8'b10101010; // 4
            2'd1: step_idx = 8'b11101010; // 5
            2'd2: step_idx = 8'b11101110; // 6
            2'd3: step_idx = 8'b11111110; // 7
        endcase
    end
    // a rate_IV of zero keeps the level still
    step_V = rate_V[5:2]==4'd0 ? 1'b0 : step_idx[ cnt_V ];
end



wire    ar_off_VI;

always @(posedge clk) if(cen) begin
    // I
    if( d1l_I == 4'd15 )
        d1level_II <= 5'h10; // 48dB
    else
        d1level_II <= {1'b0,d1l_I};
end

//  II
wire    keyon_last_II;
wire    keyon_now_II  = !keyon_last_II && keyon_II;
wire    keyoff_now_II = keyon_last_II && !keyon_II;
wire    ar_off_II = keyon_now_II && (arate_II == 5'h1f);
wire [1:0]  state_II;

always @(posedge clk) if(cen) begin
    pg_rst_III <= keyon_now_II;
    // trigger release
    if( keyoff_now_II ) begin
        cfg_III <= { rrate_II, 1'b1 };
        state_in_III <= RELEASE;
    end
    else begin
        // trigger 1st decay
        if( keyon_now_II ) begin
            cfg_III <= arate_II;
            state_in_III <= ATTACK;
        end
        else begin : sel_rate
            case ( state_II )
                ATTACK: begin
                    if( eg_II==10'd0 ) begin
                        state_in_III <= DECAY1;
                        cfg_III      <= rate1_II;
                    end
                    else begin
                        state_in_III <= state_II; // attack
                        cfg_III      <= arate_II;
                    end
                end
                DECAY1: begin
                    if( eg_II[9:5] >= d1level_II ) begin
                        cfg_III      <= rate2_II;
                        state_in_III <= DECAY2;
                    end
                    else begin
                        cfg_III      <= rate1_II;
                        state_in_III <= state_II;   // decay1
                    end
                end
                DECAY2: begin
                        cfg_III      <= rate2_II;
                        state_in_III <= state_II;   // decay2
                    end
                RELEASE: begin
                        cfg_III      <= { rrate_II, 1'b1 };
                        state_in_III <= state_II;   // release
                    end
            endcase
        end
    end
end

    // III
always @(posedge clk) if(cen) begin
    state_in_IV <= state_in_III;
    rate_IV <= pre_rate_III[6] ? 6'd63 : pre_rate_III[5:0];
end

    // IV
always @(posedge clk) if(cen) begin
    state_in_V  <= state_in_IV;
    rate_V <= rate_IV;
    if( state_in_IV == ATTACK )
        case( rate_IV[5:2] )
            4'h0: cnt_V <= eg_cnt[13:11];
            4'h1: cnt_V <= eg_cnt[12:10];
            4'h2: cnt_V <= eg_cnt[11: 9];
            4'h3: cnt_V <= eg_cnt[10: 8];
            4'h4: cnt_V <= eg_cnt[ 9: 7];
            4'h5: cnt_V <= eg_cnt[ 8: 6];
            4'h6: cnt_V <= eg_cnt[ 7: 5];
            4'h7: cnt_V <= eg_cnt[ 6: 4];
            4'h8: cnt_V <= eg_cnt[ 5: 3];
            4'h9: cnt_V <= eg_cnt[ 4: 2];
            4'ha: cnt_V <= eg_cnt[ 3: 1];
            default: cnt_V <= eg_cnt[ 2: 0];
        endcase
    else
        case( rate_IV[5:2] )
            4'h0: cnt_V <= eg_cnt[14:12];
            4'h1: cnt_V <= eg_cnt[13:11];
            4'h2: cnt_V <= eg_cnt[12:10];
            4'h3: cnt_V <= eg_cnt[11: 9];
            4'h4: cnt_V <= eg_cnt[10: 8];
            4'h5: cnt_V <= eg_cnt[ 9: 7];
            4'h6: cnt_V <= eg_cnt[ 8: 6];
            4'h7: cnt_V <= eg_cnt[ 7: 5];
            4'h8: cnt_V <= eg_cnt[ 6: 4];
            4'h9: cnt_V <= eg_cnt[ 5: 3];
            4'ha: cnt_V <= eg_cnt[ 4: 2];
            4'hb: cnt_V <= eg_cnt[ 3: 1];
            default: cnt_V <= eg_cnt[ 2: 0];
        endcase
end

    // V
always @(posedge clk) if(cen) begin
    state_in_VI <= state_in_V;
    rate_VI     <= rate_V[5:1];
    sum_up      <= cnt_V[0] != cnt_out;
    step_VI     <= step_V;
end

///////////////////////////////////////
// VI
reg [8:0] ar_sum0_VI;
reg [9:0] ar_result_VI, ar_sum_VI;

always @(*) begin : ar_calculation
    casez( rate_VI[5:2] )
        default: ar_sum0_VI = { 3'd0, eg_VI[9:4] } + 9'd1;
        4'b1100: ar_sum0_VI = { 3'd0, eg_VI[9:4] } + 9'd1;
        4'b1101: ar_sum0_VI = { 2'd0, eg_VI[9:3] } + 9'd1;
        4'b111?: ar_sum0_VI = { 1'd0, eg_VI[9:2] } + 9'd1;
    endcase
    if( rate_VI[5:4] == 2'b11 )
        ar_sum_VI = step_VI ? { ar_sum0_VI, 1'b0 } : { 1'b0, ar_sum0_VI };
    else
        ar_sum_VI = step_VI ? { 1'b0, ar_sum0_VI } : 10'd0;
    ar_result_VI = ar_sum_VI<eg_VI ? eg_VI-ar_sum_VI : 10'd0;
end


always @(posedge clk) if(cen) begin
    if( ar_off_VI )
        eg_VII <= 10'd0;
    else
    if( state_in_VI == ATTACK ) begin
        if( sum_up && eg_VI != 10'd0 )
            if( rate_VI[5:1]==5'hf )
                eg_VII <= 10'd0;
            else
                eg_VII <= ar_result_VI;
        else
            eg_VII <= eg_VI;
    end
    else begin : DECAY_SUM
        if( sum_up ) begin
            if ( eg_VI<= (10'd1023-10'd8) )
                case( rate_VI[5:2] )
                    4'b1100: eg_VII <= eg_VI + { 8'd0, step_VI, ~step_VI }; // 12
                    4'b1101: eg_VII <= eg_VI + { 7'd0, step_VI, ~step_VI, 1'b0 }; // 13
                    4'b1110: eg_VII <= eg_VI + { 6'd0, step_VI, ~step_VI, 2'b0 }; // 14
                    4'b1111: eg_VII <= eg_VI + 10'd8;// 15
                    default: eg_VII <= eg_VI + { 8'd0, step_VI, 1'b0 };
                endcase
            else eg_VII <= 10'h3FF;
        end
        else eg_VII <= eg_VI;
    end
end

// VII
always @(*) begin : sum_eg_and_tl
    casez( {amsen_VII, ams_VII } )
        3'b0_??,
        3'b1_00: am_final_VII = 10'd0;
        3'b1_01: am_final_VII = { 2'b0, am };       // 23.9 dB max
        3'b1_10: am_final_VII = { 1'b0, am, 1'b0 };  // 47   dB
        3'b1_11: am_final_VII = { am, 2'b0       };  // 95.6 dB
    endcase
    `ifdef TEST_SUPPORT
    if( test_eg && tl_VII!=7'd0 )
        sum_eg_tl_VII = 12'd0;
    else
    `endif
    sum_eg_tl_VII = { 2'b0, tl_VII, 3'd0 } // 0.75 dB steps
                  + { 2'b0, eg_VII       } // 0.094 dB steps
                  + { 2'b0, am_final_VII };
end

always @(posedge clk) if(cen) begin
    eg_VIII <= |sum_eg_tl_VII[11:10] ? {10{1'b1}} : sum_eg_tl_VII[9:0];
end

jt51_sh #( .width(10), .stages(3) ) u_egpadding (
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( eg_VIII   ),
    .drop   ( eg_XI     )
);


// Shift registers

jt51_sh #( .width(10), .stages(32-7+2), .rstval(1'b1) ) u_eg1sh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( eg_VII    ),
    .drop   ( eg_II     )
);

jt51_sh #( .width(10), .stages(4), .rstval(1'b1) ) u_eg2sh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( eg_II     ),
    .drop   ( eg_VI     )
);

jt51_sh #( .width(1), .stages(4) ) u_aroffsh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( ar_off_II ),
    .drop   ( ar_off_VI )
);

jt51_sh #( .width(1), .stages(32) ) u_konsh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .din    ( keyon_II  ),
    .cen    ( cen       ),
    .drop   ( keyon_last_II )
);

jt51_sh #( .width(1), .stages(32) ) u_cntsh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( cnt_V[0]  ),
    .drop   ( cnt_out   )
);

jt51_sh #( .width(2), .stages(32-3+2), .rstval(1'b1) ) u_statesh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( state_in_III  ),
    .drop   ( state_II )
);

`ifdef JT51_DEBUG
`ifdef SIMULATION
/* verilator lint_off PINMISSING */
wire [4:0] cnt;

sep32_cnt u_sep32_cnt (.clk(clk), .cen(cen), .zero(zero), .cnt(cnt));

sep32 #(.width(10),.stg(11)) sep_eg(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( eg_XI         ),
    .cnt    ( cnt           )
    );

sep32 #(.width(7),.stg(7)) sep_tl(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( tl_VII        ),
    .cnt    ( cnt           )
    );

sep32 #(.width(2),.stg(3)) sep_state(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( state_in_III  ),
    .cnt    ( cnt           )
    );

sep32 #(.width(5),.stg(6)) sep_rate(
    .clk    ( clk           ),
    .mixed  ( rate_VI       ),
    .cnt    ( cnt           )
    );

sep32 #(.width(10),.stg(7)) sep_amfinal(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( am_final_VII  ),
    .cnt    ( cnt           )
    );

sep32 #(.width(5),.stg(3)) sep_kcfinal(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( keycode_III   ),
    .cnt    ( cnt           )
    );

/* verilator lint_on PINMISSING */
`endif
`endif

endmodule

