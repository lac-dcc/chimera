// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "log.vh"
	`include "inst.vh"
	`include "config.vh"
	`include "weight_insts.vh"
`endif
//TODO : Read request for AXI

module if_control_new
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
    parameter integer NUM_DATA_PER_AXI      = NUM_DATA/NUM_AXI,
    
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
    output wire  [NUM_AXI-1:0]              rd_buf_pop_per_axi,
    input  wire                             wr_buf_full,
    output reg   [NUM_AXI-1:0]              wr_buf_push,
    output wire                             shifter_rd_en,
    output reg                             data_io_dir,
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
    wire rd_buf_pop;
    reg wr_buf_push_w;
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

generate 
for(genvar i=0 ; i<NUM_AXI;i=i+1) begin
  always @(posedge clk)
  begin
    if (resetn == 0)
    begin
      weight_rd_addr_d[(i+1)*32-1:i*32] <= 0;
      weight_wr_addr_d[(i+1)*32-1:i*32] <= 0;
    end else begin
      weight_rd_addr_d[(i+1)*32-1:i*32] <= weight_rd_addr+rd_req_size * C_M_AXI_DATA_WIDTH/8 *i;
      weight_wr_addr_d[(i+1)*32-1:i*32] <= weight_wr_addr+rd_req_size * C_M_AXI_DATA_WIDTH/8 *i;
    end
  end
