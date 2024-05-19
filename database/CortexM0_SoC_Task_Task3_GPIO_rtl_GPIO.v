// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module GPIO (
    input outEn,
    input clk,
    input RSTn,
    input [7:0]  oData,  
    output[7:0]  iData,  
    inout[7:0]  ioPin
);
reg [7:0] tmp;

always@(posedge clk or negedge RSTn) begin
  if(~RSTn) tmp <= 8'd0;
  else tmp <= ioPin;
end

assign iData = tmp;
assign ioPin = outEn ? oData : 8'bzzzzzzzz;

endmodule