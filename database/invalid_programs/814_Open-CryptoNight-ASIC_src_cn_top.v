// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules


module cn_top (
   clk,
   reset_n,
   // Control
   ctrl_start,
   sts_finished,
   sts_running,

   sts_il_fl_running,
   sts_ml_running,
   sts_int,
   // Buffer interface
   reg_address,
   reg_write,
   reg_wrdata,
   reg_rddata,
   cfg
   );

`include "cn.vh"

parameter ADDR_WIDTH = 17;
parameter UNROLL = 2;

initial $display("ADDR_WIDTH = %0d", ADDR_WIDTH);
initial $display("UNROLL = %0d", UNROLL);

input      clk;
input      reset_n;
// Control
input      ctrl_start;
output reg sts_finished;
output reg sts_running;
output     sts_il_fl_running;
output     sts_ml_running;
output reg sts_int;
// Buffer interface
// input          reg_cs;
input  [7:0]   reg_address;
input          reg_write;
input  [127:0] reg_wrdata;
output [127:0] reg_rddata;
input  [CFG_BITS-1:0] cfg; // Static configuration settings

wire mode_speedup     = cfg & CORE_CFG_SPEEDUP_MODE != 0;
wire mode_single_step = cfg & CORE_CFG_SINGLE_STEP != 0;

//  state machine signals

reg [1:0] sm_mode_il;
reg       sm_il_fl_start;
reg       sm_ml_start;

// -----------------------------------------------------------------------------------
// CN initialization and finalization Loops
// -----------------------------------------------------------------------------------

// wire table_ram_cs;
wire ilfl_ram_re;
wire [ADDR_WIDTH - 1:0] ilfl_ram_address;
wire [127:0] ram_rddata;
wire [127:0] ilfl_ram_wrdata;
wire ilfl_ram_we;

wire [127:0] ilfl_cipher_StateIn;
wire [128*UNROLL-1:0] ilfl_cipher_Roundkey;
wire [127:0] cipher_StateOut;

wire   [127:0] initial_a;
wire   [127:0] initial_b;

wire    sts_il_fl_finished;
wire    sts_ml_finished;
wire    last_cipher_iteration;

cn_il_fl #(.ADDR_WIDTH(ADDR_WIDTH), .UNROLL(UNROLL)) cn_il_fl_inst (
      .clk(clk),
      .reset_n(reset_n),
      // ctrl interface
      .ctrl_start(sm_il_fl_start),
      .ctrl_mode(sm_mode_il),
      // sts interface
      .sts_running(sts_il_fl_running),
      .sts_finished(sts_il_fl_finished),
      // registers memory map interface
      .reg_address(reg_address),
      .reg_write(reg_write),
      .reg_wrdata(reg_wrdata),
      .reg_rddata(reg_rddata),
      // CN memory map interface
      .table_address(ilfl_ram_address),
      .table_write(ilfl_ram_we),
      .table_read(ilfl_ram_re),
      .table_rddata(ram_rddata),
      .table_wrdata(ilfl_ram_wrdata),
      // AES cipher round
      .cipher_StateIn(ilfl_cipher_StateIn),
      .cipher_Roundkey(ilfl_cipher_Roundkey),
      .cipher_StateOut(cipher_StateOut),
      .last_cipher_iteration(last_cipher_iteration),
      // Initial A and B computed by setup
      .initial_a(initial_a),
      .initial_b(initial_b),
      .mode_speedup(mode_speedup)
      );

// -----------------------------------------------------------------------------------
// CN Main loop
// -----------------------------------------------------------------------------------

wire         ml_ram_re;
wire         ml_ram_we;
wire [127:0] ml_ram_wrdata;
wire [ADDR_WIDTH-1:0] m_ram_addr;

wire [127:0] ml_cipher_StateIn;
wire [127:0] ml_cipher_Roundkey;
wire [127:0] ml_cipher_StateOut;

cn_ml #(.ADDR_WIDTH(ADDR_WIDTH)) cn_ml_inst (
  .clk(clk),
  .reset_n(reset_n),
  // ctrl interface
  .ctrl_start(sm_ml_start),
  // sts interface
  .sts_running(sts_ml_running),
  .sts_finished(sts_ml_finished),
  // Table RAM
  .ram_rden(ml_ram_re),
  .ram_wren(ml_ram_we),
  .ram_wrdata(ml_ram_wrdata),
  .ram_addr(m_ram_addr),
  .ram_rddata(ram_rddata),
  // AES cipher round
  .cipher_StateIn(ml_cipher_StateIn),
  .cipher_Roundkey(ml_cipher_Roundkey),
  .cipher_StateOut(ml_cipher_StateOut),
  // input signals
  .in_a(initial_a),
  .in_b(initial_b),
  // Test modes
  .mode_speedup(mode_speedup)
  );

// -----------------------------------------------------------------------------------
// AES combinatorial
// -----------------------------------------------------------------------------------

cipherRound_mod #(.UNROLL(UNROLL)) aes_inst (
  .last_cipher_iteration(last_cipher_iteration),
  .StateIn( ilfl_cipher_StateIn),
  .Roundkey(ilfl_cipher_Roundkey),
  .StateOut(cipher_StateOut));

cipherRound_mod aes_inst_ml (
  .last_cipher_iteration(1'b0),
  .StateIn( ml_cipher_StateIn),
  .Roundkey(ml_cipher_Roundkey),
  .StateOut(ml_cipher_StateOut));

// -----------------------------------------------------------------------------------
// Table RAM
// -----------------------------------------------------------------------------------

spram128k #(.ADDR_WIDTH(ADDR_WIDTH)) spram128k_inst (
  .clk(clk),
  .re(   sm_il_fl_start ? ilfl_ram_re      : ml_ram_re ),
  .we(   sm_il_fl_start ? ilfl_ram_we      : ml_ram_we),
  .din(  sm_il_fl_start ? ilfl_ram_wrdata  : ml_ram_wrdata),
  .addr( sm_il_fl_start ? ilfl_ram_address : m_ram_addr),
  .dout(ram_rddata)
  );

// assign table_ram_rddata = ram_rddata;

  //  -----------------------------------------------------------------------------------------
  //  CN state machine
  //  -----------------------------------------------------------------------------------------

  // TYPE state_type:
  localparam state_type_st_init = 0;
  localparam state_type_st_setup = 1;
  localparam state_type_st_cn_il = 2;
  localparam state_type_st_cn_ml = 3;
  localparam state_type_st_cn_fl = 4;
  localparam state_type_st_int = 5;

  reg [2:0] state, next_state;

  always @(posedge clk or negedge reset_n)
     if (!reset_n)
        state <= state_type_st_init;
     else begin
        state <= next_state;
// synopsys translate_off
        if (state != next_state)
          $display("%0d  top next_state = %h", $stime, next_state);
// synopsys translate_on
     end

  always @(state or ctrl_start or sts_il_fl_finished or sts_ml_finished) begin

    next_state = state;
    sm_mode_il = 0;     // 1 = FL mode
    sm_il_fl_start = 0; // Start IL/FL
    sm_ml_start = 0;    // Start ML
    sts_running = 0;    // Indicate running status
    sts_finished = 0;   // Indicate finished status
    sts_int = 0;

    case (state)

    //  init state, waiting for start from SW
    state_type_st_init: begin
      sts_finished = 1;

      if (ctrl_start)
        next_state = state_type_st_setup;

      end

    //  CN setup -- keys, Z, A and B
    state_type_st_setup: begin
      sm_mode_il = 2;
      sm_il_fl_start = !sts_il_fl_finished; // Needed to ensure one cycle where this is deasserted
      sts_running = 1;
      if (sts_il_fl_finished)
        next_state = state_type_st_cn_il;
      end

    //  CN initialization
    state_type_st_cn_il: begin
      sm_mode_il = 1;
      sm_il_fl_start = 1;
      sts_running = 1;

      if (sts_il_fl_finished)
         next_state = state_type_st_cn_ml;

      end

    //  CN main loop
    state_type_st_cn_ml: begin
      sm_ml_start = 1;
      sts_running = 1;

      if (sts_ml_finished)
         next_state = state_type_st_cn_fl;

      end

    //  CN finalization
    state_type_st_cn_fl: begin
      sm_mode_il = 0;
      sm_il_fl_start = 1;
      sts_running = 1;

      if (sts_il_fl_finished)
         next_state = state_type_st_int;

      end

    //  interrupt generation and waiting for ctrl_start logic low
    state_type_st_int: begin
      sts_running = 1;
      sts_int = 1;

      if (!ctrl_start)
         next_state = state_type_st_init;

      end

    //  failsave state
    default: begin
      sm_mode_il = 1;
      sts_finished = 1;

      if (!ctrl_start)
        next_state = state_type_st_init;
      end

    endcase

  end

endmodule // module cn_top
