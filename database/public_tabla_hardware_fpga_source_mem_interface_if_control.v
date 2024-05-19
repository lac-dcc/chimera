// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "log.vh"
	`include "inst.vh"
	`include "config.vh"
	`include "weightInst.vh"
`endif
//TODO : Read request for AXI
module if_control
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer CTRL_BUF_ADDR_WIDTH   = 10,
    parameter integer CTRL_BUF_MAX_ADDR     = 19,
    parameter integer NUM_DATA              = 16,
    parameter integer NUM_PE                = 64,
    parameter integer NAMESPACE_WIDTH       = 2,
    parameter integer C_M_AXI_DATA_WIDTH    =64,
//    `ifdef FPGA
//      parameter         CTRL_BUF_INIT         = `MEM_INST_INIT_FPGA,
//      `else
      parameter         CTRL_BUF_INIT         = `MEM_INST_INIT,
//    `endif
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
    output wire                             wr_flush,
    output wire                             compute_start,
    output wire                             done,
    input  wire                             rd_buf_empty,
    output wire                             rd_buf_pop,
    input  wire                             wr_buf_full,
    output reg                              wr_buf_push,
    output wire                             shifter_rd_en,
    output wire                             data_io_dir,
    input  wire                             eoi,
    output wire                             eoc,
    output wire [CTRL_PE_WIDTH-1:0]         ctrl_pe,

    // Debug
    output reg  [CTRL_BUF_ADDR_WIDTH-1:0]   ctrl_buf_addr,
    output reg  [32-1:0]                    num_iterations,
    output wire [32-1:0]                    if_control_state,

    output wire [SHIFTER_CTRL_WIDTH-1:0]    shift,
    output wire [TX_SIZE_WIDTH-1:0]         rd_req_size,
    output wire                             rd_req,
    output wire [NUM_AXI*32-1:0]            rd_addr,
    output wire                             wr_req,
    output wire [NUM_AXI*32-1:0]            wr_addr,

    //Configuration registers from AXI
    input  wire [32-1:0]                    max_iterations,
    input  wire [32-1:0]                    weight_rd_addr,
    input  wire [32-1:0]                    weight_wr_addr,
    input  wire [32-1:0]                    data_rd_addr,
    input  wire [32-1:0]                    data_rd_size,
    input  wire [32-1:0]                    weight_rd_size
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

    localparam integer WEIGHT_COUNTER_WIDTH = 16;
// ******************************************************************

