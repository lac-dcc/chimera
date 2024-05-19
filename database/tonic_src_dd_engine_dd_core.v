// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module dd_core (
    input                                   clk,
    input                                   rst_n,

    // inputs
    input           [`FLOW_ID_W-1:0]        next_fid_in,

    input           [`FLOW_ID_W-1:0]        dp_fid_in,
    input           [`CR_CONTEXT_W-1:0]     cr_cntxt_in,

    input           [`FLOW_ID_W-1:0]        incoming_fid_in,
    input           [`PKT_TYPE_W-1:0]       pkt_type_in,
    input           [`PKT_DATA_W-1:0]       pkt_data_in,

    // outputs
    output          [`FLOW_SEQ_NUM_W-1:0]   next_seq_out,
    output          [`TX_CNT_W-1:0]         next_seq_tx_id_out,
    output          [`FLOW_ID_W-1:0]        next_seq_fid_out,
 
    output          [`FLAG_W-1:0]           timeout_val_out,
    output          [`FLOW_ID_W-1:0]        timeout_fid_out,
    output          [`DD_CONTEXT_W-1:0]     dd_cntxt_out,

    output  reg     [`FLOW_ID_W-1:0]        next_enq_fid1,
    output  reg     [`FLOW_ID_W-1:0]        next_enq_fid2,
    output  reg     [`FLOW_ID_W-1:0]        next_enq_fid3,
    output  reg     [`FLOW_ID_W-1:0]        next_enq_fid4
);

//*********************************************************************************
// Local Parameters
//*********************************************************************************

// Context 1 = next_new, wnd_start, wnd_start_ind,
//             tx_cnt_wnd, acked_wnd, wnd_size

localparam  CONTEXT_1_W             = `FLOW_WIN_SIZE_W  + `FLOW_WIN_SIZE  + 
                                      `TX_CNT_WIN_SIZE  + `FLOW_WIN_IND_W + 
                                      `FLOW_SEQ_NUM_W   + `FLOW_SEQ_NUM_W ;

localparam  WND_SIZE_START          = `FLOW_WIN_SIZE_W - 1;
localparam  ACKED_WND_START         = WND_SIZE_START + `FLOW_WIN_SIZE;
localparam  TX_CNT_WND_START        = ACKED_WND_START + `TX_CNT_WIN_SIZE;
localparam  WND_START_IND_START     = TX_CNT_WND_START + `FLOW_WIN_IND_W;
localparam  WND_START_START         = WND_START_IND_START + `FLOW_SEQ_NUM_W;
localparam  NEXT_NEW_START          = WND_START_START + `FLOW_SEQ_NUM_W;

// Context 2 = total_tx, rtx_exptime, active_rtx_timer, pkt_queue_size,
//             back_pressure, idle, rtx_wnd, rtx_timer_amnt


localparam  USER_CONTEXT_START      = `USER_CONTEXT_W - 1;

localparam  FIXED_CONTEXT_2_W       = `FLOW_SEQ_NUM_W   +
                                      `TIME_W           + `FLAG_W + 
                                      `PKT_QUEUE_IND_W  + `FLAG_W + 
                                      `FLAG_W           + `FLOW_WIN_SIZE + 
                                      `TIMER_W;

localparam  RTX_TIMER_AMNT_START    = USER_CONTEXT_START + `TIMER_W;
localparam  RTX_WND_START           = RTX_TIMER_AMNT_START + `FLOW_WIN_SIZE;
localparam  IDLE_START              = RTX_WND_START + `FLAG_W;
localparam  BACK_PRESSURE_START     = IDLE_START + `FLAG_W;
localparam  PKT_QUEUE_SIZE_START    = BACK_PRESSURE_START + `PKT_QUEUE_IND_W;
localparam  ACTIVE_RTX_TIMER_START  = PKT_QUEUE_SIZE_START + `FLAG_W;
localparam  RTX_EXPTIME_START       = ACTIVE_RTX_TIMER_START + `TIME_W;
localparam  TOTAL_TX_CNT_START      = RTX_EXPTIME_START + `FLOW_SEQ_NUM_W;


localparam  CONTEXT_2_W             = FIXED_CONTEXT_2_W + `USER_CONTEXT_W;


localparam  ACK_PADDING_W = `PKT_DATA_W - (2 * `FLOW_SEQ_NUM_W + `TX_CNT_W);

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

wire    [`FLOW_SEQ_NUM_W-1:0]   cumulative_ack_in;
wire    [`FLOW_SEQ_NUM_W-1:0]   selective_ack_in;
wire    [`TX_CNT_W-1:0]         sack_tx_id_in;

wire    [ACK_PADDING_W-1:0]     ack_padding;

reg     [`FLOW_ID_W-1:0]        timeout_fid_in;
reg     [`TIME_W-1:0]           global_time;

wire    [`FLOW_ID_W-1:0]        inc0_fid_in;
reg     [`FLOW_ID_W-1:0]        inc1_fid_in;

// Context Look-Up Stage - Flow Ids and Contexts

wire    [`FLOW_ID_W-1:0]    next_fid_l;
wire    [`FLOW_ID_W-1:0]    dp_fid_l;
wire    [`FLOW_ID_W-1:0]    inc0_fid_l;
wire    [`FLOW_ID_W-1:0]    timeout_fid_l;
wire    [`FLOW_ID_W-1:0]    inc1_fid_l;

wire    [`FLOW_ID_W-1:0]    next_fid_l_from_store;
wire    [`FLOW_ID_W-1:0]    org_timeout_fid_l;

wire    [`FLOW_ID_W-1:0]    tmp_next_fid_l;
wire    [`FLOW_ID_W-1:0]    tmp_timeout_fid_l;
wire    [`FLOW_ID_W-1:0]    tmp_fid_l;

wire    [CONTEXT_1_W-1:0]   next_cntxt_1_l;
wire    [CONTEXT_1_W-1:0]   inc0_cntxt_1_l;
wire    [CONTEXT_1_W-1:0]   timeout_cntxt_1_l;

wire    [CONTEXT_1_W-1:0]   tmp_cntxt_1_l;
wire    [CONTEXT_1_W-1:0]   next_cntxt_1_l_from_store;

wire    [CONTEXT_2_W-1:0]   next_cntxt_2_l;
wire    [CONTEXT_2_W-1:0]   dp_cntxt_2_l;
wire    [CONTEXT_2_W-1:0]   inc1_cntxt_2_l;
wire    [CONTEXT_2_W-1:0]   timeout_cntxt_2_l;

wire    [CONTEXT_2_W-1:0]   next_cntxt_2_l_from_store;
// Data Delivery Logic Stage - Flow Ids and Contexts

reg     [`FLOW_ID_W-1:0]    next_fid_p;
reg     [`FLOW_ID_W-1:0]    dp_fid_p;
reg     [`FLOW_ID_W-1:0]    inc0_fid_p;
reg     [`FLOW_ID_W-1:0]    timeout_fid_p;
reg     [`FLOW_ID_W-1:0]    inc1_fid_p;

reg     [CONTEXT_1_W-1:0]   next_cntxt_1_p;
reg     [CONTEXT_1_W-1:0]   inc1_cntxt_1_p;
reg     [CONTEXT_1_W-1:0]   inc0_cntxt_1_p;
reg     [CONTEXT_1_W-1:0]   timeout_cntxt_1_p;

reg     [CONTEXT_2_W-1:0]   next_cntxt_2_p;
reg     [CONTEXT_2_W-1:0]   dp_cntxt_2_p;
reg     [CONTEXT_2_W-1:0]   inc1_cntxt_2_p;
reg     [CONTEXT_2_W-1:0]   timeout_cntxt_2_p;

//// Data Delivery Logic Stage - Merged Contexts

// Next
wire    [CONTEXT_1_W-1:0]       next_mrged_cntxt_1;
wire    [CONTEXT_2_W-1:0]       next_mrged_cntxt_2;

reg     [`FLOW_WIN_SIZE-1:0]    next_mrged_acked_wnd;
wire    [`TX_CNT_WIN_SIZE-1:0]  next_mrged_tx_cnt_wnd;
reg     [`FLOW_WIN_SIZE-1:0]    next_mrged_rtx_wnd;

