// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`include "system_params.vh"
`include "flow_state_defaults.vh"
`include "sim.vh"

module sim_top();

//*********************************************************************************
// Local Parameters
//*********************************************************************************

// Model Parameters

localparam  INIT_WND_SIZE       = `TONIC_INIT_WND_SIZE;
localparam  INIT_RTX_TIMER_AMNT = `TONIC_INIT_RTX_TIMER_AMNT;

`ifdef TONIC_INIT_CREDIT
localparam  INIT_CREDIT         = `TONIC_INIT_CREDIT;
`else
localparam  INIT_CREDIT         = 0;
`endif

`ifdef TONIC_INIT_RATE
localparam  INIT_RATE           = `TONIC_INIT_RATE;
`else
localparam  INIT_RATE           = 1;
`endif

//// Specs
localparam  CR_TYPE             = `CR_TYPE;
localparam  USER_CONTEXT_WIDTH  = `USER_CONTEXT_W;
localparam  INIT_USER_CNTXT     = `INIT_USER_CONTEXT;

// Simluation Parameters
localparam  CLOCK_PERIOD      = 10000;
localparam  CLOCK_HALF_PERIOD = CLOCK_PERIOD/2;
localparam  ACTIVE_FLOW_CNT   = `ACTIVE_FLOW_CNT;
localparam  RST_TIME          = (ACTIVE_FLOW_CNT / 2 + 10) * CLOCK_PERIOD;
localparam  SIM_CYCLES        = `SIM_CYCLES;
localparam  SIM_END_TIME      = RST_TIME + SIM_CYCLES * CLOCK_PERIOD + 1;
localparam  RTT               = `RTT;
localparam  LOSS_PROB         = `LOSS_PROB;

// helper param
localparam  GROUPS_OF_4_CNT   = ACTIVE_FLOW_CNT % 4 == 0 ? ACTIVE_FLOW_CNT / 4 
                                                         : ACTIVE_FLOW_CNT / 4 + 1; 

localparam  GROUPS_OF_2_CNT   = ACTIVE_FLOW_CNT % 2 == 0 ? ACTIVE_FLOW_CNT / 2 
                                                         : ACTIVE_FLOW_CNT / 2 + 1; 


localparam  TX_CNTR_W    = 10;

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

reg                                 clk;
reg                                 rst_n;

wire    [`FLOW_ID_W-1:0]            incoming_fid_in;
wire    [`PKT_TYPE_W-1:0]           pkt_type_in;
wire    [`PKT_DATA_W-1:0]           pkt_data_in;

wire                                next_val;
wire    [`FLOW_SEQ_NUM_W-1:0]       next_seq_out;
wire    [`TX_CNT_W-1:0]             next_seq_tx_id_out;
wire    [`FLOW_ID_W-1:0]            next_seq_fid_out;

reg     [63:0]                      cnts [ACTIVE_FLOW_CNT-1:0];


/*
reg                                 link_avail;
reg                                 in_tx;
reg     [TX_CNTR_W-1:0]             tx_clk_cntr; 
*/

wire                                link_avail;

//*********************************************************************************
// Clock and Simulation Setup
//*********************************************************************************

// Clock generation
initial begin
    clk = 0;
    forever begin
        #(CLOCK_HALF_PERIOD) clk = ~clk;
    end
end

// Reset generation
initial begin
    rst_n = 1'b0;
    #RST_TIME rst_n = ~rst_n; 
end

// Set Time format
initial begin
    $timeformat(-9, 0, " ns", 1);
    $display("Starting Simulation");
end


integer i;
// End simulation
always @(posedge clk) begin
    if ($time > SIM_END_TIME) begin
        $display("Simulation finished @%t", $time);
        for (i = 0; i < ACTIVE_FLOW_CNT; i = i + 1) begin
            $display("%d %d", i + 1, (cnts[i] * `RST_TX_SIZE * 8 * (10 ** 6)) / (SIM_CYCLES * CLOCK_PERIOD));
        end

        for (i = 0; i < ACTIVE_FLOW_CNT; i = i + 1) begin
            $display("%d %d", i + 1, cnts[i]);
        end

        $finish;
    end
