module axim_controller #(
// ******************************************************************
// Parameters
// ******************************************************************
  parameter         C_M_AXI_PROTOCOL                   = "AXI3",
  parameter integer C_M_AXI_ADDR_WIDTH                 = 32,
  parameter integer C_M_AXI_DATA_WIDTH                 = 64,
  parameter integer C_M_AXI_AWUSER_WIDTH               = 1,
  parameter integer C_M_AXI_ARUSER_WIDTH               = 1,
  parameter integer C_M_AXI_WUSER_WIDTH                = 1,
  parameter integer C_M_AXI_RUSER_WIDTH                = 1,
  parameter integer C_M_AXI_BUSER_WIDTH                = 1,
  
  // Number of address bits to test before wrapping
  parameter integer C_OFFSET_WIDTH                     = 16,
  
  /* Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
   Non-2^n lengths will eventually cause bursts across 4K
   address boundaries.*/
  parameter integer C_M_AXI_RD_BURST_LEN               = 16,
  parameter integer C_M_AXI_WR_BURST_LEN               = 16,
  
  // CUSTOM PARAMS
  parameter         TX_SIZE_WIDTH                      = 10
)
(
// ******************************************************************
// IO
// ******************************************************************
  // System Signals
  input  wire                                 clk,
  input  wire                                 resetn,

  input  wire [10-1:0]                        rx_size,
  input  wire                                 rx_req,
  input  wire [C_M_AXI_ADDR_WIDTH-1:0]        rx_addr,

  output reg  [10-1:0]                        axim_hp0_rx_size,
  output reg                                  axim_hp0_rx_req,
  output reg  [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp0_rx_addr,

  output reg  [10-1:0]                        axim_hp1_rx_size,
  output reg                                  axim_hp1_rx_req,
  output reg  [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp1_rx_addr,

  output reg  [10-1:0]                        axim_hp2_rx_size,
  output reg                                  axim_hp2_rx_req,
  output reg  [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp2_rx_addr,

  output reg  [10-1:0]                        axim_hp3_rx_size,
  output reg                                  axim_hp3_rx_req,
  output reg  [C_M_AXI_ADDR_WIDTH-1:0]        axim_hp3_rx_addr
);
// ******************************************************************

// ******************************************************************
  reg  [2:0]                                  state;
  reg  [2:0]                                  next_state;

  reg  [10-1:0]                               axi0_rx_size;
  reg                                         axi0_rx_req;
  reg  [C_M_AXI_ADDR_WIDTH-1:0]               axi0_rx_addr;

  reg  [10-1:0]                               axi1_rx_size;
  reg                                         axi1_rx_req;
  reg  [C_M_AXI_ADDR_WIDTH-1:0]               axi1_rx_addr;

  reg  [10-1:0]                               axi2_rx_size;
  reg                                         axi2_rx_req;
  reg  [C_M_AXI_ADDR_WIDTH-1:0]               axi2_rx_addr;

  reg  [10-1:0]                               axi3_rx_size;
  reg                                         axi3_rx_req;
  reg  [C_M_AXI_ADDR_WIDTH-1:0]               axi3_rx_addr;

  localparam integer STATE_IDLE = 0;
  localparam integer STATE_AXI0 = 1;
  localparam integer STATE_AXI1 = 2;
  localparam integer STATE_AXI2 = 3;
  localparam integer STATE_AXI3 = 4;

  always @*
  begin

    next_state = 0;

    axi0_rx_req  = 0;
    axi0_rx_addr = 0;
    axi0_rx_size = 0;
    axi1_rx_req  = 0;
    axi1_rx_addr = 0;
    axi1_rx_size = 0;
    axi2_rx_req  = 0;
    axi2_rx_addr = 0;
    axi2_rx_size = 0;
    axi3_rx_req  = 0;
    axi3_rx_addr = 0;
    axi3_rx_size = 0;
    case (state)
      STATE_IDLE : begin
        if (rx_req)
        begin
          next_state = STATE_AXI0;
        end
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk)
  begin
    if (resetn)
      state <= next_state;
    else
      state <= STATE_IDLE;
  end

  always @(posedge clk)
  begin
    if (resetn)
    begin
      axim_hp0_rx_size <= axi0_rx_size;
      axim_hp1_rx_size <= axi1_rx_size;
      axim_hp2_rx_size <= axi2_rx_size;
      axim_hp3_rx_size <= axi3_rx_size;
    end
    else
    begin
      axim_hp0_rx_size <= 0;
      axim_hp1_rx_size <= 0;
      axim_hp2_rx_size <= 0;
      axim_hp3_rx_size <= 0;
    end
  end

  always @(posedge clk)
  begin
    if (resetn)
    begin
      axim_hp0_rx_addr <= axi0_rx_addr;
      axim_hp1_rx_addr <= axi1_rx_addr;
      axim_hp2_rx_addr <= axi2_rx_addr;
      axim_hp3_rx_addr <= axi3_rx_addr;
    end
    else
    begin
      axim_hp0_rx_addr <= 0;
      axim_hp1_rx_addr <= 0;
      axim_hp2_rx_addr <= 0;
      axim_hp3_rx_addr <= 0;
    end
  end

  always @(posedge clk)
  begin
    if (resetn)
    begin
      axim_hp0_rx_req <= axi0_rx_req;
      axim_hp1_rx_req <= axi1_rx_req;
      axim_hp2_rx_req <= axi2_rx_req;
      axim_hp3_rx_req <= axi3_rx_req;
    end
    else
    begin
      axim_hp0_rx_req <= 0;
      axim_hp1_rx_req <= 0;
      axim_hp2_rx_req <= 0;
      axim_hp3_rx_req <= 0;
    end
  end

endmodule