reg     [`FLOW_WIN_IND_W-1:0]   next_mrged_wnd_start_ind;
reg     [`FLOW_SEQ_NUM_W-1:0]   next_mrged_wnd_start;
reg     [`FLOW_WIN_SIZE_W-1:0]  next_mrged_wnd_size;

reg     [`PKT_QUEUE_IND_W-1:0]  next_mrged_pkt_queue_size;
reg     [`FLAG_W-1:0]           next_mrged_back_pressure;

reg     [`FLAG_W-1:0]           next_mrged_idle;
reg     [`FLOW_SEQ_NUM_W-1:0]   next_mrged_next_new;

reg     [`FLAG_W-1:0]           next_mrged_active_rtx_timer;
reg     [`TIMER_W-1:0]          next_mrged_rtx_timer_amnt;

reg     [`TIME_W-1:0]           next_mrged_rtx_exptime;

wire    [`FLOW_SEQ_NUM_W-1:0]   next_mrged_total_tx_cnt;

reg     [`USER_CONTEXT_W-1:0]   next_mrged_user_cntxt;

// Dq Prop
wire    [CONTEXT_2_W-1:0]       dp_mrged_cntxt_2;

reg     [`FLOW_WIN_SIZE-1:0]    dp_mrged_rtx_wnd;

reg     [`PKT_QUEUE_IND_W-1:0]  dp_mrged_pkt_queue_size;
reg     [`FLAG_W-1:0]           dp_mrged_back_pressure;
reg     [`FLAG_W-1:0]           dp_mrged_idle;

wire    [`FLAG_W-1:0]           dp_mrged_active_rtx_timer;
reg     [`TIMER_W-1:0]          dp_mrged_rtx_timer_amnt;

reg     [`TIME_W-1:0]           dp_mrged_rtx_exptime;

wire    [`FLOW_SEQ_NUM_W-1:0]   dp_mrged_total_tx_cnt;

reg     [`USER_CONTEXT_W-1:0]   dp_mrged_user_cntxt;

// Incoming 0
wire    [CONTEXT_1_W-1:0]       inc0_mrged_cntxt_1;

reg     [`FLOW_WIN_SIZE-1:0]    inc0_mrged_acked_wnd;
reg     [`TX_CNT_WIN_SIZE-1:0]  inc0_mrged_tx_cnt_wnd;

reg     [`FLOW_WIN_IND_W-1:0]   inc0_mrged_wnd_start_ind;
reg     [`FLOW_SEQ_NUM_W-1:0]   inc0_mrged_wnd_start;
reg     [`FLOW_WIN_SIZE_W-1:0]  inc0_mrged_wnd_size;

reg     [`FLOW_SEQ_NUM_W-1:0]   inc0_mrged_next_new;

// Incoming 1
wire    [CONTEXT_1_W-1:0]       inc1_mrged_cntxt_1;
wire    [CONTEXT_2_W-1:0]       inc1_mrged_cntxt_2;

reg     [`FLOW_WIN_SIZE-1:0]    inc1_mrged_acked_wnd;
reg     [`TX_CNT_WIN_SIZE-1:0]  inc1_mrged_tx_cnt_wnd;
reg     [`FLOW_WIN_SIZE-1:0]    inc1_mrged_rtx_wnd;

reg     [`FLOW_WIN_IND_W-1:0]   inc1_mrged_wnd_start_ind;
reg     [`FLOW_SEQ_NUM_W-1:0]   inc1_mrged_wnd_start;
reg     [`FLOW_WIN_SIZE_W-1:0]  inc1_mrged_wnd_size;


reg     [`PKT_QUEUE_IND_W-1:0]  inc1_mrged_pkt_queue_size;
reg     [`FLAG_W-1:0]           inc1_mrged_back_pressure;

reg     [`FLAG_W-1:0]           inc1_mrged_idle;
reg     [`FLOW_SEQ_NUM_W-1:0]   inc1_mrged_next_new;

wire    [`FLAG_W-1:0]           inc1_mrged_active_rtx_timer;
reg     [`TIMER_W-1:0]          inc1_mrged_rtx_timer_amnt;

wire    [`TIME_W-1:0]           inc1_mrged_rtx_exptime;

wire    [`FLOW_SEQ_NUM_W-1:0]   inc1_mrged_total_tx_cnt;

reg     [`USER_CONTEXT_W-1:0]   inc1_mrged_user_cntxt;

// Timeout
wire    [CONTEXT_1_W-1:0]       timeout_mrged_cntxt_1;
wire    [CONTEXT_2_W-1:0]       timeout_mrged_cntxt_2;

reg     [`FLOW_WIN_SIZE-1:0]    timeout_mrged_acked_wnd;
reg     [`TX_CNT_WIN_SIZE-1:0]  timeout_mrged_tx_cnt_wnd;
reg     [`FLOW_WIN_SIZE-1:0]    timeout_mrged_rtx_wnd;
reg     [`FLOW_WIN_SIZE-1:0]    timeout_exp_mrged_rtx_wnd;

reg     [`FLOW_WIN_IND_W-1:0]   timeout_mrged_wnd_start_ind;
reg     [`FLOW_SEQ_NUM_W-1:0]   timeout_mrged_wnd_start;
reg     [`FLOW_WIN_SIZE_W-1:0]  timeout_mrged_wnd_size;

reg     [`PKT_QUEUE_IND_W-1:0]  timeout_mrged_pkt_queue_size;
reg     [`FLAG_W-1:0]           timeout_mrged_back_pressure;


reg     [`FLOW_SEQ_NUM_W-1:0]   timeout_mrged_next_new;
reg     [`FLAG_W-1:0]           timeout_mrged_idle;
reg     [`FLAG_W-1:0]           timeout_exp_mrged_idle;

wire    [`FLAG_W-1:0]           timeout_mrged_active_rtx_timer;
reg     [`TIMER_W-1:0]          timeout_mrged_rtx_timer_amnt;

wire    [`TIME_W-1:0]           timeout_mrged_rtx_exptime;

wire    [`FLOW_SEQ_NUM_W-1:0]   timeout_mrged_total_tx_cnt;

reg     [`USER_CONTEXT_W-1:0]   timeout_mrged_user_cntxt;

//// Data Delivery Logic Stage - Pipeline Inputs and Outputs

// Next
wire    [`FLOW_WIN_SIZE-1:0]    next_rtx_wnd_out;
wire    [`TX_CNT_WIN_SIZE-1:0]  next_tx_cnt_wnd_out;
wire    [`FLOW_SEQ_NUM_W-1:0]   next_next_new_out;
wire    [`PKT_QUEUE_IND_W-1:0]  next_pkt_queue_size_out;
wire    [`FLAG_W-1:0]           next_back_pressure_out;
wire    [`FLOW_SEQ_NUM_W-1:0]   next_total_tx_cnt_out;
wire    [`FLOW_WIN_IND_W-1:0]   next_seq_ind;   

// Dq Prop
wire    [`PKT_QUEUE_IND_W-1:0]  dp_pkt_queue_size_out;
wire    [`FLAG_W-1:0]           dp_back_pressure_out;
wire    [`FLAG_W-1:0]           activated_by_dp;

// Incoming 0
wire    [`FLOW_WIN_SIZE-1:0]    inc0_acked_wnd_out;
wire    [`FLOW_WIN_IND_W-1:0]   inc0_wnd_start_ind_out;
wire    [`FLOW_SEQ_NUM_W-1:0]   inc0_wnd_start_out;
wire    [`FLOW_WIN_IND_W-1:0]   inc0_new_c_acks_cnt_out;
wire    [`FLAG_W-1:0]           inc0_valid_selective_ack_out;

