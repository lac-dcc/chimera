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


module jt51_reg(
    input           rst,
    input           clk,
    input           cen,        // P1

    // operator updates
    input           up_dt1,
    input           up_tl,
    input           up_ks,
    input           up_amsen,
    input           up_dt2,
    input           up_d1l,
    input           up_keyon,
    input   [1:0]   op,     // operator to update
    input   [2:0]   ch,     // channel to update
    input   [7:0]   op_din,
    // channel updates
    input           up_rl,
    input           up_kc,
    input           up_kf,
    input           up_pms,
    input   [2:0]   ch_sel, // channel updates
    input   [7:0]   ch_din,

    input           csm,
    input           overflow_A,

    output  [1:0]   rl_I,
    output  [2:0]   fb_II,
    output  [2:0]   con_I,
    output  [6:0]   kc_I,
    output  [5:0]   kf_I,
    output  [2:0]   pms_I,
    output  [1:0]   ams_VII,
    output  [2:0]   dt1_II,
    output  [3:0]   mul_VI,
    output  [6:0]   tl_VII,
    output  [1:0]   ks_III,
    output          amsen_VII,

    output  [4:0]   arate_II,
    output  [4:0]   rate1_II,
    output  [4:0]   rate2_II,
    output  [3:0]   rrate_II,

    output  [1:0]   dt2_I,
    output  [3:0]   d1l_I,
    output          keyon_II,

    // Pipeline order
    output  reg     zero,
    output  reg     half,
    output  [4:0]   cycles,
    output  reg     m1_enters,
    output  reg     m2_enters,
    output  reg     c1_enters,
    output  reg     c2_enters,
    // Operator
    output          use_prevprev1,
    output          use_internal_x,
    output          use_internal_y,
    output          use_prev2,
    output          use_prev1,

    output  [1:0]   cur_op,
    output  reg     op31_no,
    output  reg     op31_acc
);

reg     kon, koff;
reg [1:0] csm_state;
reg [4:0] csm_cnt;

// wire csm_kon  = csm_state[0];
// wire csm_koff = csm_state[1];

always @(*) begin
    m1_enters = cur_op == 2'b00;
    m2_enters = cur_op == 2'b01;
    c1_enters = cur_op == 2'b10;
    c2_enters = cur_op == 2'b11;
end

`ifdef SIMULATION
wire up =   up_rl | up_kc | up_kf | up_pms | up_dt1 | up_tl |
            up_ks | up_amsen | up_dt2 | up_d1l | up_keyon;
`endif

reg [4:0]   cur;

always @(posedge clk) if(cen) begin
    op31_no  <= cur == 5'o10;
    op31_acc <= cur == 5'o16;
end

assign cur_op = cur[4:3];
assign cycles = cur;

wire [4:0] req_I   = { op, ch };
wire [4:0] req_II  = req_I   + 5'd1;
wire [4:0] req_III = req_II  + 5'd1;
wire [4:0] req_IV  = req_III + 5'd1;
wire [4:0] req_V   = req_IV  + 5'd1;
wire [4:0] req_VI  = req_V   + 5'd1;
wire [4:0] req_VII = req_VI  + 5'd1;


wire    update_op_I     = cur == req_I;
wire    update_op_II    = cur == req_II;
wire    update_op_III   = cur == req_III;
// wire    update_op_IV    = cur == req_IV;
// wire    update_op_V     = cur == req_V;
wire    update_op_VI    = cur == req_VI;
wire    update_op_VII   = cur == req_VII;

wire up_dt1_op  = up_dt1    & update_op_II; // DT1, MUL
wire up_mul_op  = up_dt1    & update_op_VI; // DT1, MUL
wire up_tl_op   = up_tl     & update_op_VII;
wire up_ks_op   = up_ks     & update_op_III; // KS, AR
wire up_amsen_op= up_amsen  & update_op_VII; // AMS-EN, D1R
wire up_dt2_op  = up_dt2    & update_op_I; // DT2, D2R
wire up_d1l_op  = up_d1l    & update_op_I; // D1L, RR

wire up_ar_op   = up_ks     & update_op_II; // KS, AR
wire up_d1r_op  = up_amsen  & update_op_II; // AMS-EN, D1R
wire up_d2r_op  = up_dt2    & update_op_II; // DT2, D2R
wire up_rr_op   = up_d1l    & update_op_II; // D1L, RR

wire [4:0] next = cur+5'd1;

