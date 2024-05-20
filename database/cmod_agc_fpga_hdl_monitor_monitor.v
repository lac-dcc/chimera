// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module monitor(
    input wire clk,
    input wire rst_n,

    // FT232 UART interface
    input wire rxd,
    output wire txd,

    // AGC signals
    input wire bplssw_p,
    input wire bplssw_n,
    input wire p4sw_p,
    input wire p4sw_n,
    input wire p3v3io_p,
    input wire p3v3io_n,
    input wire mtemp_p,
    input wire mtemp_n,

    input wire mgojam,
    input wire mstpit_n,
    input wire monwt,
    input wire [12:1] mt,
    input wire [16:1] mwl,

    input wire miip,
    input wire minhl,
    input wire minkl,

    input wire msqext,
    input wire [15:10] msq,
    input wire [3:1] mst,
    input wire [2:1] mbr,

    input wire mrsc,
    input wire mwag,
    input wire mwlg,
    input wire mwqg,
    input wire mwebg,
    input wire mwfbg,
    input wire mwbbeg,
    input wire mwzg,
    input wire mwbg,
    input wire mwsg,
    input wire mwg,
    input wire mwyg,
    input wire mrulog,
    input wire mrgg,
    input wire mrch,
    input wire mwch,
    input wire mnisq,
    input wire msp,
    input wire mgp_n,

    input wire mvfail_n,
    input wire moscal_n,
    input wire mscafl_n,
    input wire mscdbl_n,
    input wire mctral_n,
    input wire mtcal_n,
    input wire mrptal_n,
    input wire mpal_n,
    input wire mwatch_n,
    input wire mpipal_n,
    input wire mwarnf_n,

    output wire mnhsbf,
    output wire mamu,
    output wire [16:1] mdt,
    output wire monpar,

    output wire mstrt,
    output wire mstp,

    output wire mnhrpt,
    output wire mnhnc,
    output wire nhalga,
    output wire nhstrt1,
    output wire nhstrt2,
    output wire doscal,
    output wire dbltst,

    output wire mread,
    output wire mload,
    output wire mrdch,
    output wire mldch,
    output wire mtcsai,
    output wire monwbk,
    input wire mreqin,
    input wire mtcsa_n,

    output wire [6:1] leds,
    output wire [6:1] dbg
);

wire mismatch;
assign dbg[5] = mismatch;
assign dbg[6] = 1'b0;
assign leds[1] = mstpit_n;
assign leds[2] = mnhsbf | mamu;
assign leds[3] = mreqin;
assign leds[4] = mstp;
assign leds[5] = ~mvfail_n;
assign leds[6] = ~moscal_n;

/*******************************************************************************.
* USB Interface                                                                 *
'*******************************************************************************/
// Incoming command from USB, associated validity flag, and read signal
wire [39:0] cmd;
wire cmd_ready;
wire cmd_read_en;
assign dbg[1] = cmd_read_en;
assign dbg[2] = cmd_ready;
assign dbg[3] = 1'b0;
assign dbg[4] = 1'b0;

// Read response message for sending back over USB, and its validity flag
wire [39:0] read_msg;
wire read_msg_ready;

// USB interface
usb_interface usb_if(
    .clk(clk),
    .rst_n(rst_n),
    .rxd(rxd),
    .txd(txd),
    .cmd(cmd),
    .cmd_ready(cmd_ready),
    .cmd_read_en(cmd_read_en),
    .read_msg(read_msg),
    .read_msg_ready(read_msg_ready)
);

/*******************************************************************************.
* Command Controller                                                            *
'*******************************************************************************/
// Address and (if applicable) data associated with the command currently
// being processed
wire [15:0] cmd_addr;
wire [15:0] cmd_data;

// Control Registers control signals
wire ctrl_read_en;
wire ctrl_write_en;
wire ctrl_write_done;
wire [15:0] ctrl_data;

wire status_read_en;
wire status_write_en;
wire [15:0] status_data;

wire mon_reg_read_en;
wire [15:0] mon_reg_data;

wire mon_chan_read_en;
wire [15:0] mon_chan_data;

wire mon_dsky_read_en;
wire mon_dsky_write_en;
wire [15:0] mon_dsky_data;