// Incoming 1
wire    [`FLAG_W-1:0]           activated_by_ack;
wire    [`FLOW_WIN_SIZE-1:0]    inc1_rtx_wnd_out;
wire    [`FLOW_WIN_SIZE_W-1:0]  inc1_wnd_size_out;
wire    [`TIMER_W-1:0]          inc1_rtx_timer_amnt_out;
wire    [`FLAG_W-1:0]           inc1_reset_rtx_timer_out;

reg     [`FLOW_WIN_IND_W-1:0]   inc1_new_c_acks_cnt;
reg     [`FLAG_W-1:0]           inc1_valid_selective_ack;
reg     [`FLOW_SEQ_NUM_W-1:0]   inc1_old_wnd_start;

reg     [`FLOW_SEQ_NUM_W-1:0]   inc1_cumulative_ack;
reg     [`FLOW_SEQ_NUM_W-1:0]   inc1_selective_ack;
reg     [`TX_CNT_W-1:0]         inc1_sack_tx_id;
reg     [`PKT_TYPE_W-1:0]       inc1_pkt_type;
reg     [`PKT_DATA_W-1:0]       inc1_pkt_data;

wire    [`USER_CONTEXT_W-1:0]   inc1_user_cntxt_out;

// Timeout
wire    [`FLAG_W-1:0]           activated_by_timeout;
wire    [`FLOW_WIN_SIZE-1:0]    timeout_rtx_wnd_out;
wire    [`FLOW_WIN_SIZE_W-1:0]  timeout_wnd_size_out;
wire    [`TIMER_W-1:0]          timeout_rtx_timer_amnt_out;

wire    [`FLAG_W-1:0]           timeout_expired;

wire    [`USER_CONTEXT_W-1:0]   timeout_user_cntxt_out;

