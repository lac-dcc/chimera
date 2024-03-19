module top_module();
    reg clk;
    parameter CYCLE = 10;
    always #(CYCLE) begin
        clk = ~clk;
    end
    dut ins (clk);
endmodule