end

// generating src and sink
integer fsrc, fsink;

initial begin
    fsrc    = $fopen("src.data", "w");
    fsink   = $fopen("sink.data", "w");    
end

always @(posedge clk) begin
    if (rst_n) begin
        $fwrite(fsrc, "%b%b%b%b\n", incoming_fid_in,
                                    pkt_type_in,
                                    pkt_data_in,
                                    link_avail);

        $fwrite(fsink, "%b%b%b%b\n", next_val,
                                     next_seq_out,
                                     next_seq_tx_id_out,
                                     next_seq_fid_out);
    end
end

//*********************************************************************************
// Flow and Context Setup
//*********************************************************************************

// TODO add flow sizes

// Initializing the Fifo
integer fifo_i;
initial begin
    fifo_i = 0;
    # CLOCK_PERIOD;
    
    force tonic.dd.non_idle_fifo.rst_n = 1'b1;
    repeat (GROUPS_OF_4_CNT) begin

        force tonic.dd.non_idle_fifo.w_val_0 = 1'b1;
        force tonic.dd.non_idle_fifo.w_data_0 = (fifo_i * 4) + 1;

        force tonic.dd.non_idle_fifo.w_val_1 = 1'b1;
        force tonic.dd.non_idle_fifo.w_data_1 = (fifo_i * 4) + 2;

        force tonic.dd.non_idle_fifo.w_val_2 = 1'b1;
        force tonic.dd.non_idle_fifo.w_data_2 = (fifo_i * 4) + 3;

        force tonic.dd.non_idle_fifo.w_val_3 = 1'b1;
        force tonic.dd.non_idle_fifo.w_data_3 = (fifo_i * 4) + 4;

        force tonic.dd.non_idle_fifo.r_val = 1'b0;
       
        # CLOCK_PERIOD;
        fifo_i = fifo_i + 1;
    end

    force tonic.dd.non_idle_fifo.w_val_0 = 1'b0;
    force tonic.dd.non_idle_fifo.w_val_1 = 1'b0;
    force tonic.dd.non_idle_fifo.w_val_2 = 1'b0;
    force tonic.dd.non_idle_fifo.w_val_3 = 1'b0;
    force tonic.dd.non_idle_fifo.r_val = 1'b0;

    release tonic.dd.non_idle_fifo.w_data_0;
    release tonic.dd.non_idle_fifo.w_data_1;
    release tonic.dd.non_idle_fifo.w_data_2;
    release tonic.dd.non_idle_fifo.w_data_3;
end

initial begin
    #RST_TIME;
    
    release tonic.dd.non_idle_fifo.w_val_0;
    release tonic.dd.non_idle_fifo.w_val_1;
    release tonic.dd.non_idle_fifo.w_val_2;
    release tonic.dd.non_idle_fifo.w_val_3;
    release tonic.dd.non_idle_fifo.r_val;
end
 
//// Initializing the context stores

// Data Delivery Engine

wire    [`FLOW_SEQ_NUM_W-1:0]   rst_next_new;
wire    [`FLOW_SEQ_NUM_W-1:0]   rst_wnd_start;
wire    [`FLOW_WIN_IND_W-1:0]   rst_wnd_start_ind;
wire    [`TX_CNT_WIN_SIZE-1:0]  rst_tx_cnt_wnd;
wire    [`FLOW_WIN_SIZE-1:0]    rst_acked_wnd;
wire    [`FLOW_WIN_SIZE_W-1:0]  rst_wnd_size;

