// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341353780122485332(
  input [7:0] io_in, 
  output [7:0] io_out
);

  // Frame data shift register because we don't have enough pins to load a whole 17-bit config "frame"
  wire frame_sr_clk = io_in[1];
  reg [16:0] frame_sr;

  always @(posedge frame_sr_clk)
    frame_sr <= {frame_sr[15:0], io_in[2]};

  lutram_341353780122485332 #(.K(4)) dut (
    .frame_strobe(io_in[0]),
    .frame_data(frame_sr),
    .write_clk(io_in[1]),
    .write_en(io_in[2]),
    .write_data(io_in[3]),
    .write_addr(io_in[7:4]),
    .lut_i(io_in[6:3]),
    .lut_o(io_out[0])
  );

  assign io_out[7:1] = 6'b0;

endmodule

// Our test LUTRAM cell
module lutram_341353780122485332 #(parameter K=4) (
    input wire frame_strobe,
    input wire [2**K:0] frame_data, // {lut_mode[0], lut_init[W-1:0]}
    input wire write_clk,
    input wire write_en,
    input wire [K-1:0] write_addr,
    input wire write_data,

    input wire [K-1:0] lut_i,
    output wire lut_o
);
    localparam W=2**K;
    wire [W-1:0] lut_data;

    wire lutram_mode, write_strobe;

    // LUTRAM mode config and write pulse gen
    sky130_fd_sc_hd__dlxtp_1 mode_lat_i (
        .D(frame_data[W]),
        .GATE(frame_strobe),
        .Q(lutram_mode),
        .VPWR(1'b1), .VGND(1'b0)
    );

    write_pulse_gen_341353780122485332 pulse_gen_i (
        .clk(write_clk),
        .en(write_en & lutram_mode),
        .q(write_strobe)
    );

    // Storage array
    generate
        genvar ii;
        for (ii = 0; ii < W; ii = ii + 1'b1) begin: lut_loop
            wire bit_sel = (write_addr == ii);
            wire bit_strobe = (bit_sel & write_strobe) | frame_strobe;
            wire bit_d = frame_strobe ? frame_data[ii] : write_data;
            sky130_fd_sc_hd__dlxtp_1 bit_cell_i (
                .D(bit_d),
                .GATE(bit_strobe),
                .Q(lut_data[ii]),
                .VPWR(1'b1), .VGND(1'b0)
            );
        end
    endgenerate

    // LUT output mux
    assign lut_o = lut_data[lut_i];
endmodule

module buffer_chain_341353780122485332 ((* dont_touch *) input A, (* dont_touch *) output X);

    localparam N = 3;

    (* dont_touch *) wire [N:0] c;
    assign c[0] = A;
    assign X = c[N];

    generate
        genvar ii;
        for (ii = 1'b0; ii < N; ii = ii + 1'b1) begin : bufs
            (* keep, dont_touch *) sky130_fd_sc_hd__clkdlybuf4s50_1 buf_i (.A(c[ii]), .X(c[ii + 1'b1]), .VPWR(1'b1), .VGND(1'b0));
        end
    endgenerate

endmodule

module write_pulse_gen_341353780122485332 (input wire clk, input wire en, output wire q);
`ifdef SYNTHESIS
    wire clk_del1, clk_del2, clk_strb;
    (* keep, dont_touch *) buffer_chain_341353780122485332 dly0_i (.A(clk), .X(clk_del1));
    (* keep, dont_touch *) buffer_chain_341353780122485332 dly1_i (.A(clk_del1), .X(clk_del2));
    sky130_fd_sc_hd__and2b_1 cmp_i (.A_N(clk_del2), .B(clk), .X(clk_strb), .VPWR(1'b1), .VGND(1'b0));
    sky130_fd_sc_hd__and2_2 gate_i (.A(clk_strb), .B(en), .X(q), .VPWR(1'b1), .VGND(1'b0));
`else
    reg clk_del, strb_out;
    always @* clk_del = #3 clk;
    always @* strb_out = #1 (en & (clk & ~clk_del));
    assign q = strb_out;
`endif
endmodule
