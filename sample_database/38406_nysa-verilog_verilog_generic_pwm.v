// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module pwm (
  input               clk,
  input               rst,

  input               en,

  input       [31:0]  period,
  input       [31:0]  duty_cycle,

  output  reg          out
);

//Local Parameters
//Registers/Wires
reg   [31:0]            count;
//Submodules
//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  if (rst || !en) begin
    count           <=  0;
    out             <=  0;
  end
  else begin
    if (count < period) begin
      count         <=  count + 1;
    end
    else begin
      count         <=  0;
    end

    if (count < duty_cycle) begin
      out           <=  1;
    end
    else begin
      out           <=  0;
    end
  end
end
endmodule
