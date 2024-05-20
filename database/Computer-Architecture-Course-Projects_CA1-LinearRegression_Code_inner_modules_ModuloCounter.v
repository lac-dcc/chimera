// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module ModuloCounter (
    clk,
    rst,
    cnt_en,
    out,
    cout
);

  parameter word_len = 8;
  parameter divisor = 150;

  input clk, rst, cnt_en;
  output [word_len - 1 : 0] out;
  output cout;

  reg [word_len - 1 : 0] current_count;

  assign out  = current_count;
  assign cout = (current_count+1'b1 == divisor);

  always @(posedge clk or posedge rst) begin
		if(rst)
			current_count <= 'b0;
		else if(cnt_en)
			current_count <= (current_count + 1'b1) % divisor;
  end

endmodule