wire agc_fixed_read_en;
wire agc_fixed_read_done;
wire [15:0] agc_fixed_data;

wire agc_erasable_read_en;
wire agc_erasable_read_done;
wire agc_erasable_write_en;
wire agc_erasable_write_done;
wire [15:0] agc_erasable_data;

wire agc_channels_read_en;
wire agc_channels_read_done;
wire agc_channels_write_en;
wire agc_channels_write_done;
wire [15:0] agc_channels_data;

wire crs_read_en;
wire crs_write_en;
wire [15:0] crs_data;

wire ems_read_en;
wire ems_write_en;
wire [15:0] ems_data;

wire trace_read_en;
wire [15:0] trace_data;

wire nassp_read_en;
wire nassp_write_en;
wire nassp_write_done;
wire [15:0] nassp_data;

// Resulting data from the active read command
wire [15:0] read_data;
assign read_data = ctrl_data | status_data | mon_reg_data | mon_chan_data | agc_fixed_data | agc_erasable_data |
                   agc_channels_data | crs_data | ems_data | mon_dsky_data | trace_data | nassp_data;

// Command controller 
cmd_controller cmd_ctrl(
    .clk(clk),
    .rst_n(rst_n),
    .cmd(cmd),
    .cmd_ready(cmd_ready),
    .cmd_read_en(cmd_read_en),
    .cmd_addr(cmd_addr),
    .cmd_data(cmd_data),
    .read_data(read_data),
    .read_msg(read_msg),
    .read_msg_ready(read_msg_ready),
    .ctrl_read_en(ctrl_read_en),
    .ctrl_write_en(ctrl_write_en),
    .ctrl_write_done(ctrl_write_done),
    .status_read_en(status_read_en),
    .status_write_en(status_write_en),
    .mon_reg_read_en(mon_reg_read_en),
    .mon_chan_read_en(mon_chan_read_en),
    .agc_fixed_read_en(agc_fixed_read_en),
    .agc_fixed_read_done(agc_fixed_read_done),
    .agc_erasable_read_en(agc_erasable_read_en),
    .agc_erasable_read_done(agc_erasable_read_done),
    .agc_erasable_write_en(agc_erasable_write_en),
    .agc_erasable_write_done(agc_erasable_write_done),
    .agc_channels_read_en(agc_channels_read_en),
    .agc_channels_read_done(agc_channels_read_done),
    .agc_channels_write_en(agc_channels_write_en),
    .agc_channels_write_done(agc_channels_write_done),
    .crs_read_en(crs_read_en),
    .crs_write_en(crs_write_en),
    .ems_read_en(ems_read_en),
    .ems_write_en(ems_write_en),
    .mon_dsky_read_en(mon_dsky_read_en),
    .mon_dsky_write_en(mon_dsky_write_en),
    .trace_read_en(trace_read_en),
    .nassp_read_en(nassp_read_en),
    .nassp_write_en(nassp_write_en),
    .nassp_write_done(nassp_write_done)
);

/*******************************************************************************.
* Control Registers                                                             *
'*******************************************************************************/
wire start_req;
wire proceed_req;
wire [10:0] stop_conds;
wire stop_s1_s2;
wire [10:0] stop_cause;

wire [12:1] s;
wire [11:9] eb;
wire [15:11] fb;
wire [7:5] fext;

wire s1_match;
wire s2_match;
wire w_match;
wire i_match;

wire [2:0] w_mode;
wire w_s1_s2;
wire [12:1] w_times;
wire [11:0] w_pulses;

wire [16:1] w;
wire [1:0] wp;

wire [12:1] i;

wire s_only;
wire adv_s;
wire ctrl_periph_load;
wire ctrl_periph_read;
wire ctrl_periph_loadch;
wire ctrl_periph_readch;
wire ctrl_periph_tcsaj;
wire [12:1] ctrl_periph_s;
wire [15:1] ctrl_periph_bb;
wire [16:1] ctrl_periph_data;
wire periph_complete;

wire [63:0] crs_bank_en;
wire [7:0] ems_bank_en;

