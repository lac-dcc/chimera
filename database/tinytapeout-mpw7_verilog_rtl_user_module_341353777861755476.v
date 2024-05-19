// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341353777861755476(
  input [7:0] io_in, 
  output [7:0] io_out
);

  // Frame data shift register because we don't have enough pins to load a whole 16-bit config "frame"
  wire frame_sr_clk = io_in[2];
  reg [15:0] frame_sr;

  always @(posedge frame_sr_clk)
    frame_sr <= {frame_sr[14:0], io_in[3]};

  srlut_341353777861755476 #(.K(4)) dut (
    .frame_strobe(io_in[0]),
    .cfg_mode_n(io_in[1]),
    .frame_data(frame_sr),
    .write_clk(io_in[2]),
    .write_data(io_in[3]),
    .lut_i(io_in[7:4]),
    .lut_o(io_out[0])
  );

  assign io_out[7:1] = 6'b0;

endmodule

module srlut_341353777861755476 #(parameter K=4) (
    input wire frame_strobe,
    input wire cfg_mode_n,
    input wire [2**K-1:0] frame_data, // {lut_init[W-1:0]}
    input wire write_clk,
    input wire write_data,

    input wire [K-1:0] lut_i,
    output wire lut_o
);
    localparam W=2**K;
    wire [W-1:0] lut_data;

    wire write_freeze, big_pulse, smol_pulse;

    write_pulse_gen_341353777861755476 pulse_gen_i (
        .clk(write_clk && cfg_mode_n),
        .big_pulse(big_pulse),
        .smol_pulse(smol_pulse)
    );

    // Storage array
    generate
        genvar ii;
        for (ii = 0; ii < W; ii = ii + 1'b1) begin: lut_loop
            wire bit_d;
            wire bit_strobe = ~(smol_pulse | frame_strobe);
            wire shift_buf_d;

            if (ii == 0)
                assign shift_buf_d = write_data;
            else
                assign shift_buf_d = lut_data[ii - 1];

            sky130_fd_sc_hd__ebufn_1 shift_buf_i (
                .A(shift_buf_d),
                .TE_B(big_pulse),
                .Z(bit_d)
            );

            sky130_fd_sc_hd__ebufn_1 cfg_buf_i (
                .A(frame_data[ii]),
                .TE_B(cfg_mode_n),
                .Z(bit_d)
            );

            sky130_fd_sc_hd__dlxtn_1 bit_cell_i (
                .D(bit_d),
                .GATE_N(~bit_strobe),
                .Q(lut_data[ii])
            );
        end
    endgenerate

    // LUT output mux
    assign lut_o = lut_data[lut_i];
endmodule

module buffer_chain_341353777861755476 (input A, output X);

    localparam N = 5;

    wire [N:0] c;
    assign c[0] = A;
    assign X = c[N];

    generate
        genvar ii;
        for (ii = 1'b0; ii < N; ii = ii + 1'b1) begin : bufs
            (* keep, dont_touch *) sky130_fd_sc_hd__clkdlybuf4s50_1 buf_i (.A(c[ii]), .X(c[ii + 1'b1]));
        end
    endgenerate

endmodule


module write_pulse_gen_341353777861755476 (input wire clk, output wire big_pulse, smol_pulse);
    wire clk_del0, clk_del1, clk_del2, clk_del3, clk_strb;
    buffer_chain_341353777861755476 dly0_i (.A(clk), .X(clk_del0)/* , .VPWR(1'b1), .VGND(1'b0) */);
    buffer_chain_341353777861755476 dly1_i (.A(clk_del0), .X(clk_del1)/* , .VPWR(1'b1), .VGND(1'b0) */);
    buffer_chain_341353777861755476 dly2_i (.A(clk_del1), .X(clk_del2)/* , .VPWR(1'b1), .VGND(1'b0) */);
    buffer_chain_341353777861755476 dly3_i (.A(clk_del2), .X(clk_del3)/* , .VPWR(1'b1), .VGND(1'b0) */);
    sky130_fd_sc_hd__and2b_2 cmpb_i (.A_N(clk_del3), .B(clk), .X(big_pulse)/* , .VPWR(1'b1), .VGND(1'b0) */);
    sky130_fd_sc_hd__and2b_2 cmps_i (.A_N(clk_del2), .B(clk_del1), .X(smol_pulse)/* , .VPWR(1'b1), .VGND(1'b0) */);
endmodule

