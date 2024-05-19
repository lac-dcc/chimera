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


module jt51_mmr(
    input           rst,
    input           clk,
    input           cen,        // P1
    input   [7:0]   din,
    input           write,
    input           a0,
    output  reg     busy,

    // Original test bits
    output reg [7:0] test_mode,

    // CT
    output  reg     ct1,
    output  reg     ct2,

    // Noise
    output  reg         ne,
    output  reg [4:0]   nfrq,

    // LFO
    output  reg [7:0]   lfo_freq,
    output  reg [1:0]   lfo_w,
    output  reg [6:0]   lfo_amd,
    output  reg [6:0]   lfo_pmd,
    output  reg         lfo_up,
    // Timers
    output  reg [9:0]   value_A,
    output  reg [7:0]   value_B,
    output  reg         load_A,
    output  reg         load_B,
    output  reg         enable_irq_A,
    output  reg         enable_irq_B,
    output  reg         clr_flag_A,
    output  reg         clr_flag_B,
    input               overflow_A,

    `ifdef TEST_SUPPORT
    // Test
    output  reg     test_eg,
    output  reg     test_op0,
    `endif
    // REG
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
    output  [4:0]   arate_II,
    output          amsen_VII,
    output  [4:0]   rate1_II,
    output  [1:0]   dt2_I,
    output  [4:0]   rate2_II,
    output  [3:0]   d1l_I,
    output  [3:0]   rrate_II,
    output          keyon_II,

    output  [1:0]   cur_op,
    output          op31_no,
    output          op31_acc,

    output          zero,       // high once per round
    output          half,       // high twice per round
    output  [4:0]   cycles,
    output          m1_enters,
    output          m2_enters,
    output          c1_enters,
    output          c2_enters,
    // Operator
    output          use_prevprev1,
    output          use_internal_x,
    output          use_internal_y,
    output          use_prev2,
    output          use_prev1
);

reg [7:0] reg_sel, op_din, ch_din;

reg       up_rl,  up_kc,  up_kf,  up_pms,
          up_dt1, up_tl,  up_ks,  up_dt2,
          up_d1l, up_keyon,   up_amsen;
reg [1:0] up_op;
reg [2:0] up_ch;

`ifdef SIMULATION
reg mmr_dump;
`endif

parameter   REG_TEST    =   8'h01,
            REG_TEST2   =   8'h02,
            REG_KON     =   8'h08,
            REG_NOISE   =   8'h0f,
            REG_CLKA1   =   8'h10,
            REG_CLKA2   =   8'h11,
            REG_CLKB    =   8'h12,
            REG_TIMER   =   8'h14,
            REG_LFRQ    =   8'h18,
            REG_PMDAMD  =   8'h19,
            REG_CTW     =   8'h1b,
            REG_DUMP    =   8'h1f;

reg csm;

