`ifndef DFF_SYNC_CLEAR
`define DFF_SYNC_CLEAR
    module dff_sync_clear(
        output q,
        input d,
        input clear,
        input clock
    );

    reg q;        
        always @(clock) begin

            if(clear) 
                q = 0;
            else
                q = d;

        end

    endmodule
`endif