wire downrupt;
wire downrupt_ctrl;
wire downrupt_nassp;
assign downrupt = downrupt_ctrl | downrupt_nassp;
wire handrupt;
wire handrupt_ctrl;
wire handrupt_nassp;
assign handrupt = handrupt_ctrl | handrupt_nassp;

control_regs ctrl_regs(
    .clk(clk),
    .rst_n(rst_n),

    .addr(cmd_addr),
    .data_in(cmd_data),
    .read_en(ctrl_read_en),
    .write_en(ctrl_write_en),
    .write_done(ctrl_write_done),
    .data_out(ctrl_data),
    .start_req(start_req),
    .proceed_req(proceed_req),
    .stop_conds(stop_conds),
    .stop_s1_s2(stop_s1_s2),
    .stop_cause(stop_cause),
    .mnhrpt(mnhrpt),
    .mnhnc(mnhnc),
    .nhalga(nhalga),
    .nhstrt1(nhstrt1),
    .nhstrt2(nhstrt2),
    .doscal(doscal),
    .dbltst(dbltst),

    .downrupt(downrupt_ctrl),
    .handrupt(handrupt_ctrl),

    .s(s),
    .eb(eb),
    .fb(fb),
    .fext(fext),
    .minkl(minkl),
    .minhl(minhl),
    .miip(miip),

    .w(w),
    .wp(wp),
    .i(i),

    .s1_match(s1_match),
    .s2_match(s2_match),
    .w_match(w_match),
    .i_match(i_match),

    .w_mode(w_mode),
    .w_s1_s2(w_s1_s2),
    .w_times(w_times),
    .w_pulses(w_pulses),

    .s_only(s_only),
    .adv_s(adv_s),
    .periph_load(ctrl_periph_load),
    .periph_read(ctrl_periph_read),
    .periph_loadch(ctrl_periph_loadch),
    .periph_readch(ctrl_periph_readch),
    .periph_tcsaj(ctrl_periph_tcsaj),
    .periph_s(ctrl_periph_s),
    .periph_bb(ctrl_periph_bb),
    .periph_data(ctrl_periph_data),
    .periph_complete(periph_complete),

    .crs_bank_en(crs_bank_en),
    .ems_bank_en(ems_bank_en)
);

/*******************************************************************************.
* Status Registers                                                              *
'*******************************************************************************/
wire [16:1] mismatch_faddr;
wire [16:1] mismatch_data;
status_regs stat_regs(
    .clk(clk),
    .rst_n(rst_n),

    .addr(cmd_addr),
    .data_in(cmd_data),
    .read_en(status_read_en),
    .write_en(status_write_en),
    .data_out(status_data),

    .bplssw_p(bplssw_p),
    .bplssw_n(bplssw_n),
    .p4sw_p(p4sw_p),
    .p4sw_n(p4sw_n),
    .p3v3io_p(p3v3io_p),
    .p3v3io_n(p3v3io_n),
    .mtemp_p(mtemp_p),
    .mtemp_n(mtemp_n),

    .mt05(mt[5]),
    .mt08(mt[8]),

    .mvfail_n(mvfail_n),
    .moscal_n(moscal_n),
    .mscafl_n(mscafl_n),
    .mscdbl_n(mscdbl_n),
    .mctral_n(mctral_n),
    .mtcal_n(mtcal_n),
    .mrptal_n(mrptal_n),
    .mpal_n(mpal_n),
    .mwatch_n(mwatch_n),
    .mpipal_n(mpipal_n),
    .mwarnf_n(mwarnf_n),

    .mnhsbf(mnhsbf),
    .mamu(mamu),
    .mload(mload),
    .mldch(mldch),
    .mread(mread),
    .mrdch(mrdch),

    .mismatch_faddr(mismatch_faddr),
    .mismatch_data(mismatch_data)
);

