// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module startup #(
  parameter         RESET_TIMEOUT = 32'h0000FFFF
)(
  input             clk,
  output  reg       startup_rst = 1
);

//Local Parameters
//Registers/Wires
reg   [31:0]        startup_count;
//Submodules
//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  if (startup_count < RESET_TIMEOUT) begin
    startup_count <=  startup_count + 1;
    startup_rst   <=  1;
  end
  else begin
    startup_rst   <= 0;
  end
end

endmodule
