`include "macros.vh"
`include "riscvConst.vh"

module offchip_phy
(
  input  wire clk_cpu,
  input  wire reset_cpu,

  input  wire clk_200,
  input  wire reset_200,

  input  wire clk_offchip,
  output wire reset_offchip,

  input  wire        htif_req_eth_val,
  input  wire [63:0] htif_req_eth_bits,

  output wire        htif_resp_eth_val,
  output wire [63:0] htif_resp_eth_bits,
  input  wire        htif_resp_eth_rdy,

  output reg        htif_req_chip_val,
  output reg  [3:0] htif_req_chip_bits,
  input  wire       htif_req_chip_rdy,

  input  wire       htif_resp_chip_val,
  input  wire [3:0] htif_resp_chip_bits
);

  // req port
  // eth -> sq -> 4bit -> 4bit_clkcpu -> 4bit_clk200 -> chip

  wire        htif_req_sq_val;
  wire [63:0] htif_req_sq_bits;
  wire        htif_req_sq_rdy;

  wire        htif_req_4bit_val;
  wire [3:0]  htif_req_4bit_bits;
  wire        htif_req_4bit_rdy;

  wire        htif_req_4bit_clkcpu_val;
  wire [3:0]  htif_req_4bit_clkcpu_bits;
  wire        htif_req_4bit_clkcpu_rdy;

  wire        htif_req_4bit_clk200_val;
  wire [3:0]  htif_req_4bit_clk200_bits;
  reg         htif_req_4bit_clk200_rdy;

  // resp port
  // chip -> 4bit_clk200 -> 4bit_clkcpu -> 4bit -> eth
  reg         htif_resp_4bit_clk200_val;
  reg  [3:0]  htif_resp_4bit_clk200_bits;

  wire        htif_resp_4bit_clkcpu_val;
  wire [3:0]  htif_resp_4bit_clkcpu_bits;
  wire        htif_resp_4bit_clkcpu_rdy;

  wire        htif_resp_4bit_val;
  wire [3:0]  htif_resp_4bit_bits;
  wire        htif_resp_4bit_rdy;


  //
  // in cpu clk boundary
  //

  // queue in front of the serializer to handle the ethernet burst
  `VC_SIMPLE_QUEUE(64, 8) sq
  (
    .clk(clk_cpu),
    .reset(reset_cpu),

    .enq_val(htif_req_eth_val),
    .enq_bits(htif_req_eth_bits),
    .enq_rdy(), // can't put back pressure

    .deq_val(htif_req_sq_val),
    .deq_bits(htif_req_sq_bits),
    .deq_rdy(htif_req_sq_rdy)
  );
  

  // serializer
  serializer #(.IN_WIDTH(64), .OUT_WIDTH(4)) serialize
  (
    .clk(clk_cpu),
    .reset(reset_cpu),

    .in_val(htif_req_sq_val),
    .in_bits(htif_req_sq_bits),
    .in_rdy(htif_req_sq_rdy),

    .out_val(htif_req_4bit_val),
    .out_bits(htif_req_4bit_bits),
    .out_rdy(htif_req_4bit_rdy)
  );


  // deserializer
  deserializer #(.IN_WIDTH(4), .OUT_WIDTH(64)) deserialize
  (
    .clk(clk_cpu),
    .reset(reset_cpu),

    .in_val(htif_resp_4bit_val),
    .in_bits(htif_resp_4bit_bits),
    .in_rdy(htif_resp_4bit_rdy),

    .out_val(htif_resp_eth_val),
    .out_bits(htif_resp_eth_bits),
    .out_rdy(htif_resp_eth_rdy)
  );


  // protocol bridge
  HTIFChipAdapter adapter
  (
    .clk(clk_cpu),
    .reset(reset_cpu),

    .htif_req_4bit_val(htif_req_4bit_val),
    .htif_req_4bit_bits(htif_req_4bit_bits),
    .htif_req_4bit_rdy(htif_req_4bit_rdy),

    .htif_req_4bit_clkcpu_val(htif_req_4bit_clkcpu_val),
    .htif_req_4bit_clkcpu_bits(htif_req_4bit_clkcpu_bits),
    .htif_req_4bit_clkcpu_rdy(htif_req_4bit_clkcpu_rdy),

    .htif_resp_4bit_clkcpu_val(htif_resp_4bit_clkcpu_val),
    .htif_resp_4bit_clkcpu_bits(htif_resp_4bit_clkcpu_bits),
    .htif_resp_4bit_clkcpu_rdy(htif_resp_4bit_clkcpu_rdy),

    .htif_resp_4bit_val(htif_resp_4bit_val),
    .htif_resp_4bit_bits(htif_resp_4bit_bits),
    .htif_resp_4bit_rdy(htif_resp_4bit_rdy)
  );


  //
  // cross clock 200 clock <-> cpu clock boundaries
  //

  wire from_cpu_to_clk200_full;
  wire from_cpu_to_clk200_empty;
  wire from_clk200_to_cpu_empty;

  wire [59:0] dummy0, dummy1;

  FIFO36_72
  #(
    .DO_REG(1),       // Enable output register (0 or 1)
    .EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
    .FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
  )
  from_cpu_to_200
  (
    .RST(reset_cpu),

    .WRCLK(clk_cpu),
    .DI({60'd0, htif_req_4bit_clkcpu_bits}),
    .DIP(),
    .WREN(htif_req_4bit_clkcpu_val & htif_req_4bit_clkcpu_rdy),
    .FULL(from_cpu_to_clk200_full),
    .ALMOSTFULL(),
    .WRCOUNT(),
    .WRERR(),

    .RDCLK(clk_200),
    .DO({dummy0, htif_req_4bit_clk200_bits}),
    .DOP(),
    .RDEN(htif_req_4bit_clk200_val & htif_req_4bit_clk200_rdy),
    .EMPTY(from_cpu_to_clk200_empty),
    .ALMOSTEMPTY(),
    .RDCOUNT(),
    .RDERR(),

    .DBITERR(),
    .SBITERR(),
    .ECCPARITY()
  );

  assign htif_req_4bit_clkcpu_rdy = ~from_cpu_to_clk200_full;
  assign htif_req_4bit_clk200_val = ~from_cpu_to_clk200_empty;

  FIFO36_72 // this queue is big enough to absorb the response from the chip
  #(
    .DO_REG(1),       // Enable output register (0 or 1)
    .EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
    .FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
  )
  from_clk200_to_cpu
  (
    .RST(reset_cpu),

    .WRCLK(clk_200),
    .DI({60'd0, htif_resp_4bit_clk200_bits}),
    .DIP(),
    .WREN(htif_resp_4bit_clk200_val),
    .FULL(), // can't put back pressure
    .ALMOSTFULL(),
    .WRCOUNT(),
    .WRERR(),

    .RDCLK(clk_cpu),
    .DO({dummy1, htif_resp_4bit_clkcpu_bits}),
    .DOP(),
    .RDEN(htif_resp_4bit_clkcpu_val & htif_resp_4bit_clkcpu_rdy),
    .EMPTY(from_clk200_to_cpu_empty),
    .ALMOSTEMPTY(),
    .RDCOUNT(),
    .RDERR(),

    .DBITERR(),
    .SBITERR(),
    .ECCPARITY()
  );

  assign htif_resp_4bit_clkcpu_val = ~from_clk200_to_cpu_empty;


  //
  // cross clock 200 clock <-> chip clock boundaries
  //

  // capture clk_offchip posedge 
  reg edge_capture0;
  reg edge_capture1;

  always @(posedge clk_200)
  begin
    edge_capture0 <= clk_offchip;
    edge_capture1 <= edge_capture0;
  end

  wire edge_htif_clk = ~reset_200 & edge_capture0 & ~edge_capture1;


  // lfsr generation
  reg [15:0] reg_lfsr;
  reg [15:0] reg_lfsr_delay;
  reg [15:0] reg_lfsr_delay2;

  always @(posedge clk_200)
  begin
    if (reset_200)
      reg_lfsr <= 16'hDEAD;
    else
      reg_lfsr <= {reg_lfsr[0] ^ reg_lfsr[2] ^ reg_lfsr[3] ^ reg_lfsr[5], reg_lfsr[15:1]};
  end

  always @(posedge clk_200)
  begin
    if (edge_htif_clk)
    begin
      reg_lfsr_delay <= reg_lfsr;
      reg_lfsr_delay2 <= reg_lfsr_delay;
    end
  end


  // testing counter and reset_offchip generation
  reg reg_testing;
  reg reg_testing_delay;
  reg reg_start;
  reg reg_start_delay;
  reg [11:0] reg_counter;
  reg reg_fault;

  wire test = reg_testing_delay & edge_htif_clk & ~reg_start_delay;
  wire test_success = test & (htif_resp_chip_bits == reg_lfsr_delay2[3:0]);
  wire test_fail = test & (htif_resp_chip_bits != reg_lfsr_delay2[3:0]);

  always @(posedge clk_200)
  begin
    if (reset_200)
    begin
      reg_testing <= 1'b1;
      reg_testing_delay <= 1'b1;
      reg_start <= 1'b1;
      reg_start_delay <= 1'b1;
      reg_counter <= 12'd0;
      reg_fault <= 1'd0;
    end
    else
    begin
      if (reg_counter == 12'h00F)
        reg_testing <= 1'b0;
      else if (test_success && !reg_fault)
        reg_counter <= reg_counter + 1'b1;

      if (test_fail)
        reg_fault <= 1'b1;

      if (edge_htif_clk)
      begin
        reg_testing_delay <= reg_testing;
        reg_start <= 1'b0;
        reg_start_delay <= reg_start;
      end
    end
  end

  assign reset_offchip = reg_testing;


  // htif_req circuit
  always @(posedge clk_200)
  begin
    if (reset_200)
    begin
      htif_req_chip_val <= 1'b0;
      htif_req_chip_bits <= 4'd0;
    end
    else if (edge_htif_clk)
    begin
      htif_req_chip_val <= ~reg_testing_delay & htif_req_4bit_clk200_val & htif_req_chip_rdy;
      htif_req_chip_bits <= reg_testing ? reg_lfsr[3:0] : htif_req_4bit_clk200_bits;
    end
  end


  // htif_resp circuit
  always @(posedge clk_200)
  begin
    if (reset_200)
    begin
      htif_req_4bit_clk200_rdy <= 1'b0;
      htif_resp_4bit_clk200_val <= 1'b0;
      htif_resp_4bit_clk200_bits <= 4'd0;
    end
    else
    begin
      htif_req_4bit_clk200_rdy <= ~reg_testing_delay & htif_req_chip_rdy & edge_htif_clk;
      htif_resp_4bit_clk200_val <= ~reg_testing_delay & htif_resp_chip_val & edge_htif_clk;
      htif_resp_4bit_clk200_bits <= htif_resp_chip_bits & {4{edge_htif_clk}};
    end
  end

endmodule