/*******************************************************************************.
* Start/Stop Logic                                                              *
'*******************************************************************************/
wire mrchg;
wire mwchg;
wire ss_mstp;
wire mstp_nassp;
wire inhibit_mstp;
assign mstp = (ss_mstp | mstp_nassp) & ~inhibit_mstp;
start_stop strt_stp(
    .clk(clk),
    .rst_n(rst_n),
    .start_req(start_req),
    .proceed_req(proceed_req),
    .stop_conds(stop_conds),
    .stop_s1_s2(stop_s1_s2),
    .stop_cause(stop_cause),
    .mt01(mt[1]),
    .mt12(mt[12]),
    .mgojam(mgojam),
    .mnisq(mnisq),
    .mpal_n(mpal_n),
    .mrchg(mrchg),
    .mwchg(mwchg),

    .s1_match(s1_match),
    .s2_match(s2_match),
    .w_match(w_match),
    .i_match(i_match),

    .mstrt(mstrt),
    .mstp(ss_mstp)
);

/*******************************************************************************.
* Clear Timer                                                                   *
'*******************************************************************************/
wire ct;
clear_timer ctmr(
    .clk(clk),
    .rst_n(rst_n),
    .monwt(monwt),
    .ct(ct)
);

/*******************************************************************************.
* Monitor Registers                                                             *
'*******************************************************************************/
wire [15:10] sq;
wire [16:1] l;
wire [16:1] q;
wire [16:1] z;
wire [16:1] g;
wire [16:1] b;
wire [16:1] y;
wire [16:1] u;
wire [11:9] true_eb;
wire [15:11] true_fb;
wire [12:1] true_s;
wire inhibit_ws;
wire rbbk;
monitor_regs mon_regs(
    .clk(clk),
    .rst_n(rst_n),

    .mt(mt),
    .monwt(monwt),
    .ct(ct),
    .mwl(mwl),
    .mwag(mwag),
    .mwlg(mwlg),
    .mwqg(mwqg),
    .mwebg(mwebg),
    .mwfbg(mwfbg),
    .mwbbeg(mwbbeg),
    .mwzg(mwzg),
    .mwbg(mwbg),
    .mwsg(mwsg),
    .mwg(mwg),
    .mwyg(mwyg),
    .mrulog(mrulog),
    .mrgg(mrgg),
    .mwchg(mwchg),
    .mrchg(mrchg),

    .inhibit_ws(inhibit_ws),
    .rbbk(rbbk),
    .s_only(s_only),
    .adv_s(adv_s),

    .msqext(msqext),
    .msq(msq),
    .mst(mst),
    .mbr(mbr),

    .mgojam(mgojam),
    .mstpit_n(mstpit_n),
    .miip(miip),
    .minhl(minhl),
    .minkl(minkl),
    .mnisq(mnisq),
    .msp(msp),
    .mgp_n(mgp_n),

    .mstp(mstp),

    .s1_match(s1_match),
    .s2_match(s2_match),
    .i_match(i_match),

    .w_mode(w_mode),
    .w_s1_s2(w_s1_s2),
    .w_times(w_times),
    .w_pulses(w_pulses),

    .sq(sq),
    .l(l),
    .q(q),
    .z(z),
    .s(s),
    .eb(eb),
    .fb(fb),
    .g(g),
    .b(b),
    .y(y),
    .u(u),

    .w(w),
    .wp(wp),
    .i(i),

    .true_eb(true_eb),
    .true_fb(true_fb),
    .true_s(true_s),

    .read_en(mon_reg_read_en),
    .addr(cmd_addr),
    .data_out(mon_reg_data)
);

/*******************************************************************************.
* Monitor AGC Channel Mirrors                                                   *
'*******************************************************************************/
wire [9:1] chan77;
wire [15:1] out0;
wire [15:1] dsalmout;
wire [15:1] chan13;
monitor_channels mon_chans(
    .clk(clk),
    .rst_n(rst_n),

    .monwt(monwt),
    .ct(ct),

    .mrch(mrch),
    .mwch(mwch),
    .ch(s[9:1]),
    .mwl({mwl[16], mwl[14:1]}),
    .l({l[16], l[14:1]}),
    .q({q[16], q[14:1]}),
    .chan77(chan77),

    .mrchg(mrchg),
    .mwchg(mwchg),
    .fext(fext),
    .out0(out0),
    .dsalmout(dsalmout),
    .chan13(chan13),

    .read_en(mon_chan_read_en),
    .addr(cmd_addr),
    .data_out(mon_chan_data)
);