always @(posedge clk, posedge rst) begin : up_counter
    if( rst ) begin
        cur     <= 5'h0;
        zero    <= 1'b0;
        half    <= 1'b0;
    end
    else if(cen) begin
        cur     <= next;
        zero    <= next== 5'd0;
        half    <= next[3:0] == 4'd0;
    end
end

wire [2:0] cur_ch   = cur[2:0];
wire [3:0] keyon_op = op_din[6:3];
wire [2:0] keyon_ch = op_din[2:0];

jt51_kon u_kon (
    .rst       (rst       ),
    .clk       (clk       ),
    .cen       (cen       ),
    .keyon_op  (keyon_op  ),
    .keyon_ch  (keyon_ch  ),
    .cur_op    (cur_op    ),
    .cur_ch    (cur_ch    ),
    .up_keyon  (up_keyon  ),
    .csm       (csm       ),
    .overflow_A(overflow_A),
    .keyon_II  (keyon_II  )
);


jt51_mod u_mod(
    .alg_I      ( con_I ),
    .m1_enters  ( m1_enters ),
    .m2_enters  ( m2_enters ),
    .c1_enters  ( c1_enters ),
    .c2_enters  ( c2_enters ),

    .use_prevprev1 ( use_prevprev1  ),
    .use_internal_x( use_internal_x ),
    .use_internal_y( use_internal_y ),
    .use_prev2   ( use_prev2      ),
    .use_prev1   ( use_prev1      )
);

jt51_csr_op u_csr_op(
    .rst            (  rst          ),
    .clk            (  clk          ),
    .cen            (  cen          ),  // P1
    .din            (  op_din       ),

    .up_dt1_op      (  up_dt1_op    ),
    .up_mul_op      (  up_mul_op    ),
    .up_tl_op       (  up_tl_op     ),
    .up_ks_op       (  up_ks_op     ),
    .up_amsen_op    (  up_amsen_op  ),
    .up_dt2_op      (  up_dt2_op    ),
    .up_d1l_op      (  up_d1l_op    ),
    .up_ar_op       (  up_ar_op     ),
    .up_d1r_op      (  up_d1r_op    ),
    .up_d2r_op      (  up_d2r_op    ),
    .up_rr_op       (  up_rr_op     ),

    .dt1            (  dt1_II       ),
    .mul            (  mul_VI       ),
    .tl             (  tl_VII       ),
    .ks             (  ks_III       ),
    .amsen          (  amsen_VII    ),
    .dt2            (  dt2_I        ),
    .d1l            (  d1l_I        ),
    .arate          (  arate_II     ),
    .rate1          (  rate1_II     ),
    .rate2          (  rate2_II     ),
    .rrate          (  rrate_II     )
);

jt51_reg_ch u_csr_ch(
    .rst        ( rst           ),
    .clk        ( clk           ),
    .cen        ( cen           ),
    .din        ( ch_din        ),

    .up_ch      ( ch_sel        ),
    .up_rl      ( up_rl         ),
    .up_kc      ( up_kc         ),
    .up_kf      ( up_kf         ),
    .up_pms     ( up_pms        ),

    .ch         ( next[2:0]     ),
    .rl         ( rl_I          ),
    .fb_II      ( fb_II         ),
    .con        ( con_I         ),
    .kc         ( kc_I          ),
    .kf         ( kf_I          ),
    .ams_VII    ( ams_VII       ),
    .pms        ( pms_I         )
);

//////////////////// Debug
`ifdef JT51_DEBUG
`ifdef SIMULATION
/* verilator lint_off PINMISSING */
wire [4:0] cnt_aux;

sep32_cnt u_sep32_cnt (.clk(clk), .cen(cen), .zero(zero), .cnt(cnt_aux));

sep32 #(.width(7),.stg(1)) sep_tl(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( tl_VII        ),
    .cnt    ( cnt_aux       )
    );

sep32 #(.width(5),.stg(1)) sep_ar(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( arate_II      ),
    .cnt    ( cnt_aux       )
    );


sep32 #(.width(4),.stg(1)) sep_d1l(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( d1l_I         ),
    .cnt    ( cnt_aux       )
    );


sep32 #(.width(4),.stg(1)) sep_rr(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( rrate_II      ),
    .cnt    ( cnt_aux       )
    );

sep32 #(.width(1),.stg(1)) sep_amsen(
    .clk    ( clk           ),
    .cen    ( cen           ),
    .mixed  ( amsen_VII     ),
    .cnt    ( cnt_aux       )
    );

/* verilator lint_on PINMISSING */
`endif
`endif

endmodule