// Memory and Transport Logic Stage - Ack and Timer Info 
reg     [`FLOW_SEQ_NUM_W-1:0]   cumulative_ack_p, cumulative_ack_l;
reg     [`FLOW_SEQ_NUM_W-1:0]   selective_ack_p, selective_ack_l;
reg     [`TX_CNT_W-1:0]         sack_tx_id_p, sack_tx_id_l;
reg     [`PKT_TYPE_W-1:0]       pkt_type_p, pkt_type_l;
reg     [`PKT_DATA_W-1:0]       pkt_data_p, pkt_data_l;

// Context defaults
wire    [CONTEXT_1_W-1:0]       zero_cntxt_1;
wire    [CONTEXT_2_W-1:0]       zero_cntxt_2;

//*********************************************************************************
// Logic - ACK Initialization
//*********************************************************************************

assign  {cumulative_ack_in, selective_ack_in, 
         sack_tx_id_in, ack_padding} = pkt_data_in;

assign  inc0_fid_in = incoming_fid_in;

always @(posedge clk) begin
  if (~rst_n) begin
    inc1_fid_in <= `FLOW_ID_NONE;
  end
  else begin
    inc1_fid_in <= inc0_fid_in;
  end
end

//*********************************************************************************
// Logic - Timeout FID 
//*********************************************************************************

always @(posedge clk) begin
    if (~rst_n) begin
      timeout_fid_in  <= `FLOW_ID_NONE;
    end
    else begin
      timeout_fid_in  <= timeout_fid_in + 1;
    end
end

//*********************************************************************************
// Logic - Time
//*********************************************************************************

always @(posedge clk) begin
    if (~rst_n) begin
        global_time         <= {`TIME_W{1'b0}};
    end
    else begin
        global_time         <= global_time + 1;
    end
end

//*********************************************************************************
// Logic - Context Store Stage
//*********************************************************************************


cntxt_store_4w4r #(.RAM_TYPE        (0                      ),
                   .DEPTH           (`MAX_FLOW_CNT          ),
                   .ADDR_WIDTH      (`MAX_FLOW_CNT_WIDTH    ),
                   .CONTEXT_WIDTH   (CONTEXT_1_W            )) 
        
         store1  (.clk        (clk                    ),
                  .rst_n      (rst_n                  ),

                  .r_fid0     (next_fid_in            ),
                  .r_fid1     (inc0_fid_in            ),
                  .r_fid2     (timeout_fid_in         ),  
                  .r_fid3     (`FLOW_ID_NONE          ),

                  .w_fid0     (next_fid_p             ),
                  .w_fid1     (inc0_fid_p             ),
                  .w_fid2     (timeout_fid_p          ),
                  .w_fid3     (inc1_fid_p             ),

                  .w_cntxt0   (next_mrged_cntxt_1     ),
                  .w_cntxt1   (inc0_mrged_cntxt_1 ),
                  .w_cntxt2   (timeout_mrged_cntxt_1  ),
                  .w_cntxt3   (inc1_mrged_cntxt_1     ),
                   
                  .l_fid0     (tmp_next_fid_l         ),
                  .l_fid1     (inc0_fid_l             ),
                  .l_fid2     (tmp_timeout_fid_l      ),
                  .l_fid3     (tmp_fid_l              ),

                  .l_cntxt0   (next_cntxt_1_l_from_store ),
                  .l_cntxt1   (inc0_cntxt_1_l         ),
                  .l_cntxt2   (timeout_cntxt_1_l      ),
                  .l_cntxt3   (tmp_cntxt_1_l          ));

cntxt_store_4w4r #(.RAM_TYPE        (1                      ),
                   .DEPTH           (`MAX_FLOW_CNT          ),
                   .ADDR_WIDTH      (`MAX_FLOW_CNT_WIDTH    ),
                   .CONTEXT_WIDTH   (CONTEXT_2_W            )) 
        
         store2  (.clk        (clk                    ),
                  .rst_n      (rst_n                  ),

                  .r_fid0     (next_fid_in            ),
                  .r_fid1     (inc1_fid_in            ),
                  .r_fid2     (dp_fid_in              ),  
                  .r_fid3     (timeout_fid_in         ),

                  .w_fid0     (next_fid_p             ),
                  .w_fid1     (inc1_fid_p             ),
                  .w_fid2     (dp_fid_p               ),
                  .w_fid3     (timeout_fid_p          ),

                  .w_cntxt0   (next_mrged_cntxt_2     ),
                  .w_cntxt1   (inc1_mrged_cntxt_2     ),
                  .w_cntxt2   (dp_mrged_cntxt_2       ),
                  .w_cntxt3   (timeout_mrged_cntxt_2  ),
                   
                  .l_fid0     (next_fid_l_from_store  ),
                  .l_fid1     (inc1_fid_l             ),
                  .l_fid2     (dp_fid_l               ),
                  .l_fid3     (org_timeout_fid_l      ),


                  .l_cntxt0   (next_cntxt_2_l_from_store ),
                  .l_cntxt1   (inc1_cntxt_2_l         ),
                  .l_cntxt2   (dp_cntxt_2_l           ),
                  .l_cntxt3   (timeout_cntxt_2_l      ));

 //*********************************************************************************
// Logic - Data Delivery Logic Stage - Flow IDs and Contexts 
//*********************************************************************************

assign  timeout_fid_l   = org_timeout_fid_l;

always @(posedge clk) begin
    if (~rst_n) begin
      cumulative_ack_l        <= `FLOW_SEQ_NONE;
      selective_ack_l         <= `FLOW_SEQ_NONE;
      sack_tx_id_l            <= {`TX_CNT_W{1'b0}};
      pkt_type_l              <= {`PKT_TYPE_W{1'b0}};
      pkt_data_l              <= {`PKT_DATA_W{1'b0}};
    end
    else begin
      cumulative_ack_l        <= cumulative_ack_in;
      selective_ack_l         <= selective_ack_in;
      sack_tx_id_l            <= sack_tx_id_in;
      pkt_type_l              <= pkt_type_in;
      pkt_data_l              <= pkt_data_in;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        next_fid_p        <= `FLOW_ID_NONE;
        dp_fid_p          <= `FLOW_ID_NONE;
        inc0_fid_p        <= `FLOW_ID_NONE;
        timeout_fid_p     <= `FLOW_ID_NONE;
        inc1_fid_p        <= `FLOW_ID_NONE;

        cumulative_ack_p  <= `FLOW_SEQ_NONE;
        selective_ack_p   <= `FLOW_SEQ_NONE;
        sack_tx_id_p      <= {`TX_CNT_W{1'b0}};
        pkt_type_p        <= {`PKT_TYPE_W{1'b0}};     
        pkt_data_p        <= {`PKT_DATA_W{1'b0}};     
    end
    else begin
        next_fid_p        <= next_fid_l;
        dp_fid_p          <= dp_fid_l;
        inc0_fid_p        <= inc0_fid_l;
        timeout_fid_p     <= timeout_fid_l;
        inc1_fid_p        <= inc1_fid_l;
      
        cumulative_ack_p  <= cumulative_ack_l;
        selective_ack_p   <= selective_ack_l;
        sack_tx_id_p      <= sack_tx_id_l;
        pkt_type_p        <= pkt_type_l;
        pkt_data_p        <= pkt_data_l;
    end
end

assign zero_cntxt_1 = {CONTEXT_1_W{1'b0}};
assign zero_cntxt_2 = {CONTEXT_2_W{1'b0}};

always @(posedge clk) begin
    if (~rst_n) begin
        next_cntxt_1_p       <= zero_cntxt_1;
        inc0_cntxt_1_p       <= zero_cntxt_1;
        timeout_cntxt_1_p    <= zero_cntxt_1;
    end
    else begin
        next_cntxt_1_p       <= next_cntxt_1_l; 
        inc0_cntxt_1_p       <= inc0_cntxt_1_l;
        timeout_cntxt_1_p    <= timeout_cntxt_1_l;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        next_cntxt_2_p       <= zero_cntxt_2;
        dp_cntxt_2_p         <= zero_cntxt_2;
        inc1_cntxt_2_p       <= zero_cntxt_2;
        timeout_cntxt_2_p    <= zero_cntxt_2;
     
    end
    else begin
        next_cntxt_2_p       <= next_cntxt_2_l;
        dp_cntxt_2_p         <= dp_cntxt_2_l;
        inc1_cntxt_2_p       <= inc1_cntxt_2_l;
        timeout_cntxt_2_p    <= timeout_cntxt_2_l;
    end
end

                                                         
//*********************************************************************************
// Logic - Data Delivery Logic Stage - Main Pipelines 
//*********************************************************************************

// Next 
dd_next next(
              .rtx_wnd_in           (next_cntxt_2_p[RTX_WND_START -: `FLOW_WIN_SIZE]            ),
              .tx_cnt_wnd_in        (next_cntxt_1_p[TX_CNT_WND_START -: `TX_CNT_WIN_SIZE]        ),  
              .next_new_in          (next_cntxt_1_p[NEXT_NEW_START -: `FLOW_SEQ_NUM_W]          ),
              .wnd_start_ind_in     (next_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W]     ),
              .wnd_start_in         (next_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W]         ),
              .wnd_size_in          (next_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W]         ),
              .pkt_queue_size_in    (next_cntxt_2_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W]   ),
              .total_tx_cnt_in      (next_cntxt_2_p[TOTAL_TX_CNT_START -: `FLOW_SEQ_NUM_W]      ),
              .rtx_wnd_out          (next_rtx_wnd_out                                           ),
              .tx_cnt_wnd_out       (next_tx_cnt_wnd_out                                        ),
              .next_new_out         (next_next_new_out                                          ),
              .pkt_queue_size_out   (next_pkt_queue_size_out                                    ),
              .back_pressure_out    (next_back_pressure_out                                     ),
              .total_tx_cnt_out     (next_total_tx_cnt_out                                      ),
              .next_seq_out         (next_seq_out                                               ),
              .next_seq_tx_id_out   (next_seq_tx_id_out                                         ),
              .next_seq_ind_out     (next_seq_ind                                               ));

// Dq Prop
dd_dequeue_prop dequeue_prop (
                              .pkt_queue_size_in   (dp_cntxt_2_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W] ),
                              .back_pressure_in    (dp_cntxt_2_p[BACK_PRESSURE_START -: `FLAG_W]           ),
                              .pkt_queue_size_out  (dp_pkt_queue_size_out                                  ),
                              .back_pressure_out   (dp_back_pressure_out                                   ),
                              .activated_by_dp     (activated_by_dp                                        ));

// Incoming Stage 0 
dd_incoming_0 incoming_0(
                          .pkt_type_in            (pkt_type_p                                               ),
                          .cumulative_ack_in      (cumulative_ack_p                                         ),
                          .selective_ack_in       (selective_ack_p                                          ),
                          .sack_tx_id_in          (sack_tx_id_p                                             ),
                          .acked_wnd_in           (inc0_cntxt_1_p[ACKED_WND_START -: `FLOW_WIN_SIZE]        ),
                          .wnd_start_ind_in       (inc0_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W]   ),
                          .wnd_start_in           (inc0_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W]       ),
                          .wnd_size_in            (inc0_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W]       ),
                          .new_c_acks_cnt         (inc0_new_c_acks_cnt_out                                  ),
                          .valid_selective_ack    (inc0_valid_selective_ack_out                             ),
                          .acked_wnd_out          (inc0_acked_wnd_out                                       ),
                          .wnd_start_ind_out      (inc0_wnd_start_ind_out                                   ),
                          .wnd_start_out          (inc0_wnd_start_out                                       ));


always @(posedge clk) begin
    if (~rst_n) begin
        inc1_cumulative_ack       <=  `FLOW_SEQ_NONE;
        inc1_selective_ack        <=  `FLOW_SEQ_NONE;
        inc1_sack_tx_id           <=  {`TX_CNT_W{1'b0}};

        inc1_new_c_acks_cnt       <=  {`FLOW_WIN_IND_W{1'b0}};
        inc1_valid_selective_ack  <=  1'b0;
        inc1_old_wnd_start        <=  {`FLOW_SEQ_NUM_W{1'b0}};
        inc1_pkt_type             <=  `NONE_PKT;    
        inc1_pkt_data             <=  {`PKT_DATA_W{1'b0}};    

        inc1_cntxt_1_p            <=  zero_cntxt_1;
    end
    else begin
        inc1_cumulative_ack       <=  cumulative_ack_p;
        inc1_selective_ack        <=  selective_ack_p;
        inc1_sack_tx_id           <=  sack_tx_id_p;

        inc1_new_c_acks_cnt       <=  inc0_new_c_acks_cnt_out;
        inc1_valid_selective_ack  <=  inc0_valid_selective_ack_out;
        inc1_old_wnd_start        <=  inc0_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W]; 
       
        inc1_cntxt_1_p            <=  inc0_mrged_cntxt_1;
        inc1_pkt_type             <=  pkt_type_p; 
        inc1_pkt_data             <=  pkt_data_p; 
    end
end

dd_incoming_1 incoming_1(
                      .pkt_type_in              (inc1_pkt_type                                          ),
                      .pkt_data_in              (inc1_pkt_data                                          ),
                      .cumulative_ack_in        (inc1_cumulative_ack                                    ),
                      .selective_ack_in         (inc1_selective_ack                                     ),
                      .sack_tx_id_in            (inc1_sack_tx_id                                        ),

                      .now                      (global_time                                            ),
                      .new_c_acks_cnt           (inc1_new_c_acks_cnt                                    ),
                      .valid_selective_ack      (inc1_valid_selective_ack                               ),
                      .old_wnd_start_in         (inc1_old_wnd_start                                     ),
                      .acked_wnd_in             (inc1_cntxt_1_p[ACKED_WND_START -: `FLOW_WIN_SIZE]      ),
                      .rtx_wnd_in               (inc1_cntxt_2_p[RTX_WND_START -: `FLOW_WIN_SIZE]        ),
                      .tx_cnt_wnd_in            (inc1_cntxt_1_p[TX_CNT_WND_START -: `TX_CNT_WIN_SIZE]   ),
                      .wnd_start_ind_in         (inc1_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W] ),
                      .wnd_start_in             (inc1_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W]     ),
                      .wnd_size_in              (inc1_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W]     ),
                      .next_new_in              (inc1_cntxt_1_p[NEXT_NEW_START -: `FLOW_SEQ_NUM_W]      ),
                      .rtx_timer_amnt_in        (inc1_cntxt_2_p[RTX_TIMER_AMNT_START -: `TIMER_W]       ),
                      .total_tx_cnt_in          (inc1_cntxt_2_p[TOTAL_TX_CNT_START -: `FLOW_SEQ_NUM_W]  ),
                      .user_cntxt_in            (inc1_cntxt_2_p[USER_CONTEXT_START -: `USER_CONTEXT_W]  ),
                      
                      .user_cntxt_out           (inc1_user_cntxt_out                                    ),
                      .rtx_wnd_out              (inc1_rtx_wnd_out                                       ),
                      .wnd_size_out             (inc1_wnd_size_out                                      ),
                      .reset_rtx_timer          (inc1_reset_rtx_timer_out                               ),
                      .rtx_timer_amnt_out       (inc1_rtx_timer_amnt_out                                ));


// Timeout
//
assign  timeout_expired = timeout_cntxt_2_p[ACTIVE_RTX_TIMER_START -: `FLAG_W] &
                          timeout_cntxt_2_p[RTX_EXPTIME_START -: `TIME_W] <= global_time &
                          timeout_fid_p != inc0_fid_p &
                          timeout_fid_p != inc1_fid_p &
                          timeout_fid_p != `FLOW_ID_NONE;


dd_timeout timeout(
                .timeout_expired          (timeout_expired                                            ),
                .now                      (global_time                                                ),
                .rtx_wnd_in               (timeout_cntxt_2_p[RTX_WND_START -: `FLOW_WIN_SIZE]         ),
                .acked_wnd_in             (timeout_cntxt_1_p[ACKED_WND_START -: `FLOW_WIN_SIZE]       ),
                .tx_cnt_wnd_in            (timeout_cntxt_1_p[TX_CNT_WND_START -: `TX_CNT_WIN_SIZE]    ),
                .next_new_in              (timeout_cntxt_1_p[NEXT_NEW_START -: `FLOW_SEQ_NUM_W]       ),
                .wnd_start_ind_in         (timeout_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W]  ),
                .wnd_start_in             (timeout_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W]      ),
                .wnd_size_in              (timeout_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W]      ),
                .rtx_timer_amnt_in        (timeout_cntxt_2_p[RTX_TIMER_AMNT_START -: `TIMER_W]        ),
                .total_tx_cnt_in          (timeout_cntxt_2_p[TOTAL_TX_CNT_START -: `FLOW_SEQ_NUM_W]   ),
                .user_cntxt_in            (timeout_cntxt_2_p[USER_CONTEXT_START -: `USER_CONTEXT_W]   ),
                
                .user_cntxt_out           (timeout_user_cntxt_out                                     ),
                .rtx_wnd_out              (timeout_rtx_wnd_out                                        ),
                .wnd_size_out             (timeout_wnd_size_out                                       ),
                .rtx_timer_amnt_out       (timeout_rtx_timer_amnt_out                                 ));

//*********************************************************************************
// Logic - Data Delivery Logic Stage - Merge 
//*********************************************************************************

// Context 1

assign next_mrged_cntxt_1 = {next_mrged_next_new, next_mrged_wnd_start, 
                             next_mrged_wnd_start_ind, next_mrged_tx_cnt_wnd, 
                             next_mrged_acked_wnd, next_mrged_wnd_size};


assign inc1_mrged_cntxt_1 = {inc1_mrged_next_new, inc1_mrged_wnd_start, 
                             inc1_mrged_wnd_start_ind, inc1_mrged_tx_cnt_wnd, 
                             inc1_mrged_acked_wnd, inc1_mrged_wnd_size};

assign inc0_mrged_cntxt_1 = {inc0_mrged_next_new, inc0_mrged_wnd_start, 
                             inc0_mrged_wnd_start_ind, inc0_mrged_tx_cnt_wnd, 
                             inc0_mrged_acked_wnd, inc0_mrged_wnd_size};

assign timeout_mrged_cntxt_1 = {timeout_mrged_next_new, timeout_mrged_wnd_start, 
                                timeout_mrged_wnd_start_ind, timeout_mrged_tx_cnt_wnd, 
                                timeout_mrged_acked_wnd, timeout_mrged_wnd_size};




// Context 2

assign next_mrged_cntxt_2 = {next_mrged_total_tx_cnt,
                             next_mrged_rtx_exptime, next_mrged_active_rtx_timer, 
                             next_mrged_pkt_queue_size, next_mrged_back_pressure, 
                             next_mrged_idle, next_mrged_rtx_wnd,
                             next_mrged_rtx_timer_amnt, next_mrged_user_cntxt};

assign dp_mrged_cntxt_2 = {dp_mrged_total_tx_cnt,
                           dp_mrged_rtx_exptime, dp_mrged_active_rtx_timer, 
                           dp_mrged_pkt_queue_size, dp_mrged_back_pressure, 
                           dp_mrged_idle, dp_mrged_rtx_wnd,
                           dp_mrged_rtx_timer_amnt, dp_mrged_user_cntxt};

assign inc1_mrged_cntxt_2 = {inc1_mrged_total_tx_cnt,
                             inc1_mrged_rtx_exptime, inc1_mrged_active_rtx_timer, 
                             inc1_mrged_pkt_queue_size, inc1_mrged_back_pressure, 
                             inc1_mrged_idle, inc1_mrged_rtx_wnd,
                             inc1_mrged_rtx_timer_amnt, inc1_mrged_user_cntxt};

assign timeout_mrged_cntxt_2 = {timeout_mrged_total_tx_cnt,
                                timeout_mrged_rtx_exptime, timeout_mrged_active_rtx_timer, 
                                timeout_mrged_pkt_queue_size, timeout_mrged_back_pressure, 
                                timeout_mrged_idle, timeout_mrged_rtx_wnd,
                                timeout_mrged_rtx_timer_amnt, timeout_mrged_user_cntxt};

//****************************
// idle 
//****************************

// Next
always @(*) begin
    next_mrged_idle = (next_next_new_out >= next_mrged_wnd_start + next_mrged_wnd_size) & ~(|next_mrged_rtx_wnd);
end
 
// Dq Prop
 
always @(*) begin
    if (dp_fid_p == next_fid_p) begin
        dp_mrged_idle = next_mrged_idle;
    end
    else if (dp_fid_p == inc1_fid_p) begin
        dp_mrged_idle = inc1_mrged_idle;
    end
    else if (dp_fid_p == timeout_fid_p & timeout_expired) begin
        dp_mrged_idle = timeout_exp_mrged_idle;
    end
    else begin
        dp_mrged_idle = dp_cntxt_2_p[IDLE_START -: `FLAG_W];
    end
end

// Incoming 1
always @(*) begin
    inc1_mrged_idle = (inc1_mrged_next_new >= inc1_mrged_wnd_start + inc1_wnd_size_out) & ~(|inc1_mrged_rtx_wnd);
end
 
// Timeout
always @(*) begin
    timeout_exp_mrged_idle = (timeout_mrged_next_new >= timeout_mrged_wnd_start + timeout_wnd_size_out) & ~(|timeout_mrged_rtx_wnd);
end

always @(*) begin
    if (timeout_expired) begin
        timeout_mrged_idle = timeout_exp_mrged_idle;
    end
    else if (timeout_fid_p == next_fid_p) begin
        timeout_mrged_idle = next_mrged_idle;
    end
    else if (timeout_fid_p == inc1_fid_p) begin
        timeout_mrged_idle = inc1_mrged_idle;
    end
    else begin
        timeout_mrged_idle = timeout_cntxt_2_p[IDLE_START -: `FLAG_W];
    end
end


//****************************
// pkt_queue_size  
//****************************

// Next
always @(*) begin
    if (next_fid_p == dp_fid_p) begin
        next_mrged_pkt_queue_size = next_cntxt_2_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W];
    end
    else begin
        next_mrged_pkt_queue_size = next_pkt_queue_size_out;
    end
end

// Dq Prop
always @(*) begin
    if (dp_fid_p == next_fid_p) begin
        dp_mrged_pkt_queue_size = dp_cntxt_2_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W];
    end
    else begin
        dp_mrged_pkt_queue_size = dp_pkt_queue_size_out;
    end
end

// Incoming 1
always @(*) begin
    if (inc1_fid_p == next_fid_p) begin
        inc1_mrged_pkt_queue_size = next_mrged_pkt_queue_size;
    end
    else if (inc1_fid_p == dp_fid_p) begin
        inc1_mrged_pkt_queue_size = dp_mrged_pkt_queue_size;
    end
    else begin
        inc1_mrged_pkt_queue_size = inc1_cntxt_2_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W];
    end
end

// Timeout
always @(*) begin
    if (timeout_fid_p == next_fid_p) begin
        timeout_mrged_pkt_queue_size = next_mrged_pkt_queue_size;
    end
    else if (timeout_fid_p == dp_fid_p) begin
        timeout_mrged_pkt_queue_size = dp_mrged_pkt_queue_size;
    end
    else begin
        timeout_mrged_pkt_queue_size = timeout_cntxt_2_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W];
    end
