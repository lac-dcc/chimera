// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341404507891040852(
  input [7:0] io_in, 
  output [7:0] io_out
);

    wire cfg_mode, cfg_frameinc, cfg_framestrb, cfg_dataclk;
    wire [3:0] cfg_sel;

    sky130_fd_sc_hd__clkbuf_2 mode_clkbuf(.A(io_in[0]), .X(cfg_mode));
    sky130_fd_sc_hd__clkbuf_2 frameinc_clkbuf(.A(io_in[1]), .X(cfg_frameinc));
    sky130_fd_sc_hd__clkbuf_2 framestrb_clkbuf(.A(io_in[2]), .X(cfg_framestrb));
    sky130_fd_sc_hd__clkbuf_4 data_clkbuf(.A(io_in[3]), .X(cfg_dataclk));

    sky130_fd_sc_hd__buf_2 sel_buf[3:0] (.A(io_in[7:4]), .X(cfg_sel));

    localparam W = 3;
    localparam H = 5;
    localparam FW = W * 4;
    localparam FH = H * 2;

    reg [$clog2(FH)-1:0] frame_ctr;
    reg [FW-1:0] frame_sr;

    always @(posedge cfg_frameinc, negedge cfg_mode)
        if (~cfg_mode)
            frame_ctr <= 0;
        else
            frame_ctr <= frame_ctr + 1'b1;

    // avoid a shift register for the frame data because that's the highest hold risk
    always @(posedge cfg_dataclk, posedge cfg_frameinc)
        if (cfg_frameinc)
            frame_sr <= 0;
        else
            frame_sr[cfg_sel] = 1'b1;

    wire [FH-1:0] frame_strb;
    wire gated_strobe = cfg_mode & cfg_framestrb;
    generate;
        genvar ii;
        for (ii = 0; ii < FH; ii = ii + 1'b1) begin
            //make sure this is glitch free
            sky130_fd_sc_hd__nand2_2 cfg_nand (.A(gated_strobe), .B(frame_ctr == ii), .Y(frame_strb[ii]));
        end
    endgenerate

    wire fab_clk;
    wire [3:0] fab_din;
    sky130_fd_sc_hd__clkbuf_4 fab_clkbuf(.A(io_in[3]), .X(fab_clk));
    sky130_fd_sc_hd__buf_1 din_buf[3:0] (.A(io_in[7:4]), .X(fab_din));

    wire [0:W-1] cell_q[0:H-1];
    generate
        genvar xx;
        genvar yy;
        for (yy = 0; yy < H; yy = yy + 1'b1) begin: y_c
            for (xx = 0; xx < W; xx = xx + 1'b1) begin: x_c
                wire ti, bi, li, ri;
                if (yy > 0) assign ti = cell_q[yy-1][xx]; else assign ti = fab_din[xx];
                if (yy < H-1) assign bi = cell_q[yy+1][xx]; else assign bi = cell_q[yy][xx];
                if (xx > 0) assign li = cell_q[yy][xx-1]; else assign li = fab_din[yy >= 4 ? 3 : yy];
                if (xx < W-1) assign ri = cell_q[yy][xx+1]; else assign ri = cell_q[yy][xx];
                logic_cell_341404507891040852 #(.has_ff(xx[0] ^ yy[0])) lc_i (
                    .CLK(fab_clk),
                    .cfg_strb(frame_strb[yy * 2 +: 2]),
                    .cfg_data(frame_sr[xx * 4 +: 4]),
                    .T(ti), .B(bi), .L(li),. R(ri),
                    .Q(cell_q[yy][xx])
                );
            end
        end
    endgenerate

    assign io_out = {cell_q[4][W-1], cell_q[3][W-1], cell_q[2][W-1], cell_q[1][W-1], cell_q[0][W-1], cell_q[H-1]};


endmodule

module logic_cell_341404507891040852 (
    input CLK,
    input [1:0] cfg_strb,
    input [3:0] cfg_data,
    input T, L, R, B,
    output Q
);
    parameter has_ff = 1'b0;
    // config storage
    wire [7:0] cfg;
    generate
    genvar ii, jj;
        for (ii = 0; ii < 2; ii = ii + 1'b1)
            for (jj = 0; jj < 4; jj = jj + 1'b1)
                sky130_fd_sc_hd__dlxtn_1 cfg_lat_i (
                    .D(cfg_data[jj]),
                    .GATE_N(cfg_strb[ii]),
                    .Q(cfg[ii*4 + jj])
                );
    endgenerate

    wire i0, i1;
    // I input muxes
    wire i0a, i0b;
    sky130_fd_sc_hd__nand2_1 i0muxa0 (
        .A(T), .B(cfg[0]),
        .Y(i0a)
    );
    sky130_fd_sc_hd__mux2i_1 i0muxa1 (
        .A0(R), .A1(L), .S(cfg[0]),
        .Y(i0b)
    );

    sky130_fd_sc_hd__mux2i_1 i0muxb (
        .A0(i0a), .A1(i0b), .S(cfg[1]),
        .Y(i0)
    );

    wire i1a, i1b;
    sky130_fd_sc_hd__and2_1 i1muxa0 (
        .A(cfg[2]), .B(L),
        .X(i1a)
    );
    sky130_fd_sc_hd__mux2i_1 i1muxa1 (
        .A0(B), .A1(R), .S(cfg[2]),
        .Y(i1b)
    );
    sky130_fd_sc_hd__mux2i_1 i1muxb (
        .A0(i1a), .A1(i1b), .S(cfg[3]),
        .Y(i1)
    );
    // S input mux
    wire s0s, s0, s0a, s0b;

    sky130_fd_sc_hd__nand2_1 s0muxa0 (
        .A(T), .B(cfg[4]),
        .Y(s0a)
    );
    sky130_fd_sc_hd__mux2i_1 s0muxa1 (
        .A0(R), .A1(L), .S(cfg[4]),
        .Y(s0b)
    );

    sky130_fd_sc_hd__mux2i_1 s0muxb (
        .A0(s0a), .A1(s0b), .S(cfg[5]),
        .Y(s0s)
    );
    // S invert
    sky130_fd_sc_hd__xnor2_1 sinv (
        .A(s0s), .B(cfg[6]), .Y(s0)
    );
    // The logic element
    wire muxo_n;
    sky130_fd_sc_hd__mux2i_1 lmux (
        .A0(i0), .A1(i1), .S(s0), .Y(muxo_n)
    );
    // The DFF
    generate if (has_ff) begin: dff
        wire dffo_n;
        sky130_fd_sc_hd__dfsbp_1 dff(
            .D(muxo_n),
            .SET_B(cfg_strb[0]),
            .CLK(CLK),
            .Q(dffo_n)
        );
        // The final output mux
        sky130_fd_sc_hd__mux2i_1 ffsel (
            .A0(muxo_n), .A1(dffo_n), .S(cfg[7]), .Y(Q)
        );
    end else begin
        sky130_fd_sc_hd__inv_1 linv (
            .A(muxo_n), .Y(Q)
        );
    end
    endgenerate
endmodule