end
endgenerate
wire [WEIGHT_COUNTER_WIDTH-1:0] counter_init [0:NUM_DATA-1][0:NUM_PE_PER_LANE];
generate 
for (genvar lanes =0 ; lanes < NUM_DATA; lanes= lanes+1) begin
    for( genvar pe =0 ; pe < NUM_PE_PER_LANE+1; pe=pe+1) begin
        assign counter_init[lanes][pe] = `WEIGHT_COUNT_MACRO(lanes,pe);
    end
end
endgenerate


  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_read;
  wire [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_write;
  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_read_d;
  reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe_weight_write_d;
  assign ctrl_pe_weight_read[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;
  assign ctrl_pe_weight_write[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;

  always @(posedge clk)
  begin
    if (resetn == 0 || (state != `WEIGHT_READ))
      ctrl_pe_weight_read_d <= `NAMESPACE_MEM_WEIGHT;
    else
      ctrl_pe_weight_read_d <= ctrl_pe_weight_read;
  end


  wire [NUM_DATA-1:0]             weight_read_done_lane;
  wire [NUM_DATA-1:0]             weight_write_done_lane;

  reg  [NUM_DATA-1:0]             weight_read_done_lane_d;
  reg  [NUM_DATA-1:0]             weight_write_done_lane_d;

  //assign weight_read_done   = &weight_read_done_lane_d;
  //assign weight_write_done  = &weight_write_done_lane_d;
  assign weight_read_done   = &weight_read_done_lane_d;
  
  wire [NUM_AXI-1:0] weight_read_done_per_axi;
  wire [NUM_AXI-1:0] weight_write_done_per_axi;
  generate
    for (genvar gen = 0; gen < NUM_AXI; gen = gen + 1)
        begin
        assign weight_read_done_per_axi[gen] = &weight_read_done_lane_d[(gen+1)*NUM_DATA_PER_AXI-1:gen*NUM_DATA_PER_AXI];
        assign weight_write_done_per_axi[gen] = &weight_write_done_lane_d[(gen+1)*NUM_DATA_PER_AXI-1:gen*NUM_DATA_PER_AXI];
 end
 endgenerate
  assign weight_write_done  = &weight_write_done_lane_d;

  genvar gen;
  generate
    for (gen = 0; gen < NUM_DATA; gen = gen + 1)
    begin : WEIGHT_COUNTERS

      wire [PE_ID_WIDTH-1:0]          pe_id_weight_read[0:NUM_PE_PER_LANE-1];
      wire                            valid_weight_read;

      wire [PE_ID_WIDTH-1:0]          pe_id_weight_write[0:NUM_PE_PER_LANE-1];
      wire                            valid_weight_write;

      assign ctrl_pe_weight_read [NAMESPACE_WIDTH + gen*(PE_ID_WIDTH+1)+:PE_ID_WIDTH+1] = {pe_id_weight_read[NUM_PE_PER_LANE-1], valid_weight_read};
      assign ctrl_pe_weight_write[NAMESPACE_WIDTH + gen*(PE_ID_WIDTH+1)+:PE_ID_WIDTH+1] = {pe_id_weight_write[NUM_PE_PER_LANE-1], valid_weight_write};

      reg  [WEIGHT_COUNTER_WIDTH-1:0] counter[0:NUM_PE_PER_LANE];
      wire  [NUM_PE_PER_LANE:0] counter0,counteri;


      
      for( genvar pe =0 ; pe < NUM_PE_PER_LANE+1; pe=pe+1) begin
          if(pe == 0 || pe == NUM_PE_PER_LANE) begin
            assign counter0[pe] = (counter[pe] == {WEIGHT_COUNTER_WIDTH{1'b0}});
            assign counteri[pe] = (counter[pe] == counter_init[gen][pe]);
          end
          else begin
            assign counter0[pe] = (counter[pe] == {WEIGHT_COUNTER_WIDTH{1'b0}}) && counter0[pe-1];
            assign counteri[pe] = (counter[pe] == counter_init[gen][pe]) && counteri[pe-1];
          end

          always @(posedge clk)
          begin
            if (!resetn)
            begin 
                counter[pe] <= counter_init[gen][pe];
            end
            else if (state == `WEIGHT_READ && !rd_buf_empty)
            begin
                if(pe == 0 || pe == NUM_PE_PER_LANE) begin
                    if(counter0[pe] == 1'b0)
                        counter[pe] <= counter[pe] - 1;
                end
                else if(counter0[pe-1] == 1'b1 ) begin
                    if( counter0[pe] == 1'b0)
                        counter[pe] <= counter[pe] - 1;
                end    
    
            end
            else if (state == `WEIGHT_WRITE && !wr_buf_full)
            begin
                if(pe == 0 || pe == NUM_PE_PER_LANE) begin
                    if(counteri[pe] == 1'b0)
                        counter[pe] <= counter[pe] + 1;
                end
                else if(counteri[pe-1] == 1'b1 ) begin
                    if(counteri[pe] == 1'b0)
                        counter[pe] <= counter[pe] + 1;
                end
            end
          end
      end
      
      for( genvar pe =0 ; pe < NUM_PE_PER_LANE; pe=pe+1) begin
          if(pe == 0 ) begin
            assign pe_id_weight_read[pe] = 0;
            assign pe_id_weight_write[pe] = 0;
          end
          else begin
            assign pe_id_weight_read[pe] = counter0[pe-1] ? pe : pe_id_weight_read[pe-1];
            assign pe_id_weight_write[pe] = counteri[pe-1] ? pe : pe_id_weight_write[pe-1];
          end
      end
      assign weight_read_done_lane [gen] = (counter0[NUM_PE_PER_LANE] == 1) || (counter[NUM_PE_PER_LANE] == 1 && rd_buf_pop);
      assign weight_write_done_lane [gen] = counter[NUM_PE_PER_LANE] == counter_init[gen][NUM_PE_PER_LANE];

      always @(posedge clk)
      begin
        if (~resetn)
          weight_read_done_lane_d[gen] <= 0;
        else
          weight_read_done_lane_d[gen] <= weight_read_done_lane[gen];
      end

      always @(posedge clk)
      begin
        if (~resetn)
          weight_write_done_lane_d[gen] <= 0;
        else
          weight_write_done_lane_d[gen] <= weight_write_done_lane[gen];
      end

        assign valid_weight_read  =  ~counter0[NUM_PE_PER_LANE-1];
        assign valid_weight_write =  ~counteri[NUM_PE_PER_LANE-1];
        
//      assign pe_id_weight_read  = (counter_0 != 0) ? 2'd0 :
//                                  (counter_1 != 0) ? 2'd1 :
//                                  (counter_2 != 0) ? 2'd2 : 2'd3;
//      assign valid_weight_read  = (counter_0 != 0) ||
//                                  (counter_1 != 0) ||
//                                  (counter_2 != 0) ||
//                                  (counter_3 != 0);
//      assign pe_id_weight_write = (counter_0 != counter_0_init) ? 2'd0 :
//                                  (counter_1 != counter_1_init) ? 2'd1 : 
//                                  (counter_2 != counter_2_init) ? 2'd2 : 2'd3;
//      assign valid_weight_write = (counter_0 != counter_0_init) ||
//                                  (counter_1 != counter_1_init) ||
//                                  (counter_2 != counter_2_init) ||
//                                  (counter_3 != counter_3_init);

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


generate 
for(genvar i = 0 ; i< NUM_AXI; i= i+1) begin
  always @(posedge clk)
  begin
    if (resetn == 0)
    begin
      data_rd_addr_d[(i+1)*32-1:i*32] <= 0;
    end else if (state == `STATE_IDLE) begin
      data_rd_addr_d[(i+1)*32-1:i*32] <= data_rd_addr+rd_req_size * C_M_AXI_DATA_WIDTH/8 *i;
    end else if (rd_req)
    begin
      data_rd_addr_d[(i+1)*32-1:i*32] <= data_rd_addr_d[(i+1)*32-1:i*32] + rd_req_size * C_M_AXI_DATA_WIDTH/8 * NUM_AXI;
    end
  end
end
endgenerate
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
    
    wr_buf_push_w = 0;
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
       ctrl_pe_reg[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;
        if (!rd_buf_empty)
        begin
          next_state = `WEIGHT_READ;
        end
      end

      `DATA_READ : begin
        {ctrl_pe_reg, ctrl_op_code, shift_reg} = ctrl_buf_data_out;
        if (ctrl_op_code_w != OP_SHIFT) begin
          ctrl_pe_reg = 0;
          ctrl_pe_reg[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
          end
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
        ctrl_pe_reg[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
        if (!rd_buf_empty)
        begin
          next_state = `DATA_READ;
          ctrl_buf_read_en = 1'b1;
        end
      end

      `STATE_COMPUTE : begin
//        ctrl_pe_reg[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_DATA;
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
        
        if (weight_write_done)
        begin
          ctrl_pe_reg = ctrl_pe_weight_write;
          next_state = `STATE_IDLE;
          wr_buf_push_w = 1'b1;
        end
        else if (wr_buf_full)
        begin
          ctrl_pe_reg[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;
          next_state = `WEIGHT_WRITE_WAIT;
          wr_buf_push_w = 1'b0;
        end
        else begin
          ctrl_pe_reg = ctrl_pe_weight_write;
          wr_buf_push_w = 1'b1;
        end
            
      end

      `WEIGHT_WRITE_WAIT : begin
        ctrl_pe_reg[NAMESPACE_WIDTH-1:0] = `NAMESPACE_MEM_WEIGHT;
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
  assign rd_buf_pop_per_axi = (({NUM_AXI{(state == `WEIGHT_READ)}} & (~weight_read_done_per_axi) ) | ({NUM_AXI{((ctrl_op_code == OP_READ) && ctrl_buf_read_en_d)}}&shift_reg[NUM_AXI-1:0])) & {NUM_AXI{!rd_buf_empty}};
reg [`STATE_WIDTH-1:0] prev_state;
  //assign data_io_dir = (prev_state == `WEIGHT_WRITE) && (state == `WEIGHT_WRITE);
  reg data_io_dir_d;
  always @(posedge clk) begin
   data_io_dir <= (!weight_write_done && (next_state == `WEIGHT_WRITE));// && (state == `WEIGHT_WRITE));
    data_io_dir_d <= data_io_dir;
end
//   assign data_io_dir = (!weight_write_done && (state == `WEIGHT_WRITE) && (prev_state == `WEIGHT_WRITE));
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

//assign compute_start = prev_state != `STATE_COMPUTE && state == `STATE_COMPUTE;
assign compute_start = prev_state != `DATA_READ && state == `DATA_READ;

assign done = state == `STATE_IDLE;
reg wr_buf_push_t;
always @(posedge clk)
begin
  if (resetn) begin
    wr_buf_push_t <= wr_buf_push_w;
    wr_buf_push <= {NUM_AXI{wr_buf_push_t}} & ~weight_write_done_per_axi;
  end
  else begin
    wr_buf_push_t <= 0;
    wr_buf_push <= 0;
  end
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