assign  rst_next_new        = `RST_NEXT_NEW;
assign  rst_wnd_start       = `RST_WND_START;
assign  rst_wnd_start_ind   = `RST_WND_START_IND;
assign  rst_tx_cnt_wnd      = `RST_TX_CNT_WND;
assign  rst_acked_wnd       = `RST_ACKED_WND;
assign  rst_wnd_size        = INIT_WND_SIZE;

wire    [`TIME_W-1:0]           rst_rtx_exptime;
wire    [`FLAG_W-1:0]           rst_active_rtx_timer;
wire    [`PKT_QUEUE_IND_W-1:0]  rst_pkt_queue_size;
wire    [`FLAG_W-1:0]           rst_back_pressure;
wire    [`FLAG_W-1:0]           rst_idle;
wire    [`FLOW_WIN_SIZE-1:0]    rst_rtx_wnd;
wire    [`TIMER_W-1:0]          rst_rtx_timer_amnt;
wire    [`USER_CONTEXT_W-1:0]   rst_user_cntxt;

assign  rst_rtx_exptime         = `RST_RTX_EXPTIME;
assign  rst_active_rtx_timer    = `RST_ACTIVE_RTX_TIMER;
assign  rst_pkt_queue_size      = `RST_PKT_QUEUE_SIZE;
assign  rst_back_pressure       = `RST_BACK_PRESSURE;
assign  rst_idle                = `RST_IDLE;
assign  rst_rtx_wnd             = `RST_RTX_WND;
assign  rst_rtx_timer_amnt      = INIT_RTX_TIMER_AMNT;
assign  rst_user_cntxt          = INIT_USER_CNTXT;


integer dd_ram_i;
wire    [tonic.dd.core.CONTEXT_1_W-1:0]  dd_init_cntxt_1;

assign  dd_init_cntxt_1 = {rst_next_new, rst_wnd_start,
                           rst_wnd_start_ind, rst_tx_cnt_wnd,
                           rst_acked_wnd, rst_wnd_size};


wire    [tonic.dd.core.CONTEXT_2_W-1:0]  dd_init_cntxt_2;

assign dd_init_cntxt_2 =  {rst_rtx_exptime, rst_active_rtx_timer,
                           rst_pkt_queue_size, rst_back_pressure,
                           rst_idle, rst_rtx_wnd, 
                           rst_rtx_timer_amnt, rst_user_cntxt};

initial begin : dd_store_init_other
    
    dd_ram_i = 0;
    # CLOCK_PERIOD;
    force tonic.dd.core.store1.rst_n = 1'b1; 
    force tonic.dd.core.store2.rst_n = 1'b1; 
            
    repeat (GROUPS_OF_4_CNT) begin
        // init store 1

        force tonic.dd.core.store1.r_fid0 = `FLOW_ID_NONE; 
        force tonic.dd.core.store1.r_fid1 = `FLOW_ID_NONE; 
        force tonic.dd.core.store1.r_fid2 = `FLOW_ID_NONE; 
        force tonic.dd.core.store1.r_fid3 = `FLOW_ID_NONE; 

        force tonic.dd.core.store1.w_fid0 = (dd_ram_i * 4) + 1; 
        force tonic.dd.core.store1.w_fid1 = (dd_ram_i * 4) + 2; 
        force tonic.dd.core.store1.w_fid2 = (dd_ram_i * 4) + 3; 
        force tonic.dd.core.store1.w_fid3 = (dd_ram_i * 4) + 4; 

        force tonic.dd.core.store1.w_cntxt0 = dd_init_cntxt_1; 
        force tonic.dd.core.store1.w_cntxt1 = dd_init_cntxt_1; 
        force tonic.dd.core.store1.w_cntxt2 = dd_init_cntxt_1; 
        force tonic.dd.core.store1.w_cntxt3 = dd_init_cntxt_1;

        // init store 2
        force tonic.dd.core.store2.r_fid0 = `FLOW_ID_NONE; 
        force tonic.dd.core.store2.r_fid1 = `FLOW_ID_NONE; 
        force tonic.dd.core.store2.r_fid2 = `FLOW_ID_NONE; 
        force tonic.dd.core.store2.r_fid3 = `FLOW_ID_NONE; 

        force tonic.dd.core.store2.w_fid0 = (dd_ram_i * 4) + 1; 
        force tonic.dd.core.store2.w_fid1 = (dd_ram_i * 4) + 2; 
        force tonic.dd.core.store2.w_fid2 = (dd_ram_i * 4) + 3; 
        force tonic.dd.core.store2.w_fid3 = (dd_ram_i * 4) + 4; 

        force tonic.dd.core.store2.w_cntxt0 = dd_init_cntxt_2; 
        force tonic.dd.core.store2.w_cntxt1 = dd_init_cntxt_2; 
        force tonic.dd.core.store2.w_cntxt2 = dd_init_cntxt_2; 
        force tonic.dd.core.store2.w_cntxt3 = dd_init_cntxt_2;
        
        #CLOCK_PERIOD; 
        dd_ram_i = dd_ram_i + 1; 
    end

    force tonic.dd.core.store1.w_fid0 = `FLOW_ID_NONE; 
    force tonic.dd.core.store1.w_fid1 = `FLOW_ID_NONE; 
    force tonic.dd.core.store1.w_fid2 = `FLOW_ID_NONE; 
    force tonic.dd.core.store1.w_fid3 = `FLOW_ID_NONE; 
    
    force tonic.dd.core.store2.w_fid0 = `FLOW_ID_NONE; 
    force tonic.dd.core.store2.w_fid1 = `FLOW_ID_NONE; 
    force tonic.dd.core.store2.w_fid2 = `FLOW_ID_NONE; 
    force tonic.dd.core.store2.w_fid3 = `FLOW_ID_NONE; 

    release tonic.dd.core.store1.w_cntxt0; 
    release tonic.dd.core.store1.w_cntxt1; 
    release tonic.dd.core.store1.w_cntxt2; 
    release tonic.dd.core.store1.w_cntxt3; 

    release tonic.dd.core.store2.w_cntxt0; 
    release tonic.dd.core.store2.w_cntxt1; 
    release tonic.dd.core.store2.w_cntxt2; 
    release tonic.dd.core.store2.w_cntxt3; 
end

initial begin: dd_store_other_release
    # RST_TIME;
    release tonic.dd.core.store1.r_fid0; 
    release tonic.dd.core.store1.r_fid1; 
    release tonic.dd.core.store1.r_fid2; 
    release tonic.dd.core.store1.r_fid3;

    release tonic.dd.core.store1.w_fid0; 
    release tonic.dd.core.store1.w_fid1; 
    release tonic.dd.core.store1.w_fid2; 
    release tonic.dd.core.store1.w_fid3;

    release tonic.dd.core.store2.r_fid0; 
    release tonic.dd.core.store2.r_fid1; 
    release tonic.dd.core.store2.r_fid2; 
    release tonic.dd.core.store2.r_fid3;

    release tonic.dd.core.store2.w_fid0; 
    release tonic.dd.core.store2.w_fid1; 
    release tonic.dd.core.store2.w_fid2; 
    release tonic.dd.core.store2.w_fid3;
end

// Credit Engine
wire    [`MAX_QUEUE_BITS-1:0]       rst_pkt_queue;
wire    [`MAX_TX_ID_BITS-1:0]       rst_tx_id_queue;
wire    [`PKT_QUEUE_IND_W-1:0]      rst_pkt_queue_head;
wire    [`PKT_QUEUE_IND_W-1:0]      rst_pkt_queue_tail;
wire    [`FLAG_W-1:0]               rst_ready_to_tx;
wire    [`CRED_W-1:0]               rst_cred;
wire    [`TX_SIZE_W-1:0]            rst_tx_size;

