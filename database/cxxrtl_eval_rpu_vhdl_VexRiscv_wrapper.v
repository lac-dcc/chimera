
module VexRiscv(
  input               clk_cpu,
  input               clk_cpu_reset_,

  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,

  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,

  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,

  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,

  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt
  );

  // RPU only has 1 memory interface. Use dBus for that and strap iBus to
  // always idle.
  assign iBus_cmd_valid         = 1'b0;
  assign iBus_cmd_payload_pc    = 32'd0;

  wire          MEM_O_cmd;
  wire          MEM_I_ready;
  wire          MEM_O_we;
  wire [1:0]    MEM_O_byteEnable;
  wire [31:0]   MEM_O_addr;
  wire [31:0]   MEM_O_data;

  wire          MEM_I_dataReady;
  reg [31:0]    MEM_I_data;

  core u_rpu(
        .I_clk(clk_cpu),
        .I_reset(!clk_cpu_reset_),
        .I_halt(1'b0),

        .I_int_data(32'd0),
        .I_int(1'b0),
        .O_int_ack(),

        .MEM_O_cmd(MEM_O_cmd),
        .MEM_I_ready(MEM_I_ready),
        .MEM_O_addr(MEM_O_addr),

        .MEM_O_we(MEM_O_we),
        .MEM_O_byteEnable(MEM_O_byteEnable),
        .MEM_O_data(MEM_O_data),

        .MEM_I_dataReady(MEM_I_dataReady),
        .MEM_I_data(MEM_I_data),

        .O_halted(),
        .O_DBG()
    );

  assign dBus_cmd_valid             = MEM_O_cmd;
  assign MEM_I_ready                = 1'b1;
  assign dBus_cmd_payload_address   = MEM_O_addr;
  assign dBus_cmd_payload_wr        = MEM_O_we;

  assign dBus_cmd_payload_size      = MEM_O_byteEnable;
  assign dBus_cmd_payload_data      = MEM_O_data;

  assign MEM_I_dataReady            = dBus_rsp_ready;

  always @(*) begin
      MEM_I_data    = dBus_rsp_data;        // Default to avoid a latch
      case(MEM_O_byteEnable)
          2'b00: begin
              // Byte access
              MEM_I_data    = (dBus_rsp_data >> (MEM_O_addr[1:0] * 8)) & 32'hff;
          end
          2'b01: begin
              // HalfWord access
              MEM_I_data    = (dBus_rsp_data >> (MEM_O_addr[1] * 16)) & 32'hffff;
          end
          2'b10: begin
              MEM_I_data    = dBus_rsp_data;
          end
      endcase
  end

endmodule

// 800-746-6216
//