end

//****************************
// back_pressure 
//****************************

// Next
always @(*) begin
    if (next_fid_p == dp_fid_p) begin
        next_mrged_back_pressure = 1'b0;
    end
    else begin
        next_mrged_back_pressure = next_back_pressure_out;
    end
end

// Dq Prop
always @(*) begin
    if (dp_fid_p == next_fid_p) begin
        dp_mrged_back_pressure = 1'b0;
    end
    else begin
        dp_mrged_back_pressure = dp_back_pressure_out;
    end
end

// Incoming 1
always @(*) begin
    if (inc1_fid_p == next_fid_p) begin
        inc1_mrged_back_pressure = next_mrged_back_pressure;
    end
    else if (inc1_fid_p == dp_fid_p) begin
        inc1_mrged_back_pressure = dp_mrged_back_pressure;
    end
    else begin
        inc1_mrged_back_pressure = inc1_cntxt_2_p[BACK_PRESSURE_START -: `FLAG_W];
    end
end

// Timeout
always @(*) begin
    if (timeout_fid_p == next_fid_p) begin
        timeout_mrged_back_pressure = next_mrged_back_pressure;
    end
    else if (timeout_fid_p == dp_fid_p) begin
        timeout_mrged_back_pressure = dp_mrged_back_pressure;
    end
    else begin
        timeout_mrged_back_pressure = timeout_cntxt_2_p[BACK_PRESSURE_START -: `FLAG_W];
    end
