// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License


module fifo_ram_rav
#(
    parameter   ADRW  =  9
,               DATW  =128 
)
(

    input                           i_clk
,   input                           i_rst_n

,   input       [        DATW -1:0] i_wr_data
,   input                           i_wr_en
,   output                          o_wr_ready
,   output                          o_full

,   output      [        DATW -1:0] o_rd_data
,   input                           i_rd_en
,   output                          o_rd_valid
,   output                          o_empty
);

    //---------------------------------------------------------------------
    // Constant Declarations
    //---------------------------------------------------------------------

    localparam DEPTH    = 2 ** ADRW ;

    //---------------------------------------------------------------------
    // Reg/Wire
    //---------------------------------------------------------------------

    reg         [        ADRW   :0] r_wr_rptr       , n_wr_rptr         ;
    reg         [        ADRW   :0] r_wr_wptr       , n_wr_wptr         ;
    reg                             r_wr_ready      , n_wr_ready        ;
    reg                             r_full          , n_full            ;

    reg         [        ADRW   :0] r_rd_rptr       , n_rd_rptr         ;
    reg         [        ADRW   :0] r_rd_wptr       , n_rd_wptr         ;
    reg                             r_rd_valid      , n_rd_valid        ;
    reg                             r_empty         , n_empty           ;

    wire        [        DATW -1:0] rd_data ;

    wire    wen     = i_wr_en & (~o_full )  ;
    wire    ren     = i_rd_en & (~o_empty)  ;

    ram_dp_sc
    #(
	    .DATA_WIDTH                     (DATW                           )
	,   .ADDR_WIDTH                     (ADRW                           )
    )
    ram
    (
        .clk                            (i_clk                          )
    ,   .write_addr                     (r_wr_wptr[ADRW-1:0]            ) // FIXME
    ,   .we                             (wen                            ) // ?
    ,   .data                           (i_wr_data                      ) 
    ,   .read_addr                      (n_rd_rptr[ADRW-1:0]            ) // ?
    ,   .q                              (rd_data                        )
    );

    
    always@(*)
    begin: COMBO   
        n_rd_wptr           = r_wr_wptr;
        n_rd_rptr           = ren ? r_rd_rptr+1 : r_rd_rptr;
        n_empty             = n_rd_rptr == n_rd_wptr;
        n_rd_valid          = ~n_empty;

        n_wr_rptr           = n_rd_rptr;
        n_wr_wptr           = wen ? r_wr_wptr+1 : r_wr_wptr;
        n_full              = (n_wr_wptr[ADRW]!=n_wr_rptr[ADRW]) & (n_wr_wptr[ADRW-1:0] == n_wr_rptr[ADRW-1:0]);
        n_wr_ready          = ~n_full;

    end // COMBO


    always@(posedge i_clk or negedge i_rst_n)
    begin: FF
        if ( ~i_rst_n ) begin
            r_wr_rptr      <= 0;
            r_wr_wptr      <= 0;
            r_wr_ready     <= 1;
            r_full         <= 0;
            r_rd_rptr      <= 0;
            r_rd_wptr      <= 0;
            r_rd_valid     <= 0;
            r_empty        <= 1;
        end
        else begin
            r_wr_rptr      <= n_wr_rptr ;
            r_wr_wptr      <= n_wr_wptr ;
            r_wr_ready     <= n_wr_ready;
            r_full         <= n_full    ;
            r_rd_rptr      <= n_rd_rptr ;
            r_rd_wptr      <= n_rd_wptr ;
            r_rd_valid     <= n_rd_valid;
            r_empty        <= n_empty   ;
        end
    end // FF

    // Combo Out
    assign o_rd_data        = rd_data                   ; // drectly from BRAM
      
    // Reg   Out
    assign o_wr_ready       = r_wr_ready                ;
    assign o_full           = r_full                    ;
    assign o_rd_valid       = r_rd_valid                ;
    assign o_empty          = r_empty                   ;


endmodule


