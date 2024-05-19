// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License


module simple_counter
#(
    parameter   DATW  = 32
)
(
    input                           i_clk
,   input                           i_rst_n

,   input       [        DATW -1:0] i_init
,   input                           i_rst
,   input                           i_en
,   input                           i_count
,   input                           i_updown        // 0:up, 1:down

,   output      [        DATW -1:0] o_dat
);

    //---------------------------------------------------------------------
    // Constant Declarations
    //---------------------------------------------------------------------


    //---------------------------------------------------------------------
    // Reg/Wire
    //---------------------------------------------------------------------

    reg         [        DATW -1:0] r_cnt           , n_cnt             ;
    reg         [        DATW -1:0] cnt_change;

    always@(*)
    begin: COMBO
        cnt_change          = i_updown ? (r_cnt-1) : (r_cnt+1);
        n_cnt               = i_rst             ? i_init     :
                              (i_en & i_count)  ? cnt_change : r_cnt ;
    end // COMBO

    always@(posedge i_clk or negedge i_rst_n)
    begin: FF
        if ( ~i_rst_n ) begin
            r_cnt          <= i_init;
        end
        else begin
            r_cnt          <= n_cnt;
        end
    end // FF

    // Combo Out
    // Const Out
      
    // Reg   Out
    assign o_dat            = r_cnt;

endmodule

