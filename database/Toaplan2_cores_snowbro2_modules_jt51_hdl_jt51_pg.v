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


module jt51_pg(
    input               rst,
    input               clk,
    input               cen /* direct_enable */,
    input               zero,
    // Channel frequency
    input       [6:0]   kc_I,
    input       [5:0]   kf_I,
    // Operator multiplying
    input       [3:0]   mul_VI,
    // Operator detuning
    input       [2:0]   dt1_II,
    input       [1:0]   dt2_I,
    // phase modulation from LFO
    input       [7:0]   pm,
    input       [2:0]   pms_I,
    // phase operation
    input               pg_rst_III,
    output  reg [ 4:0]  keycode_III,
    output      [ 9:0]  pg_phase_X
    `ifdef JT51_PG_SIM
    ,output [19:0] phase_step_VII_out
    ,output [12:0] keycode_I_out
    `endif
);

wire [19:0] ph_VII;

reg [19:0]  phase_base_VI, phase_step_VII, ph_VIII;
reg [17:0]  phase_base_IV, phase_base_V;
wire pg_rst_VII;

wire        [11:0]  phinc_III;

reg [ 9:0]  phinc_addr_III;

reg [13:0]  keycode_II;
reg [5:0]   dt1_kf_III;
reg [ 2:0]  dt1_kf_IV;

reg [4:0]   pow2;
reg [4:0]   dt1_offset_V;
reg [2:0]   pow2ind_IV;

reg  [2:0]  dt1_III, dt1_IV, dt1_V;

`ifdef JT51_PG_SIM
assign phase_step_VII_out = phase_step_VII;
assign keycode_I_out = keycode_I;
`endif

jt51_phinc_rom u_phinctable(
    // .clk     ( clk        ),
    .keycode( phinc_addr_III[9:0]  ),
    .phinc  ( phinc_III    )
);

always @(*) begin : calcpow2
    case( pow2ind_IV )
        3'd0: pow2 = 5'd16;
        3'd1: pow2 = 5'd17;
        3'd2: pow2 = 5'd19;
        3'd3: pow2 = 5'd20;
        3'd4: pow2 = 5'd22;
        3'd5: pow2 = 5'd24;
        3'd6: pow2 = 5'd26;
        3'd7: pow2 = 5'd29;
    endcase
end

reg [5:0] dt1_limit, dt1_unlimited;
reg [4:0] dt1_limited_IV;

always @(*) begin : dt1_limit_mux
    case( dt1_IV[1:0] )
        default: dt1_limit = 6'd8;
        2'd1: dt1_limit    = 6'd8;
        2'd2: dt1_limit    = 6'd16;
        2'd3: dt1_limit    = 6'd22;
    endcase
    case( dt1_kf_IV )
        3'd0:   dt1_unlimited = { 5'd0, pow2[4]   }; // <2
        3'd1:   dt1_unlimited = { 4'd0, pow2[4:3] }; // <4
        3'd2:   dt1_unlimited = { 3'd0, pow2[4:2] }; // <8
        3'd3:   dt1_unlimited = { 2'd0, pow2[4:1] };
        3'd4:   dt1_unlimited = { 1'd0, pow2[4:0] };
        3'd5:   dt1_unlimited = { pow2[4:0], 1'd0 };
        default:dt1_unlimited = 6'd0;
    endcase
    dt1_limited_IV = dt1_unlimited > dt1_limit ?
                            dt1_limit[4:0] : dt1_unlimited[4:0];
end

reg signed [8:0] mod_I;

always @(*) begin
    case( pms_I ) // comprobar en silicio
        3'd0: mod_I = 9'd0;
        3'd1: mod_I = { 7'd0, pm[6:5] };
        3'd2: mod_I = { 6'd0, pm[6:4] };
        3'd3: mod_I = { 5'd0, pm[6:3] };
        3'd4: mod_I = { 4'd0, pm[6:2] };
        3'd5: mod_I = { 3'd0, pm[6:1] };
        3'd6: mod_I = { 1'd0, pm[6:0], 1'b0 };
        3'd7: mod_I = {       pm[6:0], 2'b0 };
    endcase
end


reg [3:0]   octave_III;

wire [12:0] keycode_I;

jt51_pm u_pm(
    // Channel frequency
    .kc_I   ( kc_I      ),
    .kf_I   ( kf_I      ),
    .add    ( ~pm[7]    ),
    .mod_I  ( mod_I     ),
    .kcex   ( keycode_I )
);

// limit value at which we add +64 to the keycode
// I assume this is to avoid the note==3 violation somehow
parameter dt2_lim2 = 8'd11 + 8'd64;
parameter dt2_lim3 = 8'd31 + 8'd64;

    // I
always @(posedge clk) if(cen) begin : phase_calculation
    case ( dt2_I )
        2'd0: keycode_II <=  { 1'b0, keycode_I } +
            (keycode_I[7:6]==2'd3 ? 14'd64:14'd0);
        2'd1: keycode_II <= { 1'b0, keycode_I } + 14'd512 +
            (keycode_I[7:6]==2'd3 ? 14'd64:14'd0);
        2'd2: keycode_II <= { 1'b0, keycode_I } + 14'd628 +
            (keycode_I[7:0]>dt2_lim2 ? 14'd64:14'd0);
        2'd3: keycode_II <= { 1'b0, keycode_I } + 14'd800 +
            (keycode_I[7:0]>dt2_lim3  ? 14'd64:14'd0);
    endcase
end

    // II