/*******************************************************************************.
* Restart Monitor                                                               *
'*******************************************************************************/
wire [16:1] mdt_chan77;
restart_monitor restart_mon(
    .clk(clk),
    .rst_n(rst_n),

    .mt05(mt[5]),
    .mrchg(mrchg),
    .mwchg(mwchg),
    .ch(s[9:1]),
    .mpal_n(mpal_n),
    .mtcal_n(mtcal_n),
    .mrptal_n(mrptal_n),
    .mwatch_n(mwatch_n),
    .mvfail_n(mvfail_n),
    .mctral_n(mctral_n),
    .mscafl_n(mscafl_n),
    .mscdbl_n(mscdbl_n),

    .chan77(chan77),
    .mdt(mdt_chan77)
);

/*******************************************************************************.
* Peripheral Instructions                                                       *
'*******************************************************************************/
wire agc_fixed_periph_read;
wire agc_fixed_periph_loadch;
wire [12:1] agc_fixed_periph_s;
wire [15:1] agc_fixed_periph_bb;
wire [16:1] agc_fixed_periph_data;

wire agc_erasable_periph_read;
wire agc_erasable_periph_load;
wire [12:1] agc_erasable_periph_s;
wire [15:1] agc_erasable_periph_bb;
wire [16:1] agc_erasable_periph_data;

wire agc_channels_periph_readch;
wire agc_channels_periph_loadch;
wire [12:1] agc_channels_periph_s;
wire [16:1] agc_channels_periph_data;

wire nassp_periph_load;
wire [12:1] nassp_periph_s;
wire [15:1] nassp_periph_bb;
wire [16:1] nassp_periph_data;

wire periph_load;
wire periph_read;
wire periph_loadch;
wire periph_readch;
wire periph_tcsaj;
wire [15:1] periph_bb;
wire [12:1] periph_s;
wire [16:1] periph_data;
wire [16:1] mdt_periph;
wire [16:1] periph_read_data;
wire periph_read_parity;

assign periph_load = ctrl_periph_load | agc_erasable_periph_load | nassp_periph_load;
assign periph_read = ctrl_periph_read | agc_fixed_periph_read | agc_erasable_periph_read;
assign periph_loadch = ctrl_periph_loadch | agc_fixed_periph_loadch | agc_channels_periph_loadch;
assign periph_readch = ctrl_periph_readch | agc_channels_periph_readch;
assign periph_tcsaj = ctrl_periph_tcsaj;
assign periph_bb = ctrl_periph_bb | agc_fixed_periph_bb | agc_erasable_periph_bb | nassp_periph_bb;
assign periph_s = ctrl_periph_s | agc_fixed_periph_s | agc_erasable_periph_s | agc_channels_periph_s | nassp_periph_s;
assign periph_data = ctrl_periph_data | agc_fixed_periph_data | agc_erasable_periph_data | agc_channels_periph_data | nassp_periph_data;

peripheral_instructions periph_insts(
    .clk(clk),
    .rst_n(rst_n),

    .monwt(monwt),
    .mt(mt),
    .mst(mst),
    .mwl(mwl),
    .msp(msp),

    .inhibit_mstp(inhibit_mstp),
    .inhibit_ws(inhibit_ws),
    .rbbk(rbbk),

    .mreqin(mreqin),
    .mtcsa_n(mtcsa_n),

    .load(periph_load),
    .read(periph_read),
    .loadch(periph_loadch),
    .readch(periph_readch),
    .tcsaj(periph_tcsaj),

    .bb(periph_bb),
    .s(periph_s),
    .data(periph_data),

    .read_data(periph_read_data),
    .read_parity(periph_read_parity),
    .complete(periph_complete),

    .mtcsai(mtcsai),
    .mread(mread),
    .mload(mload),
    .mrdch(mrdch),
    .mldch(mldch),
    .monwbk(monwbk),

    .mdt(mdt_periph)
);

