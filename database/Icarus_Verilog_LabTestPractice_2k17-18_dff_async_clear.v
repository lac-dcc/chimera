`ifndef DFF_ASYNC_CLEAR
`define DFF_ASYNC_CLEAR
    module dff_async_clear(
        output q,
        input d,
        input clock,
        input clear
    );

    reg q;

        always @(posedge clock or clear) begin

            if(clear)
                q = 0;
            else
                q = d;

        end

    endmodule
`endif