assign  rst_pkt_queue       = `RST_PKT_QUEUE;
assign  rst_tx_id_queue     = `RST_TX_ID_QUEUE;
assign  rst_pkt_queue_head  = `RST_PKT_QUEUE_HEAD;
assign  rst_pkt_queue_tail  = `RST_PKT_QUEUE_TAIL;
assign  rst_ready_to_tx     = `RST_READY_TO_TX;
assign  rst_cred            = INIT_CREDIT;
assign  rst_tx_size         = `RST_TX_SIZE;

wire    [`TIME_W-1:0]               rst_last_cred_update;
wire    [`RATE_W-1:0]               rst_rate;
wire    [`TIME_W-1:0]               rst_reach_cap;

assign  rst_last_cred_update    = `RST_LAST_CRED_UPDATE;
assign  rst_rate                = INIT_RATE * 64 / 100; 
assign  rst_reach_cap           = (`CRED_CAP / INIT_RATE) * 512;

integer cr_ram_i;

generate
    // Rate
    if (`CR_TYPE == `CR_TYPE_RATE) begin
        wire    [tonic.cr.core.CONTEXT_W-1:0]  cr_init_cntxt;

        assign  cr_init_cntxt =  {rst_pkt_queue, rst_tx_id_queue,
                                  rst_pkt_queue_head, rst_pkt_queue_tail,
                                  rst_pkt_queue_size, rst_ready_to_tx,
                                  rst_cred, rst_tx_size, 
                                  rst_last_cred_update, rst_rate,
                                  rst_reach_cap};


        initial begin: cr_store_init_rate
            cr_ram_i = 0;
            # CLOCK_PERIOD;
            force tonic.cr.core.store.rst_n = 1'b1; 
            
            repeat (GROUPS_OF_2_CNT) begin
                // init store 

                force tonic.cr.core.store.r_fid0 = `FLOW_ID_NONE; 
                force tonic.cr.core.store.r_fid1 = `FLOW_ID_NONE; 

                force tonic.cr.core.store.w_fid0 = (cr_ram_i * 2) + 1; 
                force tonic.cr.core.store.w_fid1 = (cr_ram_i * 2) + 2; 

                force tonic.cr.core.store.w_cntxt0 = cr_init_cntxt; 
                force tonic.cr.core.store.w_cntxt1 = cr_init_cntxt; 

                #CLOCK_PERIOD; 
                cr_ram_i = cr_ram_i + 1; 
            end

            force tonic.cr.core.store.w_fid0 = `FLOW_ID_NONE; 
            force tonic.cr.core.store.w_fid1 = `FLOW_ID_NONE; 
            
            release tonic.cr.core.store.w_cntxt0; 
            release tonic.cr.core.store.w_cntxt1; 
        end

        initial begin: cr_store_release_rate
            # RST_TIME;
            release tonic.cr.core.store.r_fid0; 
            release tonic.cr.core.store.r_fid1; 

            release tonic.cr.core.store.w_fid0; 
            release tonic.cr.core.store.w_fid1; 
        end
    end 
    // Cwnd
    else if (`CR_TYPE == `CR_TYPE_CWND) begin
        wire    [tonic.cr.core.CONTEXT_W-1:0]  cr_init_cntxt;

        assign  cr_init_cntxt =  {rst_pkt_queue, rst_tx_id_queue,
                                  rst_pkt_queue_head, rst_pkt_queue_tail,
                                  rst_pkt_queue_size, rst_ready_to_tx};


        initial begin: cr_store_init_rate
            cr_ram_i = 0;
            # CLOCK_PERIOD;
            force tonic.cr.core.store.rst_n = 1'b1; 
            
            repeat (GROUPS_OF_2_CNT) begin
                // init store 

                force tonic.cr.core.store.r_fid0 = `FLOW_ID_NONE; 
                force tonic.cr.core.store.r_fid1 = `FLOW_ID_NONE; 

                force tonic.cr.core.store.w_fid0 = (cr_ram_i * 2) + 1; 
                force tonic.cr.core.store.w_fid1 = (cr_ram_i * 2) + 2; 

                force tonic.cr.core.store.w_cntxt0 = cr_init_cntxt; 
                force tonic.cr.core.store.w_cntxt1 = cr_init_cntxt; 

                #CLOCK_PERIOD; 
                cr_ram_i = cr_ram_i + 1; 
            end

            force tonic.cr.core.store.w_fid0 = `FLOW_ID_NONE; 
            force tonic.cr.core.store.w_fid1 = `FLOW_ID_NONE; 
            
            release tonic.cr.core.store.w_cntxt0; 
            release tonic.cr.core.store.w_cntxt1; 
        end

        initial begin: cr_store_release_rate
            # RST_TIME;
            release tonic.cr.core.store.r_fid0; 
            release tonic.cr.core.store.r_fid1; 

            release tonic.cr.core.store.w_fid0; 
            release tonic.cr.core.store.w_fid1; 
        end
    end
endgenerate

//*********************************************************************************
// Logic
//*********************************************************************************

// Tonic

tonic tonic (
        .clk                (clk                ),
        .rst_n              (rst_n              ),
        
        .incoming_fid_in    (incoming_fid_in    ),
        .pkt_type_in        (pkt_type_in        ),
        .pkt_data_in        (pkt_data_in        ), 

        .link_avail         (link_avail         ),

        .next_val           (next_val           ),
        .next_seq_out       (next_seq_out       ),
        .next_seq_tx_id_out (next_seq_tx_id_out ),
        .next_seq_fid_out   (next_seq_fid_out   )
);

// Mock Receiver 
sim_receiver #(.RTT        (RTT            ),
               .LOSS_PROB  (LOSS_PROB      ))
    sim_receiver (
        .clk                (clk                ),
        .rst_n              (rst_n              ),
        
        .next_seq_in        (next_seq_out       ),
        .next_seq_tx_id_in  (next_seq_tx_id_out ),
        .next_seq_fid_in    (next_seq_fid_out   ),
    
        .resp_fid           (incoming_fid_in    ),
        .resp_pkt_type      (pkt_type_in        ),
        .resp_pkt_data      (pkt_data_in        )
);

//*********************************************************************************
// TX Channel 
//*********************************************************************************
/*
localparam  REQ_TX_CLKS = `RST_TX_SIZE % 125 == 0 ? `RST_TX_SIZE / 125 : 
                                                    (`RST_TX_SIZE / 125) + 1;

 

always @(posedge clk) begin
    if (~rst_n) begin
        link_avail      <= 1'b1;
    end
    else begin
        if (link_avail & next_val) begin
            link_avail  <= REQ_TX_CLKS == 1;
        end
        else if (in_tx) begin
            link_avail  <= tx_clk_cntr + 1 == REQ_TX_CLKS;
        end
        else begin
            link_avail  <= link_avail;
        end
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        in_tx   <= 1'b0;
    end
    else begin
        if (link_avail & next_val) begin
            in_tx  <= 1'b1;
        end
        else if (in_tx) begin
            in_tx  <= tx_clk_cntr < REQ_TX_CLKS;
        end
        else begin
            in_tx  <= in_tx;
        end
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        tx_clk_cntr     <= {TX_CNTR_W{1'b0}};
    end
    else begin
        if (link_avail & next_val) begin
            tx_clk_cntr <= {{(TX_CNTR_W - 1){1'b0}}, 1'b1};
        end
        else if (in_tx) begin
            tx_clk_cntr <= tx_clk_cntr + 1;
        end
        else begin
            tx_clk_cntr <= {TX_CNTR_W{1'b0}};
        end
    end
end 
*/
assign link_avail = 1'b1;        
//*********************************************************************************
// Pkts and Acks
//*********************************************************************************
integer cycle_no;

initial begin
    cycle_no = 0;
end

always @(posedge clk) begin
    cycle_no = cycle_no + 1;
end



always @(posedge clk) begin

    $display("------------------------------------------------");
    $display("Cycle: %d\n\n", cycle_no);
//    $display("outq:     %b %b %d", link_avail,
//                                   in_tx,
//                                   tx_clk_cntr);

    $display("next out: %d %d %d", next_seq_fid_out, 
                                   next_seq_out, 
                                   next_seq_tx_id_out);

    $display("next ack: %d %d %b", incoming_fid_in,
                                   pkt_type_in,
                                   pkt_data_in);
    
    $write("cnts: ");
    for (i = 0; i < ACTIVE_FLOW_CNT; i = i + 1) begin
        $write("%d", cnts[i]);
    end
    $display("");
end

// count TX pkts

initial begin
    for (i = 0; i < ACTIVE_FLOW_CNT; i = i + 1) begin
        cnts[i] = {64'd0};
    end
end

always @(posedge clk) begin
    cnts[next_seq_fid_out - 1] = link_avail ? cnts[next_seq_fid_out - 1] + 1 :
                                              cnts[next_seq_fid_out - 1];
end


//*********************************************************************************
// Debug
//*********************************************************************************

`ifdef DEBUG

// Put your debugging messages here

`endif

// clogb2 function
`include "clogb2.vh"

endmodule
