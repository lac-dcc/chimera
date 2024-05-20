// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module tick_counter (
  input rst,
  input pulse,
  output [31:0] tick_count
);

reg [31:0] ms_counter;

initial begin 
  ms_counter = 0;
end

always @(posedge pulse or posedge rst) begin
  if (rst) begin
    ms_counter = 0;
  end
  else begin 
    ms_counter = ms_counter + 1;
  end
end

assign tick_count = ms_counter;

endmodule
