module unit_delay
# (
    parameter WIDTH = 1
) 
(
    input                      clock,
    input      [ WIDTH - 1:0 ] data_in,
    output reg [ WIDTH - 1:0 ] data_out
);

    always @ (posedge clock)
        data_out <= data_in;

endmodule
