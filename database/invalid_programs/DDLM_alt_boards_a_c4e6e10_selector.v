`include "config.vh"

module selector
#(
    parameter w = 8,
              n = 2
) 
(
    input      [n * w - 1:0] d,
    input      [n     - 1:0] sel,
    output reg [w     - 1:0] y
);

    integer i;

    always @*
    begin
        y = { w { 1'b0 } };
        
        for (i = 0; i < n; i = i + 1) 
            y = y | (d [i * w +: w] & { w { sel [i] } });
    end

endmodule