end

//****************************
// rtx_wnd 
//****************************


genvar i;

// Next
generate 

for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_next_mrged_rtx_wnd
    always @(*) begin
        if (next_fid_p == inc1_fid_p) begin
            if (next_seq_ind == i) begin
                next_mrged_rtx_wnd[i] = next_rtx_wnd_out[i];
            end
            else begin
                next_mrged_rtx_wnd[i] = inc1_rtx_wnd_out[i];
            end
        end
        else if (next_fid_p == timeout_fid_p & timeout_expired) begin
            if (next_seq_ind == i) begin
                next_mrged_rtx_wnd[i] = next_rtx_wnd_out[i];
            end 
            else begin
                next_mrged_rtx_wnd[i] = timeout_rtx_wnd_out[i];
            end
        end
        else begin
            next_mrged_rtx_wnd[i] = next_rtx_wnd_out[i];
        end
    end
end
endgenerate

// Dq Prop
always @(*) begin
    if (dp_fid_p == next_fid_p) begin
        dp_mrged_rtx_wnd = next_mrged_rtx_wnd;
    end
    else if (dp_fid_p == inc1_fid_p) begin
        dp_mrged_rtx_wnd = inc1_mrged_rtx_wnd;
    end
    else if (dp_fid_p == timeout_fid_p & timeout_expired) begin
        dp_mrged_rtx_wnd = timeout_exp_mrged_rtx_wnd;
    end
    else begin
        dp_mrged_rtx_wnd = dp_cntxt_2_p[RTX_WND_START -: `FLOW_WIN_SIZE];
    end
end

// Incoming 1
generate 
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_inc1_mrged_rtx_wnd
    always @(*) begin
        if (next_fid_p == inc1_fid_p) begin
            if (next_seq_ind == i) begin
                inc1_mrged_rtx_wnd[i] = next_rtx_wnd_out[i];
            end
            else begin
                inc1_mrged_rtx_wnd[i] = inc1_rtx_wnd_out[i];
            end
        end
        else begin
            inc1_mrged_rtx_wnd[i] = inc1_rtx_wnd_out[i];
        end
    end
end
endgenerate

// Timeout

generate 
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_timeout_mrged_rtx_wnd
    always @(*) begin
        if (next_fid_p == timeout_fid_p) begin
            if (next_seq_ind == i) begin
                timeout_exp_mrged_rtx_wnd[i] = next_rtx_wnd_out[i];
            end
            else begin
                timeout_exp_mrged_rtx_wnd[i] = timeout_rtx_wnd_out[i];
            end
        end
        else begin
            timeout_exp_mrged_rtx_wnd[i] = timeout_rtx_wnd_out[i];
        end
    end
end
endgenerate

always @(*) begin
    if (timeout_expired) begin
        timeout_mrged_rtx_wnd = timeout_exp_mrged_rtx_wnd;
    end
    else if (timeout_fid_p == next_fid_p) begin
        timeout_mrged_rtx_wnd = next_mrged_rtx_wnd;
    end
    else if (timeout_fid_p == inc1_fid_p) begin
        timeout_mrged_rtx_wnd = inc1_mrged_rtx_wnd;
    end
    else begin
        timeout_mrged_rtx_wnd = timeout_cntxt_2_p[RTX_WND_START -: `FLOW_WIN_SIZE];
    end
end

//****************************
// tx_cnt_wnd
//****************************

// Next
assign next_mrged_tx_cnt_wnd = next_tx_cnt_wnd_out;

// Incoming 1
always @(*) begin
    if (inc1_fid_p == next_fid_p) begin
        inc1_mrged_tx_cnt_wnd = next_tx_cnt_wnd_out;
    end
    else begin
        inc1_mrged_tx_cnt_wnd = inc1_cntxt_1_p[TX_CNT_WND_START -: `TX_CNT_WIN_SIZE];
    end
end

// Incoming 0
always @(*) begin
    if (inc0_fid_p == next_fid_p) begin
        inc0_mrged_tx_cnt_wnd = next_tx_cnt_wnd_out;
    end
    else begin
        inc0_mrged_tx_cnt_wnd = inc0_cntxt_1_p[TX_CNT_WND_START -: `TX_CNT_WIN_SIZE];
    end
end

// Timeout
always @(*) begin
    if (timeout_fid_p == next_fid_p) begin
        timeout_mrged_tx_cnt_wnd = next_tx_cnt_wnd_out;
    end
    else begin
        timeout_mrged_tx_cnt_wnd = timeout_cntxt_1_p[TX_CNT_WND_START -: `TX_CNT_WIN_SIZE];
    end
end

//****************************
// acked_wnd 
//****************************

// Next
always @(*) begin
    if (next_fid_p == inc0_fid_p) begin
        next_mrged_acked_wnd = inc0_acked_wnd_out;
    end
    else begin
        next_mrged_acked_wnd = next_cntxt_1_p[ACKED_WND_START -: `FLOW_WIN_SIZE];
    end
