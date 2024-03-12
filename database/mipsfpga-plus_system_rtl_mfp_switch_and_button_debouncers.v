module mfp_switch_or_button_sync_and_debouncer
# (
    parameter DEPTH = 8
)
(   
    input      clk,
    input      sw_in,
    output reg sw_out
);

    reg  [ DEPTH - 1 : 0] cnt;
    reg  [         2 : 0] sync;
    wire                  sw_in_s;

    assign sw_in_s = sync [2];

    always @ (posedge clk)
        sync <= { sync [1:0], sw_in };

    always @ (posedge clk)
        if (sw_out ^ sw_in_s)
            cnt <= cnt + 1'b1;
        else
            cnt <= { DEPTH { 1'b0 } };

    always @ (posedge clk)
        if (cnt == { DEPTH { 1'b1 } })
            sw_out <= sw_in_s;

endmodule

//-------------------------------------------------------------------

module mfp_multi_switch_or_button_sync_and_debouncer
# (
    parameter WIDTH = 1, DEPTH = 8
)
(   
    input                    clk,
    input  [ WIDTH - 1 : 0 ] sw_in,
    output [ WIDTH - 1 : 0 ] sw_out
);

    genvar sw_cnt;

    generate
        for (sw_cnt = 0; sw_cnt < WIDTH; sw_cnt = sw_cnt + 1)
        begin : GEN_DB_B
           
           mfp_switch_or_button_sync_and_debouncer
           # (.DEPTH (8))
           mfp_switch_or_button_sync_and_debouncer
           (    
              .clk    ( clk             ),
              .sw_in  ( sw_in  [sw_cnt] ),
              .sw_out ( sw_out [sw_cnt] )
           );

        end
    endgenerate 

endmodule
