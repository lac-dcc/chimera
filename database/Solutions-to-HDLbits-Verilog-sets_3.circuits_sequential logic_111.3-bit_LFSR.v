module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
	
    wire L;
    wire clk;
    wire [2:0] R;
    reg [2:0] Q;
    assign R = SW;
    assign clk = KEY[0];
    assign L = KEY[1];
        
    always @(posedge clk) begin
        if(L) Q <= R;
        else Q <= {Q[2]^Q[1], Q[0], Q[2]};
    end
    
    assign LEDR = Q;
    

endmodule
