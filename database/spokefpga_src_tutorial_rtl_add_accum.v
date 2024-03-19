module add_accum( clock, reset, x, valid, accumsum );
    input clock;
    input reset;
    input [3:0] x;
    input valid;
    output reg [7:0] accumsum;

    always @(posedge clock) begin
        if ( reset )
            accumsum <= 0;
        else
            if ( valid )
                accumsum <= accumsum + x;
    end
endmodule