always @(posedge clk) if(cen) begin
    phinc_addr_III  <= keycode_II[9:0];
    octave_III  <= keycode_II[13:10];
    keycode_III <=  keycode_II[12:8];
        // Using bits 13:9 fixes Double Dragon issue #14
        // but notes get too long in Jackal
    case( dt1_II[1:0] )
        2'd1:   dt1_kf_III  <=  keycode_II[13:8]    - (6'b1<<2);
        2'd2:   dt1_kf_III  <=  keycode_II[13:8]    + (6'b1<<2);
        2'd3:   dt1_kf_III  <=  keycode_II[13:8]    + (6'b1<<3);
        default:dt1_kf_III  <=  keycode_II[13:8];
    endcase
    dt1_III   <= dt1_II;
end

    // III
always @(posedge clk) if(cen) begin
    case( octave_III )
        4'd0:   phase_base_IV   <=  { 8'd0, phinc_III[11:2] };
        4'd1:   phase_base_IV   <=  { 7'd0, phinc_III[11:1] };
        4'd2:   phase_base_IV   <=  { 6'd0, phinc_III[11:0] };
        4'd3:   phase_base_IV   <=  { 5'd0, phinc_III[11:0], 1'b0 };
        4'd4:   phase_base_IV   <=  { 4'd0, phinc_III[11:0], 2'b0 };
        4'd5:   phase_base_IV   <=  { 3'd0, phinc_III[11:0], 3'b0 };
        4'd6:   phase_base_IV   <=  { 2'd0, phinc_III[11:0], 4'b0 };
        4'd7:   phase_base_IV   <=  { 1'd0, phinc_III[11:0], 5'b0 };
        4'd8:   phase_base_IV   <=  {       phinc_III[11:0], 6'b0 };
        default:phase_base_IV   <=  18'd0;
    endcase
    pow2ind_IV  <= dt1_kf_III[2:0];
    dt1_IV      <= dt1_III;
    dt1_kf_IV   <= dt1_kf_III[5:3];
end

    // IV LIMIT_BASE
always @(posedge clk) if(cen) begin
    if( phase_base_IV > 18'd82976 )
        phase_base_V <= 18'd82976;
    else
        phase_base_V <= phase_base_IV;
    dt1_offset_V <= dt1_limited_IV;
    dt1_V <= dt1_IV;
end

    // V APPLY_DT1
always @(posedge clk) if(cen) begin
    if( dt1_V[1:0]==2'd0 )
        phase_base_VI   <=  {2'b0, phase_base_V};
    else begin
        if( !dt1_V[2] )
            phase_base_VI   <= {2'b0, phase_base_V} + { 15'd0, dt1_offset_V };
        else
            phase_base_VI   <= {2'b0, phase_base_V} - { 15'd0, dt1_offset_V };
    end
end

    // VI APPLY_MUL
always @(posedge clk) if(cen) begin
    if( mul_VI==4'd0 )
        phase_step_VII  <= { 1'b0, phase_base_VI[19:1] };
    else
        phase_step_VII  <= phase_base_VI * mul_VI;
end

// VII have same number of stages as jt51_envelope
always @(posedge clk, posedge rst) begin
    if( rst )
        ph_VIII <= 20'd0;
    else if(cen) begin
        ph_VIII <= pg_rst_VII ? 20'd0 : ph_VII + phase_step_VII;
        `ifdef DISPLAY_STEP
            $display( "%d", phase_step_VII );
        `endif
    end
end

// VIII
reg [19:0] ph_IX;
always @(posedge clk, posedge rst) begin
    if( rst )
        ph_IX <= 20'd0;
    else if(cen) begin
        ph_IX <= ph_VIII[19:0];
    end
end

// IX
reg [19:0] ph_X;
assign pg_phase_X = ph_X[19:10];
always @(posedge clk, posedge rst) begin
    if( rst ) begin
        ph_X  <= 20'd0;
    end else if(cen) begin
        ph_X  <= ph_IX;
    end
end

jt51_sh #( .width(20), .stages(32-3) ) u_phsh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( ph_X      ),
    .drop   ( ph_VII    )
);

jt51_sh #( .width(1), .stages(4) ) u_pgrstsh(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( pg_rst_III),
    .drop   ( pg_rst_VII)
);

`ifdef JT51_DEBUG
`ifdef SIMULATION
/* verilator lint_off PINMISSING */

wire [4:0] cnt;

sep32_cnt u_sep32_cnt (.clk(clk), .cen(cen), .zero(zero), .cnt(cnt));

sep32 #(.width(10),.stg(10)) sep_ph(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( pg_phase_X    ),
    .cnt    ( cnt           )
);

sep32 #(.width(20),.stg(7)) sep_phstep(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( phase_step_VII),
    .cnt    ( cnt           )
);

sep32 #(.width(13),.stg(1)) sep_kc1(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( keycode_I     ),
    .cnt    ( cnt           )
);

sep32 #(.width(14),.stg(2)) sep_kc2(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( keycode_II    ),
    .cnt    ( cnt           )
);

sep32 #(.width(3),.stg(1)) sep_pms(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( pms_I         ),
    .cnt    ( cnt           )
);

sep32 #(.width(18),.stg(4)) sep_base4(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( phase_base_IV ),
    .cnt    ( cnt           )
);

sep32 #(.width(18),.stg(5)) sep_base5(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( phase_base_V  ),
    .cnt    ( cnt           )
);

/* verilator lint_on PINMISSING */
`endif
`endif

endmodule

