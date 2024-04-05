`timescale 1ns/1ps
`include "log.vh"
`include "inst.vh"
//TODO : Read request for AXI
module read_if_control
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer CTRL_BUF_ADDR_WIDTH   = 12,
    parameter integer CTRL_BUF_MAX_ADDR     = 19,
    parameter integer NUM_DATA              = 16,
    parameter integer NUM_PE                = 64,
    parameter integer NAMESPACE_WIDTH       = 2,
    parameter         CTRL_BUF_INIT         = "hw-imp/include/mem-data-rom.txt",
    parameter         WEIGHT_CTRL_INIT      = "hw-imp/include/mem-weight-rom.txt",
    parameter integer TX_SIZE_WIDTH         = 10,
    parameter integer NUM_AXI               = 4,

    parameter integer NUM_PE_PER_LANE      = NUM_PE/NUM_DATA,
    parameter integer PE_ID_WIDTH          = `C_LOG_2(NUM_PE_PER_LANE),
    parameter integer CTRL_PE_WIDTH        = (PE_ID_WIDTH + 1) 
                                              * NUM_DATA + NAMESPACE_WIDTH,
    parameter integer SHIFTER_CTRL_WIDTH   = `C_LOG_2(NUM_DATA)
// ******************************************************************
) (
// ******************************************************************
// IO
// ******************************************************************
    input  wire                             clk,
    input  wire                             resetn,
    input  wire                             start,
    output wire                             compute_start,
    input  wire                             rd_buf_empty,
    output wire                             rd_buf_pop,
    input  wire                             wr_buf_full,
    output wire                             wr_buf_push,
    output wire                             shifter_rd_en,
    output wire                             data_io_dir,
    input  wire                             eoi,
    input  wire                             eoc,
    output wire [CTRL_PE_WIDTH-1:0]         ctrl_pe,
    output wire [SHIFTER_CTRL_WIDTH-1:0]    shift,
    output wire [TX_SIZE_WIDTH-1:0]         rx_req_size,
    output wire                             rx_req,
    output wire [NUM_AXI*32-1:0]            rx_addr,
    //Configuration registers from AXI
    input  wire [32-1:0]                    weight_read_addr,
    input  wire [32-1:0]                    weight_write,
    input  wire [32-1:0]                    data_read_addr,
    input  wire [32-1:0]                    num_iterations
// ******************************************************************
);

// ******************************************************************
// Localparams
// ******************************************************************
    localparam integer NUM_OPS              = 4;
    localparam integer OP_CODE_WIDTH        = `C_LOG_2 (NUM_OPS);
    localparam integer OP_READ              = 0;
    localparam integer OP_SHIFT             = 1;
    localparam integer OP_WFI               = 2;
    localparam integer OP_LOOP              = 3;

    
    
    localparam integer CTRL_BUF_DATA_WIDTH  = CTRL_PE_WIDTH + 
                                              SHIFTER_CTRL_WIDTH +
                                              OP_CODE_WIDTH;

    localparam integer NUM_STATES           = 8;
    localparam integer STATE_WIDTH          = `C_LOG_2 (NUM_STATES);

    localparam integer STATE_IDLE           = 0;

    localparam integer WEIGHT_READ          = 1;
    localparam integer WEIGHT_READ_WAIT     = 2;

    localparam integer DATA_READ            = 3;
    localparam integer DATA_READ_WAIT       = 4;

    localparam integer STATE_COMPUTE        = 5;

    localparam integer WEIGHT_WRITE         = 6;
    localparam integer WEIGHT_WRITE_WAIT    = 7;

    localparam integer WEIGHT_COUNTER_WIDTH = 16;
// ******************************************************************

// ******************************************************************
// Local wires and regs
// ******************************************************************
    wire [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data_out;
    wire                            ctrl_buf_data_valid;
    reg  [CTRL_BUF_ADDR_WIDTH-1:0]  ctrl_buf_addr;
    reg                             ctrl_buf_read_en;

    wire [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;

    reg  [STATE_WIDTH-1:0]          state;
    reg  [STATE_WIDTH-1:0]          next_state;

    wire                            weight_read_done;
    wire                            weight_write_done;

    reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe_reg;
    reg  [SHIFTER_CTRL_WIDTH-1:0]   shift_reg;
    reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
    reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code_d;

    reg                             rx_req_reg;
    reg  [TX_SIZE_WIDTH-1:0]        rx_req_size_reg;
    reg  [NUM_AXI*32-1:0]           rx_addr_reg;

// ******************************************************************

// ******************************************************************
// Read/Write State Machine
// ******************************************************************

  reg [NUM_PE_PER_LANE*NUM_DATA-1:0] counter_init [0:NUM_DATA];
  integer i, j;
  initial begin
    for (i=0; i<NUM_DATA; i=i+1)
    begin
      counter_init[i] = {16'd10, 16'd9, 16'd8, 16'd7};
    end
    $readmemh (WEIGHT_CTRL_INIT, counter_init);
  end

  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_read;
  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_write;
  assign ctrl_pe_weight_read[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;
  assign ctrl_pe_weight_write[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;

  wire [NUM_DATA-1:0]             weight_read_done_lane;
  wire [NUM_DATA-1:0]             weight_write_done_lane;

  assign weight_read_done   = &weight_read_done_lane;
  assign weight_write_done  = &weight_write_done_lane;
  genvar gen;
  generate
    for (gen = 0; gen < NUM_DATA; gen = gen + 1)
    begin : WEIGHT_COUNTERS

      wire [PE_ID_WIDTH-1:0]          pe_id_weight_read;
      wire                            valid_weight_read;

      wire [PE_ID_WIDTH-1:0]          pe_id_weight_write;
      wire                            valid_weight_write;

      assign ctrl_pe_weight_read [NAMESPACE_WIDTH + gen*(PE_ID_WIDTH+1)+:PE_ID_WIDTH+1] = {pe_id_weight_read, valid_weight_read};
      assign ctrl_pe_weight_write[NAMESPACE_WIDTH + gen*(PE_ID_WIDTH+1)+:PE_ID_WIDTH+1] = {pe_id_weight_write, valid_weight_write};

      reg  [WEIGHT_COUNTER_WIDTH-1:0] counter_0;
      reg  [WEIGHT_COUNTER_WIDTH-1:0] counter_1;
      reg  [WEIGHT_COUNTER_WIDTH-1:0] counter_2;
      reg  [WEIGHT_COUNTER_WIDTH-1:0] counter_3;

      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_0_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_1_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_2_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_3_init;

      assign counter_0_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*0+:WEIGHT_COUNTER_WIDTH];
      assign counter_1_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*1+:WEIGHT_COUNTER_WIDTH];
      assign counter_2_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*2+:WEIGHT_COUNTER_WIDTH];
      assign counter_3_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*3+:WEIGHT_COUNTER_WIDTH];

      always @(posedge clk)
      begin
        if (!resetn)
        begin
          counter_0 <= counter_0_init;
          counter_1 <= counter_1_init;
          counter_2 <= counter_2_init;
          counter_3 <= counter_3_init;
        end
        else if (state == WEIGHT_READ)
        begin
          counter_0 <= counter_0 - (counter_0 != 0);
          counter_1 <= counter_1 - (counter_0 == 0 && counter_1 != 0);
          counter_2 <= counter_2 - (counter_0 == 0 && counter_1 == 0 && counter_2 != 0);
          counter_3 <= counter_3 - (counter_0 == 0 && counter_1 == 0 && counter_2 == 0 && counter_3 != 0);
        end
        else if (state == WEIGHT_WRITE)
        begin
          counter_0 <= counter_0 + (counter_0 != counter_0_init);
          counter_1 <= counter_1 + (counter_0 == counter_0_init && counter_1 != counter_1_init);
          counter_2 <= counter_2 + (counter_0 == counter_0_init && counter_1 == counter_1_init && counter_2 != counter_2_init);
          counter_3 <= counter_3 + (counter_0 == counter_0_init && counter_1 == counter_1_init && counter_2 == counter_2_init && counter_3 != counter_3_init);
        end
      end

      assign weight_read_done_lane[gen] = 
        (counter_0 == 0) &&
        (counter_1 == 0) &&
        (counter_2 == 0) &&
        (counter_3 == 0);

      assign weight_write_done_lane[gen] = 
        (counter_0 == counter_0_init) &&
        (counter_1 == counter_1_init) &&
        (counter_2 == counter_2_init) &&
        (counter_3 == counter_3_init);

      assign pe_id_weight_read  = (counter_0 != 0) ? 2'd0 :
                                  (counter_1 != 0) ? 2'd1 :
                                  (counter_2 != 0) ? 2'd2 : 2'd3;
      assign valid_weight_read  = (counter_0 != 0) ||
                                  (counter_1 != 0) ||
                                  (counter_2 != 0) ||
                                  (counter_3 != 0);
      assign pe_id_weight_write = (counter_0 != counter_0_init) ? 2'd0 :
                                  (counter_1 != counter_1_init) ? 2'd1 : 
                                  (counter_2 != counter_2_init) ? 2'd2 : 2'd3;
      assign valid_weight_write = (counter_0 != counter_0_init) ||
                                  (counter_1 != counter_1_init) ||
                                  (counter_2 != counter_2_init) ||
                                  (counter_3 != counter_3_init);

    end
  endgenerate

  always @(posedge clk)
  begin
    ctrl_op_code_d <= ctrl_op_code;
  end

  assign ctrl_pe = ctrl_pe_reg;
  assign shift = shift_reg;

  assign rx_req = rx_req_reg;
  assign rx_addr = rx_addr_reg;
  assign rx_req_size = rx_req_size_reg;

  always @( * )
  begin : DATA_RD_FSM

    next_state = state;
    ctrl_buf_read_en = 1'b0;

    ctrl_pe_reg = 0;
    shift_reg = 0;
    ctrl_op_code = 0;

    rx_req_reg = 0;
    rx_addr_reg = 0;
    rx_req_size_reg = 0;

    case (state)

      STATE_IDLE : begin
        if (start)
        begin
          next_state = WEIGHT_READ_WAIT;
          rx_req_reg = 1;
          rx_addr_reg = {weight_read_addr, weight_read_addr, weight_read_addr, weight_read_addr};
          rx_req_size_reg = 128;
        end
      end

      WEIGHT_READ: begin
        ctrl_pe_reg = ctrl_pe_weight_read;
        if (weight_read_done)
        begin
          next_state = DATA_READ_WAIT;
          ctrl_buf_read_en = 1'b1;
          rx_req_reg = 1;
          //rx_addr_reg = 0;
          rx_addr_reg = {data_read_addr, data_read_addr, data_read_addr, data_read_addr};
          rx_req_size_reg = 128;
        end
        else if (rd_buf_empty)
        begin
          next_state = WEIGHT_READ_WAIT;
        end
      end

      WEIGHT_READ_WAIT: begin
        if (!rd_buf_empty)
        begin
          next_state = WEIGHT_READ;
        end
      end

      DATA_READ : begin
        {ctrl_pe_reg, ctrl_op_code, shift_reg} = ctrl_buf_data_out;
        if (ctrl_op_code !== OP_SHIFT)
          ctrl_pe_reg = 0;
        if (ctrl_op_code == OP_WFI)
        begin
          next_state = STATE_COMPUTE;
        end
        else if (rd_buf_empty)
        begin
          next_state = DATA_READ_WAIT;
        end
        else
        begin
          ctrl_buf_read_en = ctrl_op_code != OP_LOOP || ctrl_op_code_d == OP_LOOP;
        end
      end

      DATA_READ_WAIT : begin
        if (!rd_buf_empty)
        begin
          next_state = DATA_READ;
          ctrl_buf_read_en = 1'b1;
        end
      end

      STATE_COMPUTE : begin
        if (eoc)
        begin
          next_state = WEIGHT_WRITE;
        end
        else if (eoi)
        begin
          next_state = DATA_READ_WAIT;
          //ctrl_buf_read_en = 1'b1;
          rx_req_reg = 1;
          //rx_addr_reg = 0;
          rx_addr_reg = {data_read_addr, data_read_addr, data_read_addr, data_read_addr};
          rx_req_size_reg = 128;
        end
      end

      WEIGHT_WRITE : begin
        ctrl_pe_reg = ctrl_pe_weight_write;
        if (weight_write_done)
        begin
          next_state = STATE_IDLE;
        end
        else if (wr_buf_full)
        begin
          next_state = WEIGHT_WRITE_WAIT;
        end
      end

      WEIGHT_WRITE_WAIT : begin
        if (!wr_buf_full)
        begin
          next_state = WEIGHT_WRITE;
        end
      end

      default : begin
        next_state  = STATE_IDLE;
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
// ******************************************************************

// ******************************************************************
// DATA Read Control Buffer - Control signals
// ******************************************************************
  ROM #(
    .DATA_WIDTH     ( CTRL_BUF_DATA_WIDTH   ),
    .INIT           ( CTRL_BUF_INIT         ),
    .ADDR_WIDTH     ( CTRL_BUF_ADDR_WIDTH   ),
    .TYPE           ( "BLOCK"               )
  ) u_ctrl_buf (
    .CLK            ( clk                  ),
    .RESET          ( !resetn              ),
    .ADDRESS        ( ctrl_buf_addr         ),
    .ENABLE         ( ctrl_buf_read_en      ),
    .DATA_OUT       ( ctrl_buf_data_out     ),
    .DATA_OUT_VALID ( ctrl_buf_data_valid   )
  );

  always @(posedge clk)
  begin
    //if (!resetn || ctrl_buf_addr == CTRL_BUF_MAX_ADDR-1)
    if (!resetn || state == STATE_IDLE || ctrl_op_code == OP_LOOP)
    begin
      ctrl_buf_addr <= 0;
    end
    //else if (resetn && state == DATA_READ)
    else if (resetn && ctrl_buf_read_en)
    begin
      ctrl_buf_addr <= ctrl_buf_addr + 1'b1;
    end
  end

  reg ctrl_buf_read_en_d;
  always @(posedge clk)
    ctrl_buf_read_en_d <= ctrl_buf_read_en;
    
  //assign {ctrl_pe, ctrl_op_code, shift} = ctrl_buf_data_out;
  //assign shifter_rd_en = (ctrl_op_code == OP_SHIFT) && ctrl_buf_data_valid;
  //assign rd_buf_pop = (ctrl_op_code == OP_READ) && ctrl_buf_data_valid && !rd_buf_empty;
  assign shifter_rd_en = (state == WEIGHT_READ) || ((ctrl_op_code == OP_SHIFT) && ctrl_buf_read_en_d);
  assign rd_buf_pop = (ctrl_op_code == OP_READ) && ctrl_buf_read_en_d && !rd_buf_empty;
  assign data_io_dir = state == WEIGHT_WRITE;
// ******************************************************************


reg [STATE_WIDTH-1:0] prev_state;
always @(posedge clk)
begin
  prev_state <= state;
end

assign compute_start = prev_state != STATE_COMPUTE && state == STATE_COMPUTE;

endmodule
