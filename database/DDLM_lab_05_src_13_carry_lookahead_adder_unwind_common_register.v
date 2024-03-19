module register
# (
    parameter WIDTH = 8
)
(
    input                      clock,
    input                      reset,
    input                      load,
    input 	   [ WIDTH - 1:0 ] data_in,
    output reg [ WIDTH - 1:0 ] data_out
);

	always @ ( posedge clock, negedge reset )
		if ( ~reset )
            data_out <= { WIDTH { 1'b0 } };
        else if ( load )
            data_out <= data_in;
endmodule
