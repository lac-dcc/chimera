// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module updown_counter
#(parameter WIDTH = 8)
(
    input clk,
    input rst_n,
    input dir,  // 1 count up, 0 count down
    output tc,  // terminal count
    output reg [WIDTH-1:0] counter_val
);

    assign tc = (counter_val == {WIDTH{1'b1}}) ? 1 : 0;

    always @(posedge clk)
    begin
        if(!rst_n)
            counter_val <= 0;
        else begin
            if(dir)
                counter_val <= counter_val + 1;
            else
                counter_val <= counter_val - 1;
        end
    end

endmodule
