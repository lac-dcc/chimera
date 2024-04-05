`include "config.vh"

module sync_and_debounce_one
# (
    parameter depth = 8
)
(   
    input      clk,
    input      sw_in,
    output reg sw_out
);

    reg  [depth - 1:0] cnt;
    reg  [        2:0] sync;
    wire               sw_in_s;

    assign sw_in_s = sync [2];

    always @ (posedge clk)
        sync <= { sync [1:0], sw_in };

    always @ (posedge clk)
        if (sw_out ^ sw_in_s)
            cnt <= cnt + 1'b1;
        else
            cnt <= { depth { 1'b0 } };

    always @ (posedge clk)
        if (cnt == { depth { 1'b1 } })
            sw_out <= sw_in_s;

endmodule

//-------------------------------------------------------------------

module sync_and_debounce
# (
    parameter w = 1, depth = 8
)
(   
    input            clk,
    input  [w - 1:0] sw_in,
    output [w - 1:0] sw_out
);

    genvar sw_cnt;

    generate
        for (sw_cnt = 0; sw_cnt < w; sw_cnt = sw_cnt + 1)
        begin : gen_sync_and_debounce
           
           sync_and_debounce_one
           # (.depth (depth))
           i_sync_and_debounce_one
           (    
              .clk    ( clk             ),
              .sw_in  ( sw_in  [sw_cnt] ),
              .sw_out ( sw_out [sw_cnt] )
           );

        end
    endgenerate 

endmodule
