// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License

module sorting_network
#( 
    parameter integer C_S_AXI_ADDR_WIDTH            = 32,
    parameter integer C_S_AXI_DATA_WIDTH            = 32,
    parameter integer C_S_AXI_BASEADDR              = 32'h00000000,
    parameter integer C_S_AXI_HIGHADDR              = 32'h0000FFFF,
    parameter integer C_S_AXI_AWUSER_WIDTH          = 0,
    parameter integer C_S_AXI_ARUSER_WIDTH          = 0,
    parameter integer C_S_AXI_WUSER_WIDTH           = 0,
    parameter integer C_S_AXI_RUSER_WIDTH           = 0,
    parameter integer C_S_AXI_BUSER_WIDTH           = 0,

    parameter
    WRDW        =   32  // word width
,   WRDN        =    4  // number of word per cycle
,   DATW        = (WRDW*WRDN)
,   BUFD_ORDER  =   19  // buffer depth order

,   AXI_S_ADRW  =   C_S_AXI_ADDR_WIDTH
,   AXI_S_DATW  =   C_S_AXI_DATA_WIDTH
,   AXI_S_STBW  =   (AXI_S_DATW/8)
,   AXIS_DATW   = DATW
,   AXIS_KEPW   = (AXIS_DATW/8)
)
(
    input                           i_clk
,   input                           i_rst_n

    // AXI  Slave: CTRL
,   input       [  AXI_S_ADRW -1:0] i_araddr
,   input                           i_arvalid
,   output                          o_arready

,   output      [  AXI_S_DATW -1:0] o_rdata
,   output      [           2 -1:0] o_rresp
,   output                          o_rvalid
,   input                           i_rready
   
,   input       [  AXI_S_ADRW -1:0] i_awaddr
,   input                           i_awvalid
,   output                          o_awready

,   input       [  AXI_S_DATW -1:0] i_wdata
,   input       [  AXI_S_STBW -1:0] i_wstrb
,   input                           i_wvalid
,   output                          o_wready

,   output      [           2 -1:0] o_bresp
,   output                          o_bvalid
,   input                           i_bready


    // AXIS Slave : Data   input
,   input       [   AXIS_DATW -1:0] i_axis_s_tdata
,   input                           i_axis_s_tlast
,   input                           i_axis_s_tvalid
,   output                          o_axis_s_tready

    // AXIS Master: Result output
,   output      [   AXIS_DATW -1:0] o_axis_m_tdata
,   output                          o_axis_m_tlast
,   output                          o_axis_m_tvalid
,   input                           i_axis_m_tready
);

    wire                            reset = ~i_rst_n;

    wire        [        DATW -1:0] stream_i        , stream_o          ;

    
    wire        [          20 -1:0] beat;
    wire        [          20 -1:0] cnt_input_count;
    wire        [          20 -1:0] cnt_output_count;
    wire        [          20 -1:0] cnt_wb_count;

    wire                            start;
    reg                             done;
    wire                            writeback;

    wire                            next = start;
    wire                            next_out    ;

    reg                             r_input_state,  n_input_state;
    reg                             r_output_state, n_output_state;

    wire                            fifo_input_rd_en    = r_input_state;
    wire                            fifo_output_wr_en   = r_output_state;

    wire                            cnt_input_en        = r_input_state;
    wire                            cnt_output_en       = r_output_state;

    reg                             r_axis_m_tlast, n_axis_m_tlast;
    reg                             r_wb_state,  n_wb_state;
    wire                            axis_m_hs   = o_axis_m_tvalid & i_axis_m_tready;
    wire                            axis_m_tready   = r_wb_state ? i_axis_m_tready : 0;  
    wire                            axis_m_tvalid;
    assign                          o_axis_m_tvalid = r_wb_state ?   axis_m_tvalid : 0;
    assign                          o_axis_m_tlast = r_axis_m_tlast;    

    always@(*)
    begin: COMBO
        n_input_state       = ( ~r_input_state & start ) ? 1'b1 :
                              (  r_input_state & (cnt_input_count == (beat-1) ) ) ? 1'b0 : r_input_state;

        n_output_state      = ( ~r_output_state & next_out===1 ) ? 1'b1 :
                              (  r_output_state & (cnt_output_count == (beat-1) ) ) ? 1'b0 : r_output_state;

        n_wb_state          = ( ~r_wb_state &  writeback) ? 1'b1 :
                              (  r_wb_state & axis_m_hs & (cnt_wb_count == (beat-1) ) ) ? 1'b0 : r_wb_state;

        done                = r_output_state & (cnt_output_count == (beat-1));

        n_axis_m_tlast      = ( ~r_axis_m_tlast & (cnt_wb_count == (beat-2)) & r_wb_state & axis_m_hs ) ? 1'b1 : 
                              (  r_axis_m_tlast & (cnt_wb_count == (beat-1)) & r_wb_state & axis_m_hs ) ? 1'b0 : r_axis_m_tlast;
    end // COMBO
    
    always@(posedge i_clk or negedge i_rst_n) begin
        r_input_state      <= (~i_rst_n) ? 0  : n_input_state   ;
        r_output_state     <= (~i_rst_n) ? 0  : n_output_state  ;
        r_wb_state         <= (~i_rst_n) ? 0  : n_wb_state      ;
        r_axis_m_tlast     <= (~i_rst_n) ? 0  : n_axis_m_tlast  ;
    end

    simple_counter
    #(
        .DATW                           (20                                 )
    )
    cnt_input
    (
        .i_clk                          (i_clk                              )
    ,   .i_rst_n                        (i_rst_n                            )
    ,   .i_init                         (0                                  )
    ,   .i_rst                          (next                               )
    ,   .i_en                           (1'b1                               )
    ,   .i_count                        (cnt_input_en                       )
    ,   .i_updown                       (1'b0                               ) // 0:up, 1:down
    ,   .o_dat                          (cnt_input_count                    )
    );  


    simple_counter
    #(
        .DATW                           (20                                 )
    )
    cnt_output
    (
        .i_clk                          (i_clk                              )
    ,   .i_rst_n                        (i_rst_n                            )
    ,   .i_init                         (0                                  )
    ,   .i_rst                          (next_out                           )
    ,   .i_en                           (1'b1                               )
    ,   .i_count                        (cnt_output_en                      )
    ,   .i_updown                       (1'b0                               ) // 0:up, 1:down
    ,   .o_dat                          (cnt_output_count                   )
    );  

    simple_counter
    #(
        .DATW                           (20                                 )
    )
    cnt_wb
    (
        .i_clk                          (i_clk                              )
    ,   .i_rst_n                        (i_rst_n                            )
    ,   .i_init                         (0                                  )
    ,   .i_rst                          (writeback                          )
    ,   .i_en                           (1'b1                               )
    ,   .i_count                        (axis_m_hs                          )
    ,   .i_updown                       (1'b0                               ) // 0:up, 1:down
    ,   .o_dat                          (cnt_wb_count                       )
    );  


    axireg
    #(           
        .SADRW                              (AXI_S_ADRW                 )
    ,   .SDATW                              (AXI_S_DATW                 )
    )
    axireg_inst
    (
        .i_clk                              (i_clk                          )
    ,   .i_rst_n                            (i_rst_n                        )

    ,   .i_araddr                           (i_araddr                       )
    ,   .i_arvalid                          (i_arvalid                      )
    ,   .o_arready                          (o_arready                      )

    ,   .o_rdata                            (o_rdata                        )
    ,   .o_rresp                            (o_rresp                        )
    ,   .o_rvalid                           (o_rvalid                       )
    ,   .i_rready                           (i_rready                       )

    ,   .i_awaddr                           (i_awaddr                       )
    ,   .i_awvalid                          (i_awvalid                      )
    ,   .o_awready                          (o_awready                      )

    ,   .i_wdata                            (i_wdata                        )
    ,   .i_wvalid                           (i_wvalid                       )
    ,   .i_wstrb                            (i_wstrb                        )
    ,   .o_wready                           (o_wready                       )

    ,   .o_bresp                            (o_bresp                        )
    ,   .o_bvalid                           (o_bvalid                       )
    ,   .i_bready                           (i_bready                       )

    ,   .o_beat                             (beat                           )
    ,   .o_start                            (start                          )
    ,   .i_done                             (done                           )
    ,   .o_writeback                        (writeback                      )
    );


    fifo_ram_rav
    #(
        .ADRW                               (BUFD_ORDER                 )
    ,   .DATW                               (DATW                       )
    )
    fifo_input
    (
        .i_clk                              (i_clk                      )
    ,   .i_rst_n                            (i_rst_n                    )

    ,   .i_wr_en                            (i_axis_s_tvalid            )
    ,   .i_wr_data                          (i_axis_s_tdata             )
    ,   .o_wr_ready                         (o_axis_s_tready            )

    ,   .i_rd_en                            (fifo_input_rd_en           )
    ,   .o_rd_data                          (stream_i                   )
    ,   .o_empty                            (                           ) // never used

    );

    sorting_network_core
    sorting_core
    ( 
        .clk                                (i_clk                      )
    ,   .reset                              (reset                      )
    ,   .next                               (next                       )
    ,   .next_out                           (next_out                   )
    ,   .X0                                 (stream_i[(WRDW*0)+:WRDW]   )
    ,   .X1                                 (stream_i[(WRDW*1)+:WRDW]   )
    ,   .X2                                 (stream_i[(WRDW*2)+:WRDW]   )
    ,   .X3                                 (stream_i[(WRDW*3)+:WRDW]   )
    ,   .Y0                                 (stream_o[(WRDW*0)+:WRDW]   )
    ,   .Y1                                 (stream_o[(WRDW*1)+:WRDW]   )
    ,   .Y2                                 (stream_o[(WRDW*2)+:WRDW]   )
    ,   .Y3                                 (stream_o[(WRDW*3)+:WRDW]   )
    );

    fifo_ram_rav
    #(
        .ADRW                               (BUFD_ORDER                 )
    ,   .DATW                               (DATW                       )
    )
    fifo_output
    (
        .i_clk                              (i_clk                      )
    ,   .i_rst_n                            (i_rst_n                    )

    ,   .i_wr_en                            (fifo_output_wr_en          )
    ,   .i_wr_data                          (stream_o                   )
    ,   .o_full                             (                           ) // never used

    ,   .i_rd_en                            (  axis_m_tready            )
    ,   .o_rd_data                          (o_axis_m_tdata             )
    ,   .o_rd_valid                         (  axis_m_tvalid            )

    );

endmodule
