
module clkgen12(
    output reg clk
    );

    initial begin
        clk     = 0;
        forever begin
            #41.6 clk  = ~clk;
        end
    end

endmodule
