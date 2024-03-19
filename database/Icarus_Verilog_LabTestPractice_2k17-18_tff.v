`ifndef TFF
`define TFF
    module tff(
        output q,
        input t,
        input clock,
        input clear
    );

    reg q;

    always @(posedge clock , clear) begin

        if(clear)
            q = 1'b0;
        else
            if( t==1 )
                q = ~q;
            else
                q = q;

    end

    endmodule
`endif