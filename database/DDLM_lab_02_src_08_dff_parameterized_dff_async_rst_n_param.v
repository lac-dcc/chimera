module dff_async_rst_n_param
#(
    parameter WIDTH = 8,
              RESET = 8'b0
)
(
    input                      clk,
    input                      rst_n,
    input      [WIDTH - 1 : 0] d,
    output reg [WIDTH - 1 : 0] q
);

    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            q <= RESET;
        else
            q <= d;
 
endmodule