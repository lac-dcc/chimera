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

`ifdef VERILATOR_KEEP_JT51 /* verilator tracing_on */ `endif
module jt51(
    input               rst,    // reset
    input               clk,    // main clock
    (* direct_enable *) input cen,    // clock enable
    (* direct_enable *) input cen_p1, // clock enable at half the speed
    input               cs_n,   // chip select
    input               wr_n,   // write
    input               a0,
    input       [7:0]   din, // data in
    output      [7:0]   dout, // data out
    // peripheral control
    output              ct1,
    output              ct2,
    output              irq_n,  // I do not synchronize this signal
    // Low resolution output (same as real chip)
    output              sample, // marks new output sample
    output  signed  [15:0] left,
    output  signed  [15:0] right,
    // Full resolution output
    output  signed  [15:0] xleft,
    output  signed  [15:0] xright
);

// Timers
wire [9:0]  value_A;
wire [7:0]  value_B;
wire        load_A, load_B;
wire        enable_irq_A, enable_irq_B;
wire        clr_flag_A, clr_flag_B;
wire        flag_A, flag_B, overflow_A;
wire        zero, half;
wire [4:0]  cycles;

jt51_timers u_timers(
    .clk        ( clk           ),
    .cen        ( cen_p1        ),
    .rst        ( rst           ),
    .zero       ( zero          ),
    .value_A    ( value_A       ),
    .value_B    ( value_B       ),
    .load_A     ( load_A        ),
    .load_B     ( load_B        ),
    .enable_irq_A( enable_irq_A ),
    .enable_irq_B( enable_irq_B ),
    .clr_flag_A ( clr_flag_A    ),
    .clr_flag_B ( clr_flag_B    ),
    .flag_A     ( flag_A        ),
    .flag_B     ( flag_B        ),
    .overflow_A ( overflow_A    ),
    .irq_n      ( irq_n         )
);

`ifndef JT51_ONLYTIMERS
`define YM_TIMER_CTRL 8'h14

wire    [1:0]   rl_I;
wire    [2:0]   fb_II;
wire    [2:0]   con_I;
wire    [6:0]   kc_I;
wire    [5:0]   kf_I;
wire    [2:0]   pms_I;
wire    [1:0]   ams_VII;
wire    [2:0]   dt1_II;
wire    [3:0]   mul_VI;
wire    [6:0]   tl_VII;
wire    [1:0]   ks_III;
wire    [4:0]   arate_II;
wire            amsen_VII;
wire    [4:0]   rate1_II;
wire    [1:0]   dt2_I;
wire    [4:0]   rate2_II;
wire    [3:0]   d1l_I;
wire    [3:0]   rrate_II;

wire    [1:0]   cur_op;
wire            keyon_II;

wire    [7:0]   lfo_freq;
wire    [1:0]   lfo_w;
wire            lfo_up;
wire    [7:0]   am;
wire    [7:0]   pm;
wire    [6:0]   amd, pmd;
wire    [7:0]   test_mode;
wire            noise;

wire m1_enters, m2_enters, c1_enters, c2_enters;
wire use_prevprev1,use_internal_x,use_internal_y, use_prev2,use_prev1;

assign  sample = zero & cen_p1; // single strobe

jt51_lfo u_lfo(
    .rst        ( rst       ),
    .clk        ( clk       ),
    .cen        ( cen_p1    ),
    .cycles     ( cycles    ),

    // Configuration
    .lfo_freq   ( lfo_freq  ),
    .lfo_w      ( lfo_w     ),
    .lfo_amd    ( amd       ),
    .lfo_pmd    ( pmd       ),
    .lfo_up     ( lfo_up    ),
    .noise      ( noise     ),

    // Test
    .test       ( test_mode ),
    .lfo_clk    (           ),

    .am         ( am        ),
    .pm         ( pm        )
);

wire    [ 4:0]  keycode_III;
wire    [ 9:0]  ph_X;
wire            pg_rst_III;

jt51_pg u_pg(
    .rst        ( rst       ),
    .clk        ( clk       ),              // P1
    .cen        ( cen_p1    ),
    .zero       ( zero      ),
    // Channel frequency
    .kc_I       ( kc_I      ),
    .kf_I       ( kf_I      ),
    // Operator multiplying
    .mul_VI     ( mul_VI    ),
    // Operator detuning
    .dt1_II     ( dt1_II    ),
    .dt2_I      ( dt2_I     ),
    // phase modulation from LFO
    .pms_I      ( pms_I     ),
    .pm         ( pm        ),
    // phase operation
    .pg_rst_III ( pg_rst_III    ),
    .keycode_III( keycode_III   ),
    .pg_phase_X ( ph_X          )
);

`ifdef TEST_SUPPORT
wire        test_eg, test_op0;
`endif
wire [9:0]  eg_XI;

jt51_eg u_eg(
    `ifdef TEST_SUPPORT
    .test_eg    ( test_eg   ),
    `endif
    .rst        ( rst       ),
    .clk        ( clk       ),
    .cen        ( cen_p1    ),
    .zero       ( zero      ),
    // envelope configuration
    .keycode_III(keycode_III),  // used in stage III
    .arate_II   ( arate_II  ),
    .rate1_II   ( rate1_II  ),
    .rate2_II   ( rate2_II  ),
    .rrate_II   ( rrate_II  ),
    .d1l_I      ( d1l_I     ),
    .ks_III     ( ks_III    ),
    // envelope operation
    .keyon_II   ( keyon_II  ),
    .pg_rst_III ( pg_rst_III),
    // envelope number
    .tl_VII     ( tl_VII    ),
    .am         ( am        ),
    .ams_VII    ( ams_VII   ),
    .amsen_VII  ( amsen_VII ),
    .eg_XI      ( eg_XI )
);

