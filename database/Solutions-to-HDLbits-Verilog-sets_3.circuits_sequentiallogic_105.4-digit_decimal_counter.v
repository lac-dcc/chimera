module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
   
    //用来表示进位
    assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && q[3:0] == 4'd9, q[3:0] == 4'd9};
    //one
    count4 inst1_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(1),
        .q(q[3:0])
    );
 
    //ten 
    count4 inst2_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(ena[1]),
        .q(q[7:4])
    );
 
    //hundred
    count4 inst3_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(ena[2]),
        .q(q[11:8])
    );
 
    //thousand
    count4 inst4_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(ena[3]),
        .q(q[15:12])
    );
   
endmodule

module count4
	(
    input clk,
    input reset,
    input ena,
    output reg[3:0] q
	);
    always @(posedge clk) begin
        if(reset) q <= 4'd0;
        else begin
            if(ena) begin
                if(q == 4'd9) q <= 4'd0;
                else q <= q + 1;
            end
        end
    end
endmodule
