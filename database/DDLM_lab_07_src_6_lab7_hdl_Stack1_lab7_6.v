module lab7_6

#(parameter DATA_WIDTH=8, parameter STACK_SIZE=4)

(
    input  clock,
    input  reset,
    input  push,
    input  pop,

    input  [DATA_WIDTH - 1:0] write_data,
    output reg [DATA_WIDTH - 1:0] read_data
);

    reg [DATA_WIDTH - 1:0] stack [0:STACK_SIZE - 1];
	
	// invert clk button
    wire w_clk = ~ clock;

    integer i;

    always @(posedge w_clk)
    begin
        if (reset)
        begin
            for (i = 0; i < STACK_SIZE; i = i + 1)
                stack [i] <= 0;
        end
        else if (push)
        begin
            for (i = 0; i < STACK_SIZE - 1; i = i + 1)
				    stack [i + 1] <= stack [i];

            stack [0] <= write_data;
        end
        else if (pop)
        begin
            for (i = 0; i < STACK_SIZE - 1; i = i + 1)
                stack [i] <= stack [i + 1];

            stack [STACK_SIZE - 1] <= 0;
	    read_data <= stack [0];
        end
    end

endmodule