/*******************************************************************************.
* AGC Fixed Memory                                                              *
'*******************************************************************************/
agc_fixed fixed(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(agc_fixed_read_en),
    .read_done(agc_fixed_read_done),
    .addr(cmd_addr),
    .data_out(agc_fixed_data),

    .periph_read(agc_fixed_periph_read),
    .periph_loadch(agc_fixed_periph_loadch),
    .periph_s(agc_fixed_periph_s),
    .periph_bb(agc_fixed_periph_bb),
    .periph_data(agc_fixed_periph_data),
    .periph_read_data(periph_read_data),
    .periph_read_parity(periph_read_parity),
    .periph_complete(periph_complete),

    .fext(fext)
);

/*******************************************************************************.
* AGC Erasable Memory                                                           *
'*******************************************************************************/
agc_erasable erasable(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(agc_erasable_read_en),
    .read_done(agc_erasable_read_done),
    .write_en(agc_erasable_write_en),
    .write_done(agc_erasable_write_done),
    .addr(cmd_addr),
    .data_in(cmd_data),
    .data_out(agc_erasable_data),

    .periph_read(agc_erasable_periph_read),
    .periph_load(agc_erasable_periph_load),
    .periph_s(agc_erasable_periph_s),
    .periph_bb(agc_erasable_periph_bb),
    .periph_data(agc_erasable_periph_data),
    .periph_read_data(periph_read_data),
    .periph_read_parity(periph_read_parity),
    .periph_complete(periph_complete)
);

/*******************************************************************************.
* AGC Channels                                                                  *
'*******************************************************************************/
agc_channels channels(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(agc_channels_read_en),
    .read_done(agc_channels_read_done),
    .write_en(agc_channels_write_en),
    .write_done(agc_channels_write_done),
    .addr(cmd_addr),
    .data_in(cmd_data),
    .data_out(agc_channels_data),

    .periph_readch(agc_channels_periph_readch),
    .periph_loadch(agc_channels_periph_loadch),
    .periph_s(agc_channels_periph_s),
    .periph_data(agc_channels_periph_data),
    .periph_read_data(periph_read_data),
    .periph_complete(periph_complete)
);

/*******************************************************************************.
* Core Rope Simulation                                                          *
'*******************************************************************************/
wire mnhsbf_rupts;
wire mnhsbf_crs;
wire [16:1] mdt_crs;
wire monpar_crs;

core_rope_sim crs(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(crs_read_en),
    .write_en(crs_write_en),
    .addr(cmd_addr),
    .data_in(cmd_data),
    .data_out(crs_data),

    .bank_en(crs_bank_en),
    .mnhsbf_rupts(mnhsbf_rupts),
    
    .fext(fext),
    .fb(true_fb),
    .s(true_s),

    .mt02(mt[2]),
    .mt04(mt[4]),
    .mt07(mt[7]),
    .mrsc(mrsc),
    .mwg(mwg),

    .mnhsbf(mnhsbf_crs),
    .mdt(mdt_crs),
    .monpar(monpar_crs),

    .mrgg(mrgg),
    .g(g),
    .mismatch(mismatch),
    .mismatch_faddr(mismatch_faddr),
    .mismatch_data(mismatch_data)
);

/*******************************************************************************.
* Erasable Memory Simulation                                                    *
'*******************************************************************************/
wire [16:1] mdt_ems;
wire e_cycle_starting;
wire [11:1] e_cycle_addr;

wire nassp_ems_write_en;
wire [11:1] nassp_ems_addr;
wire [16:1] nassp_ems_data;

erasable_mem_sim ems(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(ems_read_en),
    .write_en(ems_write_en),
    .addr(cmd_addr),
    .data_in(cmd_data),
    .data_out(ems_data),

    .bank_en(ems_bank_en),

    .minkl(minkl),
    .mt(mt),
    .msqext(msqext),
    .msq(msq),
    .mst(mst),
    .eb(true_eb),
    .s(true_s),
    .g(g),
    .mgp_n(mgp_n),
    .mrsc(mrsc),
    .mrgg(mrgg),
    .mwg(mwg),
    .mamu(mamu),
    .mdt(mdt_ems),

    .int_write_en(nassp_ems_write_en),
    .int_addr(nassp_ems_addr),
    .int_data(nassp_ems_data),

    .e_cycle_starting(e_cycle_starting),
    .e_cycle_addr(e_cycle_addr)
);

