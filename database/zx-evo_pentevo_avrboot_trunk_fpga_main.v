module main(

//--Input/Output Definition----------------------------------------------------

    // clocks
    input fclk,
    output clkz_out,
    input clkz_in,

    // z80
    input iorq_n,
    input mreq_n,
    input rd_n,
    input wr_n,
    input m1_n,
    input rfsh_n,
    input int_n,
    input nmi_n,
    input wait_n,
    output res,

    input [7:0] d,
    input [15:0] a,

    // zxbus and related
    output csrom,
    output romoe_n,
    output romwe_n,

    input rompg0_n,
    input dos_n, // aka rompg1
    input rompg2,
    input rompg3,
    input rompg4,

    input iorqge1,
    input iorqge2,
    output iorq1_n,
    output iorq2_n,

    // DRAM
    input [15:0] rd,
    input [9:0] ra,
    output rwe_n,
    output rucas_n,
    output rlcas_n,
    output rras0_n,
    output rras1_n,

    // video
    input [1:0] vred,
    input [1:0] vgrn,
    input [1:0] vblu,

    input vhsync,
    input vvsync,
    input vcsync,

    // AY control and audio/tape
    input ay_clk,
    output ay_bdir,
    output ay_bc1,

    output beep,

    // IDE
    input [2:0] ide_a,
    input [15:0] ide_d,

    output ide_dir,

    input ide_rdy,

    output ide_cs0_n,
    output ide_cs1_n,
    output ide_rs_n,
    output ide_rd_n,
    output ide_wr_n,

    // VG93 and diskdrive
    input vg_clk,

    output vg_cs_n,
    output vg_res_n,

    input vg_hrdy,
    input vg_rclk,
    input vg_rawr,
    input [1:0] vg_a, // disk drive selection
    input vg_wrd,
    input vg_side,

    input step,
    input vg_sl,
    input vg_sr,
    input vg_tr43,
    input rdat_b_n,
    input vg_wf_de,
    input vg_drq,
    input vg_irq,
    input vg_wd,

    // serial links (atmega-fpga, sdcard)
    output sdcs_n,
    output sddo,
    output sdclk,
    input sddi,

    input spics_n,
    input spick,
    input spido,
    output spidi,
    input spiint_n
);

//--Dummy----------------------------------------------------------------------

    assign iorq1_n = 1'b1;
    assign iorq2_n = 1'b1;

    assign res= 1'b1;

    assign rwe_n   = 1'b1;
    assign rucas_n = 1'b1;
    assign rlcas_n = 1'b1;
    assign rras0_n = 1'b1;
    assign rras1_n = 1'b1;

    assign ay_bdir = 1'b0;
    assign ay_bc1  = 1'b0;

    assign vg_cs_n  = 1'b1;
    assign vg_res_n = 1'b0;

    assign ide_dir=1'b1;
    assign ide_rs_n = 1'b0;
    assign ide_cs0_n = 1'b1;
    assign ide_cs1_n = 1'b1;
    assign ide_rd_n = 1'b1;
    assign ide_wr_n = 1'b1;

    assign clkz_out = 1'b0;

    assign csrom = 1'b0;
    assign romoe_n = 1'b1;
    assign romwe_n = 1'b1;

//--Main wires-----------------------------------------------------------------

    assign sdclk  = spick;
    assign sddo   = spido;
    assign spidi  = sddi;
    assign sdcs_n = spics_n;
    assign beep   = spiint_n;

endmodule