end

// Incoming 1
always @(*) begin
    if (inc1_fid_p == inc0_fid_p) begin
        inc1_mrged_acked_wnd = inc0_acked_wnd_out;
    end
    else begin
        inc1_mrged_acked_wnd = inc1_cntxt_1_p[ACKED_WND_START -: `FLOW_WIN_SIZE];
    end
end

// Incoming 0
always @(*) begin
    inc0_mrged_acked_wnd = inc0_acked_wnd_out;
end

// Timeout
always @(*) begin
    if (timeout_fid_p == inc0_fid_p) begin
        timeout_mrged_acked_wnd = inc0_acked_wnd_out;
    end
    else begin
        timeout_mrged_acked_wnd = timeout_cntxt_1_p[ACKED_WND_START -: `FLOW_WIN_SIZE];
    end
end

//****************************
// wnd_start_ind 
//****************************

// Next
always @(*) begin
    if (next_fid_p == inc0_fid_p) begin
        next_mrged_wnd_start_ind = inc0_wnd_start_ind_out;
    end
    else begin
        next_mrged_wnd_start_ind = next_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W];
    end 
end

// Incoming 1
always @(*) begin
    if (inc1_fid_p == inc0_fid_p) begin
        inc1_mrged_wnd_start_ind = inc0_wnd_start_ind_out;
    end
    else begin
        inc1_mrged_wnd_start_ind = inc1_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W];
    end 
end


// Incoming 0 
always @(*) begin
    inc0_mrged_wnd_start_ind = inc0_wnd_start_ind_out;
end

// Timeout
always @(*) begin
    if (timeout_fid_p == inc0_fid_p) begin
        timeout_mrged_wnd_start_ind = inc0_wnd_start_ind_out;
    end
    else begin
        timeout_mrged_wnd_start_ind = timeout_cntxt_1_p[WND_START_IND_START -: `FLOW_WIN_IND_W];
    end 
end

//****************************
// wnd_start 
//****************************

// Next
always @(*) begin
    if (next_fid_p == inc0_fid_p) begin
        next_mrged_wnd_start = inc0_wnd_start_out;
    end
    else begin
        next_mrged_wnd_start = next_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W];
    end 
end

// Incoming 1
always @(*) begin
    if (inc1_fid_p == inc0_fid_p) begin
        inc1_mrged_wnd_start = inc0_wnd_start_out;
    end
    else begin
        inc1_mrged_wnd_start = inc1_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W];
    end 
end


// Incoming 0 
always @(*) begin
    inc0_mrged_wnd_start = inc0_wnd_start_out;
end

// Timeout
always @(*) begin
    if (timeout_fid_p == inc0_fid_p) begin
        timeout_mrged_wnd_start = inc0_wnd_start_out;
    end
    else begin
        timeout_mrged_wnd_start = timeout_cntxt_1_p[WND_START_START -: `FLOW_SEQ_NUM_W];
    end 
end

//****************************
// next_new 
//****************************

// Next
always @(*) begin
    next_mrged_next_new = next_next_new_out;
end

// Incoming 1
always @(*) begin
    if (next_fid_p == inc1_fid_p) begin
        inc1_mrged_next_new = next_next_new_out;
    end
    else begin
        inc1_mrged_next_new = inc1_cntxt_1_p[NEXT_NEW_START -: `FLOW_SEQ_NUM_W];
    end
end

// Incoming 0
always @(*) begin
    if (next_fid_p == inc0_fid_p) begin
        inc0_mrged_next_new = next_next_new_out;
    end
    else begin
        inc0_mrged_next_new = inc0_cntxt_1_p[NEXT_NEW_START -: `FLOW_SEQ_NUM_W];
    end
end

// Timeout
always @(*) begin
    if (next_fid_p == timeout_fid_p) begin
        timeout_mrged_next_new = next_next_new_out;
    end
    else begin
        timeout_mrged_next_new = timeout_cntxt_1_p[NEXT_NEW_START -: `FLOW_SEQ_NUM_W];
    end
end

//****************************
// wnd_size 
//****************************

// Next
always @(*) begin
    if (next_fid_p == inc1_fid_p) begin
        next_mrged_wnd_size = inc1_wnd_size_out;
    end
    else if (next_fid_p == timeout_fid_p & timeout_expired) begin
        next_mrged_wnd_size = timeout_wnd_size_out;
    end
    else begin
        next_mrged_wnd_size = next_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W];
    end
end

// Incoming 0
always @(*) begin
    if (inc0_fid_p == inc1_fid_p) begin
        inc0_mrged_wnd_size = inc1_wnd_size_out;
    end
    else begin
        inc0_mrged_wnd_size = inc0_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W];
    end
end

// Incoming 1
always @(*) begin
    inc1_mrged_wnd_size = inc1_wnd_size_out;
end

// Timeout
always @(*) begin
    if (timeout_expired) begin
      timeout_mrged_wnd_size = timeout_wnd_size_out;
    end
    else if (timeout_fid_p == inc1_fid_p) begin
        timeout_mrged_wnd_size = inc1_wnd_size_out;
    end
    else begin
        timeout_mrged_wnd_size = timeout_cntxt_1_p[WND_SIZE_START -: `FLOW_WIN_SIZE_W];
    end
end

//****************************
// active_rtx_timer
//****************************

// Next
always @(*) begin
    if (next_fid_p == dp_fid_p) begin
        next_mrged_active_rtx_timer = 1'b1;
    end
    else if (next_fid_p == inc1_fid_p) begin
        next_mrged_active_rtx_timer = inc1_mrged_active_rtx_timer;
    end
    else if (next_fid_p == timeout_fid_p & timeout_expired) begin
        next_mrged_active_rtx_timer = 1'b0;
    end
    else begin 
        next_mrged_active_rtx_timer = next_cntxt_2_p[ACTIVE_RTX_TIMER_START -: `FLAG_W]; 
    end
end

// Dq Prop
assign dp_mrged_active_rtx_timer = 1'b1;

// Incoming 1
assign inc1_mrged_active_rtx_timer = (inc1_fid_p == dp_fid_p) | inc1_reset_rtx_timer_out ? 1'b1 : 
                                     inc1_cntxt_2_p[ACTIVE_RTX_TIMER_START -: `FLAG_W];

// Timeout
assign timeout_mrged_active_rtx_timer = timeout_expired ? timeout_fid_p == dp_fid_p : timeout_cntxt_2_p[ACTIVE_RTX_TIMER_START -: `FLAG_W];

//****************************
// rtx_timer_amnt 
//****************************

//Next
always @(*) begin
    if (next_fid_p == inc1_fid_p) begin
        next_mrged_rtx_timer_amnt = inc1_rtx_timer_amnt_out;
    end
    else if (next_fid_p == timeout_fid_p & timeout_expired) begin
        next_mrged_rtx_timer_amnt = timeout_rtx_timer_amnt_out;
    end
    else begin
        next_mrged_rtx_timer_amnt = next_cntxt_2_p[RTX_TIMER_AMNT_START -: `TIMER_W];
    end
end

// Dq Prop
always @(*) begin
    if (dp_fid_p == inc1_fid_p) begin
        dp_mrged_rtx_timer_amnt = inc1_rtx_timer_amnt_out;
    end
    else if (dp_fid_p == timeout_fid_p & timeout_expired) begin
        dp_mrged_rtx_timer_amnt = timeout_rtx_timer_amnt_out;
    end
    else begin
        dp_mrged_rtx_timer_amnt = dp_cntxt_2_p[RTX_TIMER_AMNT_START -: `TIMER_W];
    end
end

// Incoming 1
always @(*) begin
    inc1_mrged_rtx_timer_amnt = inc1_rtx_timer_amnt_out;
end

// Timeout
always @(*) begin
    if (timeout_expired) begin
      timeout_mrged_rtx_timer_amnt = timeout_rtx_timer_amnt_out;
    end
    else if (timeout_fid_p == inc1_fid_p) begin
      timeout_mrged_rtx_timer_amnt = inc1_rtx_timer_amnt_out;
    end
    else begin
      timeout_mrged_rtx_timer_amnt = timeout_cntxt_2_p[RTX_TIMER_AMNT_START -: `TIMER_W];
    end