always @(posedge clk, posedge rst) begin : memory_mapped_registers
    if( rst ) begin
        reg_sel   <= 8'h0;
        { up_rl, up_kc, up_kf, up_pms, up_dt1, up_tl,
                up_ks, up_amsen, up_dt2, up_d1l, up_keyon } <= 11'd0;
        `ifdef TEST_SUPPORT
        { test_eg, test_op0 } <= 2'd0;
        `endif
        // noise
        nfrq <= 5'b0;
        ne   <= 1'b0;
        // timers
        { value_A, value_B } <= 18'd0;
        { clr_flag_B, clr_flag_A,
        enable_irq_B, enable_irq_A, load_B, load_A } <= 6'd0;
        // LFO
        { lfo_amd, lfo_pmd }    <= 14'h0;
        lfo_up          <= 1'b0;
        lfo_freq        <= 8'd0;
        lfo_w           <= 2'd0;
        { ct2, ct1 }    <= 2'd0;
        csm             <= 1'b0;
        op_din          <= 8'd0;
        test_mode       <= 8'd0;
        `ifdef SIMULATION
        mmr_dump <= 1'b0;
        `endif
    end else begin
        // WRITE IN REGISTERS
        if( write ) begin
            up_rl  <= 0;    // channel data is written in one clock cycle
            up_kc  <= 0;
            up_kf  <= 0;
            up_pms <= 0;
            if( !a0 )
                reg_sel <= din;
            else begin
                up_dt1   <= 1'b0;   // operator data is updated via CSR
                up_tl    <= 1'b0;
                up_ks    <= 1'b0;
                up_amsen <= 1'b0;
                up_dt2   <= 1'b0;
                up_d1l   <= 1'b0;
                up_keyon <= 1'b0;
                // Global registers
                if( reg_sel < 8'h20 ) begin
                    case( reg_sel)
                    // registros especiales
                    REG_TEST:   test_mode <= din; // regardless of din
                    `ifdef TEST_SUPPORT
                    REG_TEST2:  { test_op0, test_eg } <= din[1:0];
                    `endif
                    REG_KON:    begin
                        up_keyon <= 1'b1;
                        op_din   <= din;
                    end
                    REG_NOISE:  { ne, nfrq } <= { din[7], din[4:0] };
                    REG_CLKA1:  value_A[9:2] <= din;
                    REG_CLKA2:  value_A[1:0] <= din[1:0];
                    REG_CLKB:   value_B      <= din;
                    REG_TIMER: begin
                        csm <= din[7];
                        { clr_flag_B, clr_flag_A,
                          enable_irq_B, enable_irq_A,
                          load_B, load_A } <= din[5:0];
                        end
                    REG_LFRQ: begin
                        lfo_freq <= din;
                        lfo_up   <= 1;
                    end
                    REG_PMDAMD: begin
                        if( !din[7] )
                            lfo_amd <= din[6:0];
                        else
                            lfo_pmd <= din[6:0];
                        end
                    REG_CTW: begin
                        { ct2, ct1 } <= din[7:6];
                        lfo_w        <= din[1:0];
                        end
                    `ifdef SIMULATION
                    REG_DUMP:
                        mmr_dump <= 1'b1;
                    `endif
                    default:;
                    endcase
                end else
                if( reg_sel < 8'h40 ) begin
                    // channel registers
                    ch_din <= din;
                    case( reg_sel[4:3] )
                        2'h0: up_rl <= 1'b1;
                        2'h1: up_kc <= 1'b1;
                        2'h2: up_kf <= 1'b1;
                        2'h3: up_pms<= 1'b1;
                    endcase
                end else begin
                    // operator registers
                    up_op  <= reg_sel[4:3]; // operator to update
                    up_ch  <= reg_sel[2:0]; // channel to update
                    op_din <= din;
                    case( reg_sel[7:5] )
                        3'h2: up_dt1    <= 1'b1;
                        3'h3: up_tl     <= 1'b1;
                        3'h4: up_ks     <= 1'b1;
                        3'h5: up_amsen  <= 1'b1;
                        3'h6: up_dt2    <= 1'b1;
                        3'h7: up_d1l    <= 1'b1;
                        default:;
                    endcase
                end
            end
        end
        else begin /* clear once-only bits */
            `ifdef SIMULATION
            mmr_dump <= 1'b0;
            `endif
            csm     <= 0;
            lfo_up  <= 0;
            { clr_flag_B, clr_flag_A } <= 2'd0;
        end
    end
end

reg  [4:0] busy_cnt; // busy lasts for 32 synth clock cycles
reg        write_l;
//wire [5:0] nx_busy = {1'd0,busy_cnt}+{5'd0,busy};

always @(posedge clk)
    if( rst ) begin
        busy <= 1'b0;
        busy_cnt <= 5'd0;
    end
    else begin
        write_l <= write;
        if (write_l && !write && a0 ) begin // only set for data writes
            busy <= 1'b1;
            busy_cnt <= 5'd0;
        end
        else if(cen) begin
            if( busy_cnt == 5'd31 ) busy <= 1'b0;
            busy_cnt <= busy_cnt+5'd1;
        end
end

jt51_reg u_reg(
    .rst        ( rst       ),
    .clk        ( clk       ),      // P1
    .cen        ( cen       ),      // P1

    // operator updates
    .up_dt1     ( up_dt1    ),
    .up_tl      ( up_tl     ),
    .up_ks      ( up_ks     ),
    .up_amsen   ( up_amsen  ),
    .up_dt2     ( up_dt2    ),
    .up_d1l     ( up_d1l    ),
    .op         ( up_op     ),      // operator to update
    .ch         ( up_ch     ),      // channel to update
    .op_din     ( op_din    ),
    // channel updates
    .up_rl      ( up_rl     ),
    .up_kc      ( up_kc     ),
    .up_kf      ( up_kf     ),
    .up_pms     ( up_pms    ),
    .ch_sel     (reg_sel[2:0]),     // channel is updated directly off the bus
    .ch_din     ( ch_din    ),

    .up_keyon   ( up_keyon  ),

    .csm        ( csm       ),
    .overflow_A ( overflow_A),

    .rl_I       ( rl_I      ),
    .fb_II      ( fb_II     ),
    .con_I      ( con_I     ),

    .kc_I       ( kc_I      ),
    .kf_I       ( kf_I      ),
    .pms_I      ( pms_I     ),
    .ams_VII    ( ams_VII   ),

    .dt1_II     ( dt1_II    ),
    .dt2_I      ( dt2_I     ),
    .mul_VI     ( mul_VI    ),
    .tl_VII     ( tl_VII    ),
    .ks_III     ( ks_III    ),

    .arate_II   ( arate_II  ),
    .amsen_VII  ( amsen_VII ),
    .rate1_II   ( rate1_II  ),
    .rate2_II   ( rate2_II  ),
    .rrate_II   ( rrate_II  ),
    .d1l_I      ( d1l_I     ),
    .keyon_II   ( keyon_II  ),

    .cur_op     ( cur_op    ),
    .op31_no    ( op31_no   ),
    .op31_acc   ( op31_acc  ),
    .zero       ( zero      ),
    .half       ( half      ),
    .cycles     ( cycles    ),
    .m1_enters  ( m1_enters ),
    .m2_enters  ( m2_enters ),
    .c1_enters  ( c1_enters ),
    .c2_enters  ( c2_enters ),
    // Operator
    .use_prevprev1  ( use_prevprev1     ),
    .use_internal_x ( use_internal_x    ),
    .use_internal_y ( use_internal_y    ),
    .use_prev2      ( use_prev2         ),
    .use_prev1      ( use_prev1         )
);

`ifdef SIMULATION
`ifndef VERILATOR
integer fdump;
integer clk_count;
initial begin
    clk_count=0;
    fdump=$fopen("jt51_cmd.txt","w");
end

always @(posedge clk) clk_count <= clk_count+1;

always @(posedge write) begin
    $fdisplay(fdump,"%d,%d,%X",clk_count,a0,din);
end
`endif
`endif


`ifdef JT51_DEBUG
`ifdef SIMULATION
/* verilator lint_off PINMISSING */
wire [4:0] cnt_aux;

sep32_cnt u_sep32_cnt (.clk(clk), .cen(cen), .zero(zero), .cnt(cnt_aux));

sep32 #(.width(2),.stg(1)) sep_rl (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( rl_I     ));
sep32 #(.width(3),.stg(2)) sep_fb (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( fb_II    ));
sep32 #(.width(3),.stg(1)) sep_con(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( con_I    ));

sep32 #(.width(7),.stg(1)) sep_kc (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( kc_I     ));
sep32 #(.width(6),.stg(1)) sep_kf (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( kf_I     ));
sep32 #(.width(3),.stg(1)) sep_pms(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( pms_I    ));
sep32 #(.width(2),.stg(7)) sep_ams(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( ams_VII  ));

sep32 #(.width(3),.stg(2)) sep_dt1(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( dt1_II   ));
sep32 #(.width(2),.stg(1)) sep_dt2(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( dt2_I    ));
sep32 #(.width(4),.stg(6)) sep_mul(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( mul_VI   ));
sep32 #(.width(7),.stg(7)) sep_tl (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( tl_VII   ));
sep32 #(.width(2),.stg(3)) sep_ks (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( ks_III   ));

sep32 #(.width(5),.stg(2)) sep_ar (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( arate_II ));
sep32 #(.width(1),.stg(7)) sep_ame(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( amsen_VII));
sep32 #(.width(5),.stg(2)) sep_dr1(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( rate1_II ));
sep32 #(.width(5),.stg(2)) sep_dr2(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( rate2_II ));
sep32 #(.width(4),.stg(2)) sep_rr (.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( rrate_II ));
sep32 #(.width(4),.stg(1)) sep_d1l(.clk(clk),.cnt(cnt_aux),.cen(cen),.mixed( d1l_I    ));
`endif
`endif

endmodule