/*******************************************************************************.
* Interrupt Injection                                                           *
'*******************************************************************************/
wire keyrupt1;
wire keyrupt2;
wire monpar_rupts;
wire [16:1] mdt_rupts;

rupt_injector rupts(
    .clk(clk),
    .rst_n(rst_n),

    .keyrupt1(keyrupt1),
    .keyrupt2(keyrupt2),
    .uprupt(1'b0),
    .downrupt(downrupt),
    .handrupt(handrupt),

    .mgojam(mgojam),
    .mt(mt),
    .mst(mst),
    .msqext(msqext),
    .sq(sq),
    .miip(miip),
    .mrgg(mrgg),
    .mwbg(mwbg),
    .mwl(mwl),

    .mnhsbf(mnhsbf_rupts),
    .mdt(mdt_rupts),
    .monpar(monpar_rupts)
);


/*******************************************************************************.
* DSKY                                                                          *
'*******************************************************************************/
wire [16:1] mdt_dsky;

monitor_dsky mon_dsky(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(mon_dsky_read_en),
    .write_en(mon_dsky_write_en),
    .addr(cmd_addr),
    .data_in(cmd_data),
    .data_out(mon_dsky_data),

    .mgojam(mgojam),
    .mt(mt),
    .msqext(msqext),
    .sq(sq),
    .mrchg(mrchg),
    .ch(s[9:1]),

    .out0(out0),
    .dsalmout(dsalmout),
    .chan13(chan13),

    .mdt(mdt_dsky),

    .keyrupt1(keyrupt1),
    .keyrupt2(keyrupt2)
);

/*******************************************************************************.
* Instruction Trace                                                             *
'*******************************************************************************/
instruction_trace trace(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(trace_read_en),
    .addr(cmd_addr),
    .data_out(trace_data),

    .mnisq(mnisq),
    .minkl(minkl),
    .minhl(minhl),
    .miip(miip),
    .mreqin(mreqin),
    .mt(mt),
    .mst(mst),

    .msqext(msqext),
    .g(g),
    .b(b),
    .z(z),
    .s(s),
    .y(y),
    .u(u),
    .fext(fext),
    .fb(fb),
    .eb(eb),

    .w(w)
);

/*******************************************************************************.
* NASSP Bridge                                                                  *
'*******************************************************************************/
wire [16:1] mdt_nassp;
nassp_bridge nassp(
    .clk(clk),
    .rst_n(rst_n),

    .read_en(nassp_read_en),
    .write_en(nassp_write_en),
    .write_done(nassp_write_done),
    .addr(cmd_addr),
    .data_in(cmd_data),
    .data_out(nassp_data),

    .e_cycle_starting(e_cycle_starting),
    .e_cycle_addr(e_cycle_addr),

    .monwt(monwt),
    .mt(mt),
    .mnisq(mnisq),
    .minkl(minkl),
    .mst(mst),
    .msqext(msqext),
    .mrgg(mrgg),
    .mwbg(mwbg),
    .mwsg(mwsg),
    .mrchg(mrchg),
    .mwchg(mwchg),
    .ch(s[9:1]),
    .g(g),
    .mwl(mwl),
    .mdt(mdt_nassp),
    .out0(out0),

    .mstpit_n(mstpit_n),
    .mstp(mstp_nassp),

    .ems_bank0_en(ems_bank_en[0]),
    .ems_write_en(nassp_ems_write_en),
    .ems_addr(nassp_ems_addr),
    .ems_data(nassp_ems_data),

    .handrupt(handrupt_nassp),
    .downrupt(downrupt_nassp),

    .periph_load(nassp_periph_load),
    .periph_s(nassp_periph_s),
    .periph_bb(nassp_periph_bb),
    .periph_data(nassp_periph_data),
    .periph_complete(periph_complete)
);

assign mnhsbf = mnhsbf_crs | mnhsbf_rupts;
assign mdt = mdt_chan77 | mdt_periph | mdt_crs | mdt_ems | mdt_rupts | mdt_dsky | mdt_nassp;
assign monpar = monpar_crs | monpar_rupts;

endmodule
`default_nettype wire
