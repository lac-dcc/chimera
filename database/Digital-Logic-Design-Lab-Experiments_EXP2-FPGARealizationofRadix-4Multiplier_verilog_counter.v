// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns
module counter(rst,en,co,clk);
    input rst,en,clk;
    output co;
    reg [2:0] cnt_num = 3'b0;
    assign co = &cnt_num;
    always @(posedge clk,posedge rst) begin
 		if(rst) 
			cnt_num <= 3'b0;
		else
			cnt_num <= cnt_num + 1; 
    end

endmodule