// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

// sha256_tb.v
//
// This file contains the toplevel testbench for testing
// this design. 
//

module sha256_tb;

  /* Dump Test Waveform To VPD File */
  initial begin
    $fsdbDumpfile("waveform.fsdb");
    $fsdbDumpvars();
  end

  /* Non-synth clock generator */
  logic clk;
  bsg_nonsynth_clock_gen #(7500) clk_gen_1 (clk);

  /* Non-synth reset generator */
  logic reset;
  bsg_nonsynth_reset_gen #(.num_clocks_p(1),.reset_cycles_lo_p(5),. reset_cycles_hi_p(5))
    reset_gen
      (.clk_i        ( clk )
      ,.async_reset_o( reset )
      );


  logic dut_v_lo, dut_v_r;
  logic [512:0] dut_data_lo, dut_data_r;
  assign dut_data_lo[512:256] = 257'b0;
  logic dut_ready_lo, dut_ready_r;

  logic tr_v_lo;
  logic [512:0] tr_data_lo;
  logic tr_ready_lo, tr_ready_r;

  logic [31:0] rom_addr_li;
  logic [516:0] rom_data_lo;

  logic tr_yumi_li, dut_yumi_li;

  bsg_fsb_node_trace_replay #(.ring_width_p(513)
                             ,.rom_addr_width_p(32) )
    trace_replay
      ( .clk_i ( ~clk ) // Trace Replay should run on negative clock edge!
      , .reset_i( reset )
      , .en_i( 1'b1 )

      , .v_i    ( dut_v_r )
      , .data_i ( dut_data_r )
      , .ready_o( tr_ready_lo )

      , .v_o   ( tr_v_lo )
      , .data_o( tr_data_lo )
      , .yumi_i( tr_yumi_li )

      , .rom_addr_o( rom_addr_li )
      , .rom_data_i( rom_data_lo )

      , .done_o()
      , .error_o()
      );

    always_ff @(negedge clk) begin
        dut_ready_r <= dut_ready_lo;
        tr_yumi_li  <= dut_ready_r & tr_v_lo;
        dut_v_r     <= dut_v_lo;
        dut_data_r  <= dut_data_lo;
    end

    trace_rom #(.width_p(4 + 513),.addr_width_p(32))
    ROM
        (.addr_i( rom_addr_li )
        ,.data_o( rom_data_lo )
        );

    sha256 DUT (
        .clk_i(clk)
        ,.rst_i(reset)  
    
        ,.in_valid(tr_v_lo)
        ,.new_hash(tr_data_lo[512])
        ,.in(tr_data_lo[511:0])   
        ,.in_ready( dut_ready_lo )

        ,.out_valid(dut_v_lo)
        ,.out(dut_data_lo[255:0])
        ,.out_ready(dut_yumi_li));

  always_ff @(negedge clk) begin
    dut_yumi_li <= tr_ready_lo & dut_v_lo;
  end

endmodule
