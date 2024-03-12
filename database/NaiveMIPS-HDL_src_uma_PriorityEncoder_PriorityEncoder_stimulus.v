module PriorityEncoder_stimulus;
    reg clk;
    reg reset;
  
    reg [15:0] prio_input;
    reg enable_n;
    wire [3:0] result16;
    wire [2:0] result8;
    wire valid16;
	wire valid8;
	PriorityEncoder16 prio(.data(prio_input), .enable_n(enable_n), .result(result16), .result_valid(valid16));
    PriorityEncoder8 peio(.data(prio_input[7:0]), .enable_n(enable_n), .result(result8), .result_valid(valid8));
    initial
    begin
        enable_n = 1'b1;
        #2 prio_input = 16'hC0;
        #2 prio_input = 16'h31;
        #2 enable_n = 1'b0;
        #2 prio_input = 16'h0;
        #2 prio_input = 16'h20;
        #2 prio_input = 16'hEF;
        #2 enable_n = 1'b1;
        #2 enable_n = 1'b0;
        #2 prio_input = 16'h80;
        #2 prio_input = 16'hF0;
    end
endmodule
