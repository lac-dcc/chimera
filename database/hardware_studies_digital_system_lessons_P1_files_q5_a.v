// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module LUT (
    input wire [2:0] address,
    output reg [1:0] SOP
);

reg [1:0] data [7:0];

initial begin
data[0] = 2'b11;
data[1] = 2'b11;
data[2] = 2'b10;
data[3] = 2'b00;
data[4] = 2'b01;
data[5] = 2'b01;
data[6] = 2'b10;
data[7] = 2'b01;
end

always @(address)
begin
    SOP = data[address];
  end
endmodule