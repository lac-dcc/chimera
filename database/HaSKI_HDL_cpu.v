`timescale 1ps/1ps


module main();

    initial begin
        reset_reg = 0;
        reset_reg = #1 1;
    end

    // clock
    wire clk;
    clock c0(clk);

    reg reset_reg;
    wire reset = reset_reg;

    wire output_valid;
    wire [31:0] output_data;
    wire halt;

    Hardware_topEntity evaluator(clk, reset, output_valid, output_data, halt);
    
    always@(posedge clk) begin
        if (output_valid == 1) begin
            $display("%c", output_data);
        end else begin
            $display(".");
        end
    end

    always@(posedge clk) begin
        if (halt == 1) $finish;
    end

endmodule
