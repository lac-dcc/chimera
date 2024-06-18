// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT6295.
    JT6295 program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT6295 program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT6295.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 6-1-2020 */

module jt6295_adpcm(
    input                    rst,
    input                    clk,
    input                    cen,
    input                    en,
    input             [ 3:0] att,
    input             [ 3:0] data,
    output reg signed [11:0] sound
);


reg [10:0] lut[0:48];

reg [ 5:0] idx_inc_II;
reg [ 5:0] delta_idx_I,delta_idx_II, delta_idx_III, delta_idx_IV;

reg [ 2:0] factor_II, factor_III;
reg        factor_IV;
reg        sign_II, sign_III, sign_IV, sign_V;
reg [11:0] dn_II, qn_II, dn_III, qn_III, dn_IV, qn_IV, qn_V;

always @(posedge clk, posedge rst ) begin
    if(rst) begin
        idx_inc_II    <= 6'd0;
        delta_idx_I   <= 6'd0;
        delta_idx_II  <= 6'd0;
        delta_idx_III <= 6'd0;
        delta_idx_IV  <= 6'd0;

        factor_II  <= 3'd0;
        factor_III <= 0;
        factor_IV  <= 1'd0;
        { sign_II, sign_III, sign_IV, sign_V } <=4'd0;
        dn_II   <= 12'd0;
        qn_II   <= 12'd0;
        dn_III  <= 12'd0;
        qn_III  <= 12'd0;
        dn_IV   <= 12'd0;
        qn_IV   <= 12'd0;
        qn_V    <= 12'd0;
    end else if(cen) begin
        // I
        case( data[1:0] )
            2'd0: idx_inc_II <= 6'd2;
            2'd1: idx_inc_II <= 6'd4;
            2'd2: idx_inc_II <= 6'd6;
            2'd3: idx_inc_II <= 6'd8;
        endcase
        sign_II      <= data[3];
        delta_idx_II <= en ? delta_idx_I : 6'd0;
        factor_II    <= en ? data[2:0] : 3'd0;
        qn_II        <= { 1'd0, lut[delta_idx_I]>>3};   // next value, starts at 1/8 of step size
        dn_II        <= { 1'b0, lut[delta_idx_I] };     // step size
        // II
        sign_III      <= sign_II;
        delta_idx_III <= factor_II[2] ? (delta_idx_II+idx_inc_II) : (delta_idx_II-6'd1);
        qn_III        <= factor_II[2] ? qn_II + dn_II : qn_II;
        dn_III        <= dn_II>>1;
        factor_III    <= factor_II;
        // III
        sign_IV      <= sign_III;
        qn_IV        <= factor_III[1] ? qn_III + dn_III : qn_III;
        dn_IV        <= dn_III>>1;
        factor_IV    <= factor_III[0];
        delta_idx_IV <=  delta_idx_III>6'd48 ?
            (factor_III[2] ? 6'd48 : 6'd0) :
            delta_idx_III;
        // IV
        sign_V      <= sign_IV;
        qn_V        <= factor_IV ? qn_IV + dn_IV : qn_IV;
        delta_idx_I <= delta_idx_IV;
    end
end

wire en_V;

jt6295_sh_rst #(.WIDTH(1), .STAGES(4) ) u_enable
(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .clk_en ( cen       ),
    .din    ( en        ),
    .drop   ( en_V      )
);

wire [3:0] att_V;

jt6295_sh_rst #(.WIDTH(4), .STAGES(4) ) u_att
(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .clk_en ( cen       ),
    .din    ( att       ),
    .drop   ( att_V     )
);


wire signed [11:0] snd_out;
reg  signed [11:0] snd_V, snd_VI;
reg  signed [12:0] unlim_V;
reg  signed [ 6:0] gain_lut[0:15];
reg  signed [ 6:0] gain_VI; // leave the MSB for the sign
reg                ov_V;
wire signed [16:0] mul_VI = snd_VI * gain_VI; // multipliers are abundant
    // in the FPGA, so I just use one.

always @(*) begin
    unlim_V =  sign_V ? { snd_out[11], snd_out } - qn_V :
                        { snd_out[11], snd_out } + qn_V;
    ov_V  = &{snd_out[11],sign_V,~unlim_V[11]}|&{~snd_out[11],~sign_V,unlim_V[11]}; // overflow check
    if( ^unlim_V[12:11] ) ov_V=1;
    snd_V = !en_V ? 12'd0 :
             ov_V ? {unlim_V[12],{11{~unlim_V[12]}}} : unlim_V[11:0]; // clamp
end

always @(posedge clk, posedge rst) begin
    if(rst) begin
        snd_VI  <= 12'd0;
        gain_VI <= 7'd0;
        sound   <= 12'd0;
    end else if(cen) begin
        snd_VI  <= snd_V;
        gain_VI <= gain_lut[att_V];
        sound   <= mul_VI[16:5];
    end
end

jt6295_sh_rst #(.WIDTH(12), .STAGES(4) ) u_sound(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .clk_en ( cen       ),
    .din    ( snd_V     ),
    .drop   ( snd_out   )
);

initial begin
lut[ 0] = 11'd0016; lut[ 1] = 11'd0017; lut[ 2] = 11'd0019; lut[ 3] = 11'd0021; lut[ 4] = 11'd0023; lut[ 5] = 11'd0025; lut[ 6] = 11'd0028;
lut[ 7] = 11'd0031; lut[ 8] = 11'd0034; lut[ 9] = 11'd0037; lut[10] = 11'd0041; lut[11] = 11'd0045; lut[12] = 11'd0050; lut[13] = 11'd0055;
lut[14] = 11'd0060; lut[15] = 11'd0066; lut[16] = 11'd0073; lut[17] = 11'd0080; lut[18] = 11'd0088; lut[19] = 11'd0097; lut[20] = 11'd0107;
lut[21] = 11'd0118; lut[22] = 11'd0130; lut[23] = 11'd0143; lut[24] = 11'd0157; lut[25] = 11'd0173; lut[26] = 11'd0190; lut[27] = 11'd0209;
lut[28] = 11'd0230; lut[29] = 11'd0253; lut[30] = 11'd0279; lut[31] = 11'd0307; lut[32] = 11'd0337; lut[33] = 11'd0371; lut[34] = 11'd0408;
lut[35] = 11'd0449; lut[36] = 11'd0494; lut[37] = 11'd0544; lut[38] = 11'd0598; lut[39] = 11'd0658; lut[40] = 11'd0724; lut[41] = 11'd0796;
lut[42] = 11'd0876; lut[43] = 11'd0963; lut[44] = 11'd1060; lut[45] = 11'd1166; lut[46] = 11'd1282; lut[47] = 11'd1411; lut[48] = 11'd1552;
end

// Attenuation has been verified against two CPS1 boards
//     Magic Sword         SF2               JTCPS1
//     88617A             89626A             fbb89f0
// set dB      delta     dB    delta    dB     delta
// 0   1,1              0,9            -9,1
// 1   -2,2    -3,3    -2,4    -3,3    -12,4   -3,3
// 2   -4,9    -2,7    -5,1    -2,7    -15,2   -2,8
// 3   -8,2    -3,3    -8,4    -3,3    -18,4   -3,2
// 4   -11     -2,8    -11,1   -2,7    -21,2   -2,8
// 5   -13,5   -2,5    -13,6   -2,5    -23,7   -2,5
// 6   -16,9   -3,4    -17,2   -3,6    -27,2   -3,5
// 7   -19,3   -2,4    -19,7   -2,5    -29,7   -2,5
// sampled at 192kHz, using an FFT bin size of 4096 samples, power at 637 Hz
initial begin
    gain_lut[0]  = 7'd32;
    gain_lut[1]  = 7'd22;
    gain_lut[2]  = 7'd16;
    gain_lut[3]  = 7'd11;
    gain_lut[4]  = 7'd8;
    gain_lut[5]  = 7'd6;
    gain_lut[6]  = 7'd4;
    gain_lut[7]  = 7'd3;
    gain_lut[8]  = 7'd2;
    gain_lut[9]  = 7'd0; gain_lut[10] = 7'd0; gain_lut[11] = 7'd0;
    gain_lut[12] = 7'd0; gain_lut[13] = 7'd0; gain_lut[14] = 7'd0;
    gain_lut[15] = 7'd0;
end

`ifdef SIMULATION
reg signed [11:0] snd0, snd1, snd2, snd3;
reg        [ 3:0] ch;

always @(posedge clk, posedge rst) begin
    if( rst ) ch <= 4'b1;
    else if(cen) ch <= { ch[2:0], ch[3] };
end

always @(posedge clk) if(cen) begin
    case(ch)
        4'd1: snd0 <= snd_V;
        4'd2: snd1 <= snd_V;
        4'd4: snd2 <= snd_V;
        4'd8: snd3 <= snd_V;
        default:;
    endcase
end
`endif

endmodule