wire signed [13:0] op_out;

jt51_op u_op(
    `ifdef TEST_SUPPORT
    .test_eg        ( test_eg           ),
    .test_op0       ( test_op0          ),
    `endif
    .rst            ( rst               ),
    .clk            ( clk               ),
    .cen            ( cen_p1            ),
    .pg_phase_X     ( ph_X              ),
    .con_I          ( con_I             ),
    .fb_II          ( fb_II             ),
    // volume
    .eg_atten_XI    ( eg_XI             ),
    // modulation
    .m1_enters      ( m1_enters         ),
    .c1_enters      ( c1_enters         ),
    // Operator
    .use_prevprev1  ( use_prevprev1     ),
    .use_internal_x ( use_internal_x    ),
    .use_internal_y ( use_internal_y    ),
    .use_prev2      ( use_prev2         ),
    .use_prev1      ( use_prev1         ),
    .test_214       ( 1'b0              ),
    `ifdef SIMULATION
    .zero           ( zero              ),
    `endif
    // output data
    .op_XVII        ( op_out            )
);

wire [ 4:0] nfrq;
wire [11:0] noise_mix;
wire        ne, op31_acc, op31_no;

jt51_noise u_noise(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen_p1    ),
    .cycles ( cycles    ),
    .nfrq   ( nfrq      ),
    .eg     ( eg_XI     ),
    .op31_no( op31_no   ),
    .out    ( noise     ),
    .mix    ( noise_mix )
);

jt51_acc u_acc(
    .rst        ( rst           ),
    .clk        ( clk           ),
    .cen        ( cen_p1        ),
    .m1_enters  ( m1_enters     ),
    .m2_enters  ( m2_enters     ),
    .c1_enters  ( c1_enters     ),
    .c2_enters  ( c2_enters     ),
    .op31_acc   ( op31_acc      ),
    .rl_I       ( rl_I          ),
    .con_I      ( con_I         ),
    .op_out     ( op_out        ),
    .ne         ( ne            ),
    .noise_mix  ( noise_mix     ),
    .left       ( left          ),
    .right      ( right         ),
    .xleft      ( xleft         ),
    .xright     ( xright        )
);
`else
assign left   = 16'd0;
assign right  = 16'd0;
assign xleft  = 16'd0;
assign xright = 16'd0;
`endif

wire    busy;
wire    write = !cs_n && !wr_n;

assign  dout = { busy, 5'h0, flag_B, flag_A };

jt51_mmr u_mmr(
    .rst        ( rst           ),
    .clk        ( clk           ),
    .cen        ( cen_p1        ),
    .a0         ( a0            ),
    .write      ( write         ),
    .din        ( din           ),
    .busy       ( busy          ),

    .test_mode  ( test_mode     ),
    // CT
    .ct1        ( ct1           ), // the LFO clock can be outputted via CT1 -not implemented-
    .ct2        ( ct2           ),
    // LFO
    .lfo_freq   ( lfo_freq      ),
    .lfo_w      ( lfo_w         ),
    .lfo_amd    ( amd           ),
    .lfo_pmd    ( pmd           ),
    .lfo_up     ( lfo_up        ),

    // Noise
    .ne         ( ne            ),
    .nfrq       ( nfrq          ),

    // Timers
    .value_A    ( value_A       ),
    .value_B    ( value_B       ),
    .load_A     ( load_A        ),
    .load_B     ( load_B        ),
    .enable_irq_A( enable_irq_A ),
    .enable_irq_B( enable_irq_B ),
    .clr_flag_A ( clr_flag_A    ),
    .clr_flag_B ( clr_flag_B    ),
    .overflow_A ( overflow_A    ),
    `ifdef TEST_SUPPORT
    // Test
    .test_eg    ( test_eg       ),
    .test_op0   ( test_op0      ),
    `endif
    // REG
    .rl_I       ( rl_I          ),
    .fb_II      ( fb_II         ),
    .con_I      ( con_I         ),
    .kc_I       ( kc_I          ),
    .kf_I       ( kf_I          ),
    .pms_I      ( pms_I         ),
    .ams_VII    ( ams_VII       ),
    .dt1_II     ( dt1_II        ),
    .mul_VI     ( mul_VI        ),
    .tl_VII     ( tl_VII        ),
    .ks_III     ( ks_III        ),
    .arate_II   ( arate_II      ),
    .amsen_VII  ( amsen_VII     ),
    .rate1_II   ( rate1_II      ),
    .dt2_I      ( dt2_I         ),
    .rate2_II   ( rate2_II      ),
    .d1l_I      ( d1l_I         ),
    .rrate_II   ( rrate_II      ),
    .keyon_II   ( keyon_II      ),

    .cur_op     ( cur_op        ),
    .op31_no    ( op31_no       ),
    .op31_acc   ( op31_acc      ),
    .zero       ( zero          ),
    .half       ( half          ),
    .cycles     ( cycles        ),
    .m1_enters  ( m1_enters     ),
    .m2_enters  ( m2_enters     ),
    .c1_enters  ( c1_enters     ),
    .c2_enters  ( c2_enters     ),
    // Operator
    .use_prevprev1  ( use_prevprev1     ),
    .use_internal_x ( use_internal_x    ),
    .use_internal_y ( use_internal_y    ),
    .use_prev2      ( use_prev2         ),
    .use_prev1      ( use_prev1         )
);

`ifdef SIMULATION
`ifndef VERILATOR
integer fsnd;
initial begin
    fsnd=$fopen("jt51.raw","wb");
end

always @(posedge zero) begin
    $fwrite(fsnd,"%u", {xleft, xright});
end
`endif
`endif

endmodule

