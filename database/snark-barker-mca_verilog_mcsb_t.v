`timescale 1ns / 1ps

// TODO:
// Unscramble bus cycles so I don't have to think about
// which address has to go with which transaction.
// Use logic analyzer to get more accurate values
// for bus delays. Do it for both the 50Z and the 95.

//
// SB MCA CPLD - Test bench for main module
// Copyright (c) 2020 Eric Schlaepfer
// This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
// International License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.
//
module mcsb_t;

    // Inputs
    reg cd_setup_l;
    reg chreset;
    reg clk14;
    reg adl_l;
    reg cmd;
    reg m_io;
    reg s0_w_l;
    reg s1_r_l;
    reg [15:0] a;

    wire cms_dtack_l;

    reg irq_in;

    reg arb_grant_l;
    wire tc_l;
    reg dreq;

    // Outputs
    wire cd_sfdbk;
    wire cd_chrdy_l;
    wire ior_l;
    wire iow_l;
    wire latched_a0;
    wire ym_cs_l;
    wire joy_cs_l;
    wire cms1_6_cs_l;
    wire cms7_12_cs_l;
    wire dsp_rst_cs_l;
    wire dav_cs_l;
    wire dsp_wr_cs_l;
    wire dsp_rd_cs_l;

    wire irq_2;
    wire irq_3;
    wire irq_5;
    wire irq_7;


    wire cden;
    wire bufen_l;
    wire bufdir;

    wire dack_l;

    // Bidirs
    wire [7:0] d;

    wire [7:0] d_in;
    reg [7:0] d_out;
    reg d_valid;

    wire preempt_l;
    wire burst_l;
    wire [3:0] arb;

    reg [3:0] arbdriver;

    // Instantiate simulated YM3812
    ym3812tst yamaha (
        .yd(d),
        .ym_cs_l(ym_cs_l),
        .ym_a0(latched_a0),
        .ym_rd_l(ior_l),
        .ym_wr_l(iow_l)
    );

    // Instantiate simulated SAA1099
    saa1099tst cms1 (
        .sd(d),
        .s_cs_l(cms1_6_cs_l),
        .s_a0(latched_a0),
        .s_wr_l(iow_l),
        .dtack_l(cms_dtack_l)
    );

    // Instantiate the Unit Under Test (UUT)
    mcsb uut (
        .cd_setup_l(cd_setup_l),
        .cd_sfdbk(cd_sfdbk),
        .chreset(chreset),
        .clk14(clk14),
        .cd_chrdy_l(cd_chrdy_l),
        .adl_l(adl_l),
        .cmd(cmd),
        .m_io(m_io),
        .s0_w_l(s0_w_l),
        .s1_r_l(s1_r_l),
        .a(a),
        .d(d),
        .preempt_l(preempt_l),
        .burst_l(burst_l),
        .arb(arb),
        .arb_grant_l(arb_grant_l),
        .tc_l(tc_l),
        .dreq(dreq),
        .dack_l(dack_l),
        .ior_l(ior_l),
        .iow_l(iow_l),
        .latched_a0(latched_a0),
        .ym_cs_l(ym_cs_l),
        .joy_cs_l(joy_cs_l),
        .cms1_6_cs_l(cms1_6_cs_l),
        .cms7_12_cs_l(cms7_12_cs_l),
        .dsp_rst_cs_l(dsp_rst_cs_l),
        .dav_cs_l(dav_cs_l),
        .dsp_wr_cs_l(dsp_wr_cs_l),
        .dsp_rd_cs_l(dsp_rd_cs_l),
        .cms_dtack_l(cms_dtack_l),
        .irq_in(irq_in),
        .irq_2(irq_2),
        .irq_3(irq_3),
        .irq_5(irq_5),
        .irq_7(irq_7),
        .bufen_l(bufen_l),
        .bufdir(bufdir)
    );

    always @ (negedge dack_l) begin
        dreq <= 0;
    end

    assign chck_l = 1'b1;
    assign refresh_l = 1'b1;

    assign d_in = d;
    assign d = (d_valid) ? d_out : 8'bZ;

    // DMA stuff
    assign tc_l = 1'b1;
    pullup (burst_l);
    pullup (preempt_l);


    genvar i;
    generate
    for (i = 0; i < 4; i = i + 1) begin
        pullup (arb[i]);
        assign arb[i] = arbdriver[i] ? 1'bZ : 1'b0;
    end
    endgenerate


    task read_cycle;
        input [15:0] next_addr;
        input next_mio;
        begin
            mca_cycle(next_mio, next_addr, 8'h00, 1, 0);
        end
    endtask

    task write_cycle;
        input [15:0] next_addr;
        input [7:0] din;
        input next_mio;
        begin

            mca_cycle(next_mio, next_addr, din, 0, 0);
        end
    endtask

    task pos_write_cycle;
        input [15:0] next_addr;
        input [7:0] din;
        begin
            mca_cycle(0, next_addr, din, 0, 1);
        end
    endtask

    task pos_read_cycle;
        input [15:0] next_addr;
        begin
            mca_cycle(0, next_addr, 8'h00, 1, 1);
        end
    endtask

    // Cycles start right after CMD goes low, when
    // m/io# and s0/s1 and address changes.
    task mca_cycle;
        input next_mio;
        input [15:0] next_addr;
        input [7:0] din;
        input read;
        input pos;
        begin
            #8 m_io = next_mio;
            a = next_addr;
            wait(~cd_chrdy_l);
            #8 s1_r_l = 1;
            s0_w_l = 1;
            #24
            if (pos) begin
                cd_setup_l = 0;
            end
            #120 cmd = 1;
            #8
            if (read) begin
                s1_r_l = 0; // Read or write
            end else begin
                s0_w_l = 0;
            end
            #8 d_valid = 0;
            #8 adl_l = 0;
            #24
// FIXME: sometimes data goes valid after cmd goes low
            if (~read) begin
                d_out = din;
                d_valid = 1;
            end
            #24
            cmd = 0;
            adl_l = 1;
            #8 s1_r_l = 1;
            s0_w_l = 1;
            #8 cd_setup_l = 1;
        end
    endtask

        // Clock
    always #35 clk14 = ~clk14;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,mcsb_t);
        // Initialize Inputs
        arbdriver = 4'b1111;
        d_valid = 0;
        cd_setup_l = 1;
        chreset = 1;
        adl_l = 1;
        cmd = 1;
        m_io = 0;
        s0_w_l = 1;
        s1_r_l = 1;
        a = 0;
        clk14 = 0;

        dreq = 0;
        arb_grant_l = 0;
        irq_in = 0;

        // Wait 100 ns for global reset to finish
        #100;
        chreset = 0;
        #16;
        read_cycle(16'h0000, 1);
        pos_read_cycle(16'h0000);
        read_cycle(16'h00aa, 1);
        pos_read_cycle(16'h0001);
        read_cycle(16'h00bb, 1);
        pos_write_cycle(16'h0003, 8'b10110010); // Value here goes to POS 03
        pos_write_cycle(16'h0002, 8'h01); // Value here goes to POS 02

        read_cycle(16'h0000, 1);
        read_cycle(16'h0389, 0);
        read_cycle(16'h0388, 0);
        read_cycle(16'h0389, 0);
        write_cycle(16'h0388, 8'hCC, 0);
        write_cycle(16'h0389, 8'hDD, 0);
        write_cycle(16'h0234, 8'hEE, 0);
        write_cycle(16'h0200, 8'h11, 0);
        write_cycle(16'h0220, 8'h22, 0);
//        write_cycle(16'h0222, 8'h33, 0);
        write_cycle(16'h0226, 8'h44, 0);
// Add delay here. FIXME: check cd_chrdy_l, wait as long as it is high.
//        #200

        write_cycle(16'h0228, 8'h55, 0);
        write_cycle(16'h022A, 8'h66, 0);
        write_cycle(16'h022C, 8'h77, 0);
        write_cycle(16'h022E, 8'h88, 0);
        // Start DMA request
        dreq = 1;
        write_cycle(16'h0123, 8'h99, 0);
        #25
        arb_grant_l = 1;
        #25
        arbdriver = 4'b0000;
 //       #25 dreq = 1;
        #175
        arb_grant_l = 0;
        // DMA reads from memory, writes to IO
        #16 m_io = 1;
        a = 16'h2000;
        #136
        read_cycle(16'h0000, 1);
        write_cycle(16'h0000, 8'h55, 0); // leave addr data alone
        #200
        arb_grant_l = 1;
        #25
        arb_grant_l = 0;
        read_cycle(16'h0000, 1);
        #200
        irq_in = 1;
        #200
        irq_in = 0;
        #200

        #1 $finish ;
    end

endmodule