end

//****************************
// rtx_exptime 
//****************************

// Next
always @(*) begin
    if (next_fid_p == inc1_fid_p & inc1_reset_rtx_timer_out) begin
        next_mrged_rtx_exptime = inc1_mrged_rtx_exptime;
    end
    else if (next_fid_p == dp_fid_p) begin
        next_mrged_rtx_exptime = dp_mrged_rtx_exptime;
    end
    else begin
        next_mrged_rtx_exptime = next_cntxt_2_p[RTX_EXPTIME_START -: `TIME_W];
    end
end

// Dq Prop
always @(*) begin
    if (dp_fid_p == inc1_fid_p & inc1_reset_rtx_timer_out) begin
        dp_mrged_rtx_exptime = inc1_mrged_rtx_exptime;
    end
    else if (~dp_cntxt_2_p[ACTIVE_RTX_TIMER_START -: `FLAG_W] |
             (dp_fid_p == timeout_fid_p & timeout_expired)) begin
        dp_mrged_rtx_exptime = dp_mrged_rtx_timer_amnt + global_time;
    end
    else begin
        dp_mrged_rtx_exptime = dp_cntxt_2_p[RTX_EXPTIME_START -: `TIME_W];
    end
end

// Incoming 1
assign inc1_mrged_rtx_exptime = (dp_fid_p == inc1_fid_p & ~inc1_cntxt_2_p[ACTIVE_RTX_TIMER_START -: `FLAG_W]) 
                                | inc1_reset_rtx_timer_out ? inc1_mrged_rtx_timer_amnt + global_time :
                                inc1_cntxt_2_p[RTX_EXPTIME_START -: `TIME_W];

// Timeout
assign timeout_mrged_rtx_exptime = (dp_fid_p == timeout_fid_p & timeout_expired) ? dp_mrged_rtx_exptime:
                                   timeout_cntxt_2_p[RTX_EXPTIME_START -: `TIME_W];

//****************************
// rtx_exptime 
//****************************

assign next_mrged_total_tx_cnt = next_total_tx_cnt_out;

assign dp_mrged_total_tx_cnt = (dp_fid_p == next_fid_p) ? next_mrged_total_tx_cnt : dp_cntxt_2_p[TOTAL_TX_CNT_START -: `FLOW_SEQ_NUM_W];
assign inc1_mrged_total_tx_cnt = (inc1_fid_p == next_fid_p) ? next_mrged_total_tx_cnt : inc1_cntxt_2_p[TOTAL_TX_CNT_START -: `FLOW_SEQ_NUM_W];
assign timeout_mrged_total_tx_cnt = (timeout_fid_p == next_fid_p) ? next_mrged_total_tx_cnt : timeout_cntxt_2_p[TOTAL_TX_CNT_START -: `FLOW_SEQ_NUM_W];

//****************************
// user_cntxt 
//****************************

//Next
always @(*) begin
    if (next_fid_p == inc1_fid_p) begin
        next_mrged_user_cntxt = inc1_user_cntxt_out;
    end
    else if (next_fid_p == timeout_fid_p) begin
        next_mrged_user_cntxt = timeout_user_cntxt_out;
    end
    else begin
        next_mrged_user_cntxt = next_cntxt_2_p[USER_CONTEXT_START -: `USER_CONTEXT_W];
    end
end

// Dq Prop
always @(*) begin
    if (dp_fid_p == inc1_fid_p) begin
        dp_mrged_user_cntxt = inc1_user_cntxt_out;
    end
    else if (dp_fid_p == timeout_fid_p) begin
        dp_mrged_user_cntxt = timeout_user_cntxt_out;
    end
    else begin
        dp_mrged_user_cntxt = dp_cntxt_2_p[USER_CONTEXT_START -: `USER_CONTEXT_W];
    end
end

// Incoming 1
always @(*) begin
    inc1_mrged_user_cntxt = inc1_user_cntxt_out;
end

// Timeout
always @(*) begin
    if (timeout_fid_p == inc1_fid_p) begin
      timeout_mrged_user_cntxt = inc1_user_cntxt_out; 
    end
    else begin 
      timeout_mrged_user_cntxt = timeout_user_cntxt_out;
    end
end


//*********************************************************************************
// Logic - Data Delivery Logic Stage - Output 
//*********************************************************************************

assign next_seq_fid_out = next_fid_p; 

// determining flow ids to enqueue

reg  [`FLOW_ID_W-1:0] tmp_next_enq_fid1;
always @(*) begin
    if (~next_mrged_idle & 
        ~next_mrged_back_pressure) begin
        tmp_next_enq_fid1 = next_fid_p;
    end
    else begin
        tmp_next_enq_fid1 = `FLOW_ID_NONE;
    end
end

assign next_fid_l = (tmp_next_enq_fid1 != `FLOW_ID_NONE &
                     next_fid_l_from_store == `FLOW_ID_NONE) 
                     ? tmp_next_enq_fid1 : next_fid_l_from_store;

assign next_cntxt_1_l = (tmp_next_enq_fid1 != `FLOW_ID_NONE &
                         next_fid_l_from_store == `FLOW_ID_NONE) 
                        ? next_mrged_cntxt_1 : next_cntxt_1_l_from_store;

assign next_cntxt_2_l = (tmp_next_enq_fid1 != `FLOW_ID_NONE &
                         next_fid_l_from_store == `FLOW_ID_NONE) 
                        ? next_mrged_cntxt_2 : next_cntxt_2_l_from_store;

always @(*) begin
  if (tmp_next_enq_fid1 != `FLOW_ID_NONE &
      next_fid_l_from_store == `FLOW_ID_NONE) begin
    next_enq_fid1 = `FLOW_ID_NONE;
  end
  else begin
    next_enq_fid1 = tmp_next_enq_fid1;
  end
end

always @(*) begin
    if (dp_fid_p != next_fid_p &
        ~dp_mrged_idle & activated_by_dp) begin
        next_enq_fid2 = dp_fid_p;
    end
    else begin
        next_enq_fid2 = `FLOW_ID_NONE;
    end
end

assign activated_by_ack = ~inc1_mrged_idle & 
                          inc1_cntxt_2_p[IDLE_START -: `FLAG_W]; 

always @(*) begin
    if (next_fid_p != inc1_fid_p & 
        activated_by_ack & 
        ~inc1_mrged_back_pressure &
        ((inc1_fid_p != dp_fid_p) | 
         (inc1_fid_p == dp_fid_p & ~activated_by_dp))
        ) begin
        next_enq_fid3 = inc1_fid_p;
    end
    else begin
        next_enq_fid3 = `FLOW_ID_NONE;
    end
end

assign activated_by_timeout = timeout_expired & ~timeout_mrged_idle &
                              timeout_cntxt_2_p[IDLE_START -: `FLAG_W];
always @(*) begin
    if (next_fid_p != timeout_fid_p & 
        activated_by_timeout & 
        ~timeout_mrged_back_pressure &
        ((timeout_fid_p != dp_fid_p) | 
         (timeout_fid_p == dp_fid_p & ~activated_by_dp))
        ) begin
        next_enq_fid4 = timeout_fid_p;
    end
    else begin
        next_enq_fid4 = `FLOW_ID_NONE;
    end
end

// Timers
assign  timeout_val_out = timeout_expired & timeout_fid_p != `FLOW_ID_NONE;
assign  timeout_fid_out = timeout_fid_p;

// DD Context
assign  dd_cntxt_out    = `SEND_DD_CONTEXT ? next_mrged_user_cntxt[`DD_CONTEXT_W-1:0] : {`DD_CONTEXT_W{1'b0}};
 
// clogb2 function
`include "clogb2.vh"

endmodule