// ******************************************************************
// Local wires and regs
// ******************************************************************

    reg                             rd_buf_pop_d;
    wire                            eoc_w;
    reg                             eoc_d;
    reg                             eoi_d;
    reg  [32-1:0]                   max_iterations_d;
    reg  [NUM_AXI*32-1:0]           weight_rd_addr_d;
    reg  [NUM_AXI*32-1:0]           weight_wr_addr_d;
    reg  [NUM_AXI*32-1:0]           data_rd_addr_d;

    wire [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data_out;
    wire                            ctrl_buf_data_valid;
    //reg  [CTRL_BUF_ADDR_WIDTH-1:0]  ctrl_buf_addr;
    reg                             ctrl_buf_read_en;

    wire [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;

    reg  [`STATE_WIDTH-1:0]          state;
    reg  [`STATE_WIDTH-1:0]          next_state;

    wire                            weight_read_done;
    wire                            weight_write_done;

    reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe_reg;
    reg  [SHIFTER_CTRL_WIDTH-1:0]   shift_reg;
    reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
    wire [OP_CODE_WIDTH-1:0]        ctrl_op_code_w;
    reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code_d;

    reg                             rx_req_reg;
    reg  [TX_SIZE_WIDTH-1:0]        rx_req_size_reg;
    reg  [NUM_AXI*32-1:0]           rx_addr_reg;

    reg                             wr_req_reg;
    reg  [NUM_AXI*32-1:0]           wr_addr_reg;

// ******************************************************************

// ******************************************************************
// Read/Write State Machine
// ******************************************************************

  always @(posedge clk)
  begin
    if (resetn == 0)
    begin
      weight_rd_addr_d <= 0;
      weight_wr_addr_d <= 0;
    end else begin
      weight_rd_addr_d <= {weight_rd_addr+32'h180, 
                           weight_rd_addr+32'h100, 
                           weight_rd_addr+32'h080, 
                           weight_rd_addr+32'h000
                           };
      weight_wr_addr_d <= {weight_wr_addr+32'h180, 
                           weight_wr_addr+32'h100, 
                           weight_wr_addr+32'h080, 
                           weight_wr_addr+32'h000
                           };
    end
  end
`ifdef FPGA
  (* rom_style = "distributed", Keep = "true" *)
  reg [(NUM_PE_PER_LANE+1)*WEIGHT_COUNTER_WIDTH-1:0] counter_init [0:NUM_DATA-1];
  integer i, j;
  initial begin
    counter_init[0]  = {`WEIGHT_COUNT_LANE_0,  `WEIGHT_COUNT_PE_48, `WEIGHT_COUNT_PE_32, `WEIGHT_COUNT_PE_16, `WEIGHT_COUNT_PE_0};
    counter_init[1]  = {`WEIGHT_COUNT_LANE_1,  `WEIGHT_COUNT_PE_49, `WEIGHT_COUNT_PE_33, `WEIGHT_COUNT_PE_17, `WEIGHT_COUNT_PE_1};
    counter_init[2]  = {`WEIGHT_COUNT_LANE_2,  `WEIGHT_COUNT_PE_50, `WEIGHT_COUNT_PE_34, `WEIGHT_COUNT_PE_18, `WEIGHT_COUNT_PE_2};
    counter_init[3]  = {`WEIGHT_COUNT_LANE_3,  `WEIGHT_COUNT_PE_51, `WEIGHT_COUNT_PE_35, `WEIGHT_COUNT_PE_19, `WEIGHT_COUNT_PE_3};
    counter_init[4]  = {`WEIGHT_COUNT_LANE_4,  `WEIGHT_COUNT_PE_52, `WEIGHT_COUNT_PE_36, `WEIGHT_COUNT_PE_20, `WEIGHT_COUNT_PE_4};
    counter_init[5]  = {`WEIGHT_COUNT_LANE_5,  `WEIGHT_COUNT_PE_53, `WEIGHT_COUNT_PE_37, `WEIGHT_COUNT_PE_21, `WEIGHT_COUNT_PE_5};
    counter_init[6]  = {`WEIGHT_COUNT_LANE_6,  `WEIGHT_COUNT_PE_54, `WEIGHT_COUNT_PE_38, `WEIGHT_COUNT_PE_22, `WEIGHT_COUNT_PE_6};
    counter_init[7]  = {`WEIGHT_COUNT_LANE_7,  `WEIGHT_COUNT_PE_55, `WEIGHT_COUNT_PE_39, `WEIGHT_COUNT_PE_23, `WEIGHT_COUNT_PE_7};
    counter_init[8]  = {`WEIGHT_COUNT_LANE_8,  `WEIGHT_COUNT_PE_56, `WEIGHT_COUNT_PE_40, `WEIGHT_COUNT_PE_24, `WEIGHT_COUNT_PE_8};
    counter_init[9]  = {`WEIGHT_COUNT_LANE_9,  `WEIGHT_COUNT_PE_57, `WEIGHT_COUNT_PE_41, `WEIGHT_COUNT_PE_25, `WEIGHT_COUNT_PE_9};
    counter_init[10] = {`WEIGHT_COUNT_LANE_10, `WEIGHT_COUNT_PE_58, `WEIGHT_COUNT_PE_42, `WEIGHT_COUNT_PE_26, `WEIGHT_COUNT_PE_10};
    counter_init[11] = {`WEIGHT_COUNT_LANE_11, `WEIGHT_COUNT_PE_59, `WEIGHT_COUNT_PE_43, `WEIGHT_COUNT_PE_27, `WEIGHT_COUNT_PE_11};
    counter_init[12] = {`WEIGHT_COUNT_LANE_12, `WEIGHT_COUNT_PE_60, `WEIGHT_COUNT_PE_44, `WEIGHT_COUNT_PE_28, `WEIGHT_COUNT_PE_12};
    counter_init[13] = {`WEIGHT_COUNT_LANE_13, `WEIGHT_COUNT_PE_61, `WEIGHT_COUNT_PE_45, `WEIGHT_COUNT_PE_29, `WEIGHT_COUNT_PE_13};
    counter_init[14] = {`WEIGHT_COUNT_LANE_14, `WEIGHT_COUNT_PE_62, `WEIGHT_COUNT_PE_46, `WEIGHT_COUNT_PE_30, `WEIGHT_COUNT_PE_14};
    counter_init[15] = {`WEIGHT_COUNT_LANE_15, `WEIGHT_COUNT_PE_63, `WEIGHT_COUNT_PE_47, `WEIGHT_COUNT_PE_31, `WEIGHT_COUNT_PE_15};
  end
`else
  wire [(NUM_PE_PER_LANE+1)*WEIGHT_COUNTER_WIDTH-1:0] counter_init [0:NUM_DATA-1];

  assign counter_init[0]  = {`WEIGHT_COUNT_LANE_0,  `WEIGHT_COUNT_PE_48, `WEIGHT_COUNT_PE_32, `WEIGHT_COUNT_PE_16, `WEIGHT_COUNT_PE_0};
  assign counter_init[1]  = {`WEIGHT_COUNT_LANE_1,  `WEIGHT_COUNT_PE_49, `WEIGHT_COUNT_PE_33, `WEIGHT_COUNT_PE_17, `WEIGHT_COUNT_PE_1};
  assign counter_init[2]  = {`WEIGHT_COUNT_LANE_2,  `WEIGHT_COUNT_PE_50, `WEIGHT_COUNT_PE_34, `WEIGHT_COUNT_PE_18, `WEIGHT_COUNT_PE_2};
  assign counter_init[3]  = {`WEIGHT_COUNT_LANE_3,  `WEIGHT_COUNT_PE_51, `WEIGHT_COUNT_PE_35, `WEIGHT_COUNT_PE_19, `WEIGHT_COUNT_PE_3};
  assign counter_init[4]  = {`WEIGHT_COUNT_LANE_4,  `WEIGHT_COUNT_PE_52, `WEIGHT_COUNT_PE_36, `WEIGHT_COUNT_PE_20, `WEIGHT_COUNT_PE_4};
  assign counter_init[5]  = {`WEIGHT_COUNT_LANE_5,  `WEIGHT_COUNT_PE_53, `WEIGHT_COUNT_PE_37, `WEIGHT_COUNT_PE_21, `WEIGHT_COUNT_PE_5};
  assign counter_init[6]  = {`WEIGHT_COUNT_LANE_6,  `WEIGHT_COUNT_PE_54, `WEIGHT_COUNT_PE_38, `WEIGHT_COUNT_PE_22, `WEIGHT_COUNT_PE_6};
  assign counter_init[7]  = {`WEIGHT_COUNT_LANE_7,  `WEIGHT_COUNT_PE_55, `WEIGHT_COUNT_PE_39, `WEIGHT_COUNT_PE_23, `WEIGHT_COUNT_PE_7};
  assign counter_init[8]  = {`WEIGHT_COUNT_LANE_8,  `WEIGHT_COUNT_PE_56, `WEIGHT_COUNT_PE_40, `WEIGHT_COUNT_PE_24, `WEIGHT_COUNT_PE_8};
  assign counter_init[9]  = {`WEIGHT_COUNT_LANE_9,  `WEIGHT_COUNT_PE_57, `WEIGHT_COUNT_PE_41, `WEIGHT_COUNT_PE_25, `WEIGHT_COUNT_PE_9};
  assign counter_init[10] = {`WEIGHT_COUNT_LANE_10, `WEIGHT_COUNT_PE_58, `WEIGHT_COUNT_PE_42, `WEIGHT_COUNT_PE_26, `WEIGHT_COUNT_PE_10};
  assign counter_init[11] = {`WEIGHT_COUNT_LANE_11, `WEIGHT_COUNT_PE_59, `WEIGHT_COUNT_PE_43, `WEIGHT_COUNT_PE_27, `WEIGHT_COUNT_PE_11};
  assign counter_init[12] = {`WEIGHT_COUNT_LANE_12, `WEIGHT_COUNT_PE_60, `WEIGHT_COUNT_PE_44, `WEIGHT_COUNT_PE_28, `WEIGHT_COUNT_PE_12};
  assign counter_init[13] = {`WEIGHT_COUNT_LANE_13, `WEIGHT_COUNT_PE_61, `WEIGHT_COUNT_PE_45, `WEIGHT_COUNT_PE_29, `WEIGHT_COUNT_PE_13};
  assign counter_init[14] = {`WEIGHT_COUNT_LANE_14, `WEIGHT_COUNT_PE_62, `WEIGHT_COUNT_PE_46, `WEIGHT_COUNT_PE_30, `WEIGHT_COUNT_PE_14};
  assign counter_init[15] = {`WEIGHT_COUNT_LANE_15, `WEIGHT_COUNT_PE_63, `WEIGHT_COUNT_PE_47, `WEIGHT_COUNT_PE_31, `WEIGHT_COUNT_PE_15};
`endif

  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_read;
  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_write;
  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_read_d;
  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_write_d;
  assign ctrl_pe_weight_read[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;
  assign ctrl_pe_weight_write[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;

  always @(posedge clk)
  begin
    if (resetn == 0 || (state != `WEIGHT_READ))
      ctrl_pe_weight_read_d <= 0;
    else
      ctrl_pe_weight_read_d <= ctrl_pe_weight_read;
  end

  // always @(posedge clk)
  // begin
    // if (resetn == 0)
      // ctrl_pe_weight_write_d <= 0;
    // else
      // ctrl_pe_weight_write_d <= ctrl_pe_weight_write;
  // end

  wire [NUM_DATA-1:0]             weight_read_done_lane;
  wire [NUM_DATA-1:0]             weight_write_done_lane;

  reg  [NUM_DATA-1:0]             weight_read_done_lane_d;
  reg  [NUM_DATA-1:0]             weight_write_done_lane_d;

  //assign weight_read_done   = &weight_read_done_lane_d;
  //assign weight_write_done  = &weight_write_done_lane_d;
  assign weight_read_done   = &weight_read_done_lane_d;
  assign weight_write_done  = &weight_write_done_lane_d;

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

      reg  [WEIGHT_COUNTER_WIDTH-1:0] counter_total;

      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_0_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_1_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_2_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_3_init;
      wire [WEIGHT_COUNTER_WIDTH-1:0] counter_total_init;

      assign counter_0_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*0+:WEIGHT_COUNTER_WIDTH];
      assign counter_1_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*1+:WEIGHT_COUNTER_WIDTH];
      assign counter_2_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*2+:WEIGHT_COUNTER_WIDTH];
      assign counter_3_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*3+:WEIGHT_COUNTER_WIDTH];
      assign counter_total_init = counter_init[gen][WEIGHT_COUNTER_WIDTH*4+:WEIGHT_COUNTER_WIDTH];

      always @(posedge clk)
      begin
        if (!resetn)
        begin
          counter_0 <= counter_0_init;
          counter_1 <= counter_1_init;
          counter_2 <= counter_2_init;
          counter_3 <= counter_3_init;
          counter_total <= counter_total_init;
        end
        else if (state == `WEIGHT_READ && !rd_buf_empty)
        begin
          counter_0 <= counter_0 - (counter_0 != 0);
          counter_1 <= counter_1 - (counter_0 == 0 && counter_1 != 0);
          counter_2 <= counter_2 - (counter_0 == 0 && counter_1 == 0 && counter_2 != 0);
          counter_3 <= counter_3 - (counter_0 == 0 && counter_1 == 0 && counter_2 == 0 && counter_3 != 0);
          counter_total <= counter_total - (counter_total != 0);
        end
        else if (state == `WEIGHT_WRITE)
        begin
          counter_0 <= counter_0 + (counter_0 != counter_0_init);
          counter_1 <= counter_1 + (counter_0 == counter_0_init && counter_1 != counter_1_init);
          counter_2 <= counter_2 + (counter_0 == counter_0_init && counter_1 == counter_1_init && counter_2 != counter_2_init);
          counter_3 <= counter_3 + (counter_0 == counter_0_init && counter_1 == counter_1_init && counter_2 == counter_2_init && counter_3 != counter_3_init);
          counter_total <= counter_total + (counter_total != counter_total_init);
        end
      end

      assign weight_read_done_lane [gen] = (counter_total == 0) || (counter_total == 1 && rd_buf_pop);
      assign weight_write_done_lane [gen] = counter_total == counter_total_init;
      //assign weight_read_done_lane[gen] = 
      //  (counter_0 == 0) &&
      //  (counter_1 == 0) &&
      //  (counter_2 == 0) &&
      //  (counter_3 == 0);

      always @(posedge clk)
      begin
        if (resetn)
          weight_read_done_lane_d[gen] <= weight_read_done_lane[gen];
        else
          weight_read_done_lane_d[gen] <= 0;
      end

      //assign weight_write_done_lane[gen] = 
      //  (counter_0 == counter_0_init) &&
      //  (counter_1 == counter_1_init) &&
      //  (counter_2 == counter_2_init) &&
      //  (counter_3 == counter_3_init);

      always @(posedge clk)
      begin
        if (resetn)
          weight_write_done_lane_d[gen] <= weight_write_done_lane[gen];
        else
          weight_write_done_lane_d[gen] <= 0;
      end

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

  assign ctrl_op_code_w = ctrl_buf_data_out[SHIFTER_CTRL_WIDTH+OP_CODE_WIDTH-1:SHIFTER_CTRL_WIDTH];

  always @(posedge clk)
  begin
    ctrl_op_code_d <= ctrl_op_code_w;
  end

  assign ctrl_pe = ctrl_pe_reg;
  assign shift = shift_reg;

  assign rd_req = rx_req_reg;
  assign rd_addr = rx_addr_reg;
  assign rd_req_size = rx_req_size_reg;

  assign wr_req  = wr_req_reg;
  assign wr_addr = wr_addr_reg;

  assign eoc_w = eoi & (num_iterations == max_iterations-1);

  always @(posedge clk)
  begin
    if (resetn == 0 || (state == `STATE_IDLE && start))
      num_iterations <= 0;
    else if (state == `STATE_COMPUTE && eoi)
    begin
      num_iterations <= num_iterations + 1;
    end
  end


  always @(posedge clk)
  begin
    if (resetn == 0)
    begin
      data_rd_addr_d <= 0;
    end else if (state == `STATE_IDLE) begin
      data_rd_addr_d <= {data_rd_addr+32'h180,
                         data_rd_addr+32'h100, 
                         data_rd_addr+32'h080, 
                         data_rd_addr
                         };
    end else if (rd_req)
    begin
      data_rd_addr_d <= {data_rd_addr_d[127:96] + rd_req_size * C_M_AXI_DATA_WIDTH/8 * NUM_AXI,
                         data_rd_addr_d[95 :64] + rd_req_size * C_M_AXI_DATA_WIDTH/8 * NUM_AXI,
                         data_rd_addr_d[63 :32] + rd_req_size * C_M_AXI_DATA_WIDTH/8 * NUM_AXI,
                         data_rd_addr_d[31 :0 ] + rd_req_size * C_M_AXI_DATA_WIDTH/8 * NUM_AXI
                         };
    end
  end

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

    wr_req_reg = 0;
    wr_addr_reg = 0;

    case (state)

      `STATE_IDLE : begin
        if (start)
        begin
          next_state = `WEIGHT_READ_WAIT;
          rx_req_reg = 1;
          rx_addr_reg = weight_rd_addr_d;
          rx_req_size_reg = weight_rd_size;
        end
      end

      `WEIGHT_READ: begin
        ctrl_pe_reg = ctrl_pe_weight_read_d;
        if (weight_read_done)
        begin
          next_state = `DATA_READ_WAIT;
          //ctrl_buf_read_en = 1'b1;
          rx_req_reg = 1;
          rx_addr_reg = data_rd_addr_d;
          rx_req_size_reg = data_rd_size;
        end
        else if (rd_buf_empty)
        begin
          next_state = `WEIGHT_READ_WAIT;
        end
      end

      `WEIGHT_READ_WAIT: begin
        if (!rd_buf_empty)
        begin
          next_state = `WEIGHT_READ;
        end
      end

      `DATA_READ : begin
        {ctrl_pe_reg, ctrl_op_code, shift_reg} = ctrl_buf_data_out;
        if (ctrl_op_code_w != OP_SHIFT)
          ctrl_pe_reg = 0;
        if (ctrl_op_code_w == OP_WFI)
        begin
          next_state = `STATE_COMPUTE;
        end
        else if (rd_buf_empty && ctrl_op_code_w == OP_READ)
        begin
          next_state = `DATA_READ_WAIT;
        end
        else
        begin
          ctrl_buf_read_en = ctrl_op_code_w != OP_LOOP || ctrl_op_code_d == OP_LOOP;
        end
      end

      `DATA_READ_WAIT : begin
        if (!rd_buf_empty)
        begin
          next_state = `DATA_READ;
          ctrl_buf_read_en = 1'b1;
        end
      end

      `STATE_COMPUTE : begin
        ctrl_buf_read_en = ctrl_op_code_w == OP_LOOP;
        if (eoc_d)
        begin
          next_state = `WEIGHT_WRITE;
          wr_req_reg = 1;
          wr_addr_reg = weight_wr_addr_d;
        end
        else if (eoi_d)
        begin
          next_state = `DATA_READ_WAIT;
          //ctrl_buf_read_en = 1'b1;
          rx_req_reg = 1;
          //rx_addr_reg = 0;
          rx_addr_reg = data_rd_addr_d;
          //rx_addr_reg = {data_rd_addr, data_rd_addr, data_rd_addr, data_rd_addr};
          rx_req_size_reg = data_rd_size;
        end
      end

      `WEIGHT_WRITE : begin
        ctrl_pe_reg = ctrl_pe_weight_write;
        if (weight_write_done)
        begin
          next_state = `STATE_IDLE;
        end
        else if (wr_buf_full)
        begin
          next_state = `WEIGHT_WRITE_WAIT;
        end
      end

      `WEIGHT_WRITE_WAIT : begin
        if (!wr_buf_full)
        begin
          next_state = `WEIGHT_WRITE;
        end
      end

      default : begin
        next_state  = `STATE_IDLE;
      end

    endcase

  end

  always @(posedge clk)
  begin
      if (resetn)
          state <= next_state;
      else
          state <= `STATE_IDLE;
  end
// ******************************************************************

// ******************************************************************
// DATA Read Control Buffer - Control signals
// ******************************************************************
  `ifdef SIMULATION  
      ROM_ASIC #(
        .DATA_WIDTH     ( CTRL_BUF_DATA_WIDTH   ),
        .INIT           ( CTRL_BUF_INIT         ),
        .ADDR_WIDTH     ( CTRL_BUF_ADDR_WIDTH   ),
        .TYPE           ( "BLOCK"               )
      ) u_ctrl_buf (
        .CLK            ( clk                   ),
        .RESET          ( !resetn               ),
        .ADDRESS        ( ctrl_buf_addr         ),
        .ENABLE         ( ctrl_buf_read_en      ),
        .DATA_OUT       ( ctrl_buf_data_out     ),
        .DATA_OUT_VALID ( ctrl_buf_data_valid   )
      );
    `elsif FPGA
    ROM #(
        .DATA_WIDTH     ( CTRL_BUF_DATA_WIDTH   ),
        .INIT           ( CTRL_BUF_INIT         ),
        .ADDR_WIDTH     ( CTRL_BUF_ADDR_WIDTH   ),
        .TYPE           ( "BLOCK"               )
      ) u_ctrl_buf (
        .CLK            ( clk                   ),
        .RESET          ( !resetn               ),
        .ADDRESS        ( ctrl_buf_addr         ),
        .ENABLE         ( ctrl_buf_read_en      ),
        .DATA_OUT       ( ctrl_buf_data_out     ),
        .DATA_OUT_VALID ( ctrl_buf_data_valid   )
      );
      `else
      ROM_ASIC #(
        .DATA_WIDTH     ( CTRL_BUF_DATA_WIDTH   ),
        .INIT           ( CTRL_BUF_INIT         ),
        .ADDR_WIDTH     ( CTRL_BUF_ADDR_WIDTH   ),
        .TYPE           ( "BLOCK"               )
      ) u_ctrl_buf (
        .CLK            ( clk                   ),
        .RESET          ( !resetn               ),
        .ADDRESS        ( ctrl_buf_addr         ),
        .ENABLE         ( ctrl_buf_read_en      ),
        .DATA_OUT       ( ctrl_buf_data_out     ),
        .DATA_OUT_VALID ( ctrl_buf_data_valid   )
      );
      `endif
      
  always @(posedge clk)
  begin
    //if (!resetn || ctrl_buf_addr == CTRL_BUF_MAX_ADDR-1)
    if (!resetn || state == `STATE_IDLE || (ctrl_op_code_w == OP_LOOP && !ctrl_buf_read_en))
    begin
      ctrl_buf_addr <= 0;
    end
    //else if (resetn && state == `DATA_READ)
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
  //

  assign shifter_rd_en = ((state == `WEIGHT_READ) && rd_buf_pop_d) || ((ctrl_op_code == OP_SHIFT) && ctrl_buf_read_en_d);
  //assign rd_buf_pop = (( (state == `WEIGHT_READ) && !weight_read_done ) || ((ctrl_op_code == OP_READ) && ctrl_buf_read_en_d)) && !rd_buf_empty;
  assign rd_buf_pop = (( (state == `WEIGHT_READ) && !weight_read_done ) || ((ctrl_op_code == OP_READ) && ctrl_buf_read_en_d)) && !rd_buf_empty;
reg [`STATE_WIDTH-1:0] prev_state;
  //assign data_io_dir = (prev_state == `WEIGHT_WRITE) && (state == `WEIGHT_WRITE);
  assign data_io_dir = (!weight_write_done && (state == `WEIGHT_WRITE) && (prev_state == `WEIGHT_WRITE));
// ******************************************************************



always @(posedge clk)
begin
  prev_state <= state;
end

always @(posedge clk)
begin
  if (resetn)
    rd_buf_pop_d <= rd_buf_pop;
  else
    rd_buf_pop_d <= 0;
end

assign compute_start = prev_state != `STATE_COMPUTE && state == `STATE_COMPUTE;

assign done = state == `STATE_IDLE;

always @(posedge clk)
begin
  if (resetn)
    wr_buf_push <= data_io_dir;
  else
    wr_buf_push <= 0;
end

assign wr_flush = prev_state != `STATE_IDLE && state == `STATE_IDLE;

always @(posedge clk)
begin
  if (resetn) begin
    eoi_d <= eoi;
    eoc_d <= eoc_w;
  end else begin
    eoi_d <= 0;
    eoc_d <= 0;
  end
end

// DEBUG
assign if_control_state = state;

assign eoc = eoc_d;

endmodule
