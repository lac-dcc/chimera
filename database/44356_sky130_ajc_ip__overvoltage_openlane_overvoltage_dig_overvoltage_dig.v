// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

module overvoltage_dig(
//INPUTS
input logic [3:0] otrip,
//OUTPUTS
output logic [15:0] otrip_decoded
);

  //TRIP-VOLTAGE 4-to-16 DECODER
  always @ (otrip) begin
    case(otrip)
      4'b1111: otrip_decoded = 16'b1000000000000000;
      4'b1110: otrip_decoded = 16'b0100000000000000;
      4'b1101: otrip_decoded = 16'b0010000000000000;
      4'b1100: otrip_decoded = 16'b0001000000000000;
      4'b1011: otrip_decoded = 16'b0000100000000000;
      4'b1010: otrip_decoded = 16'b0000010000000000;
      4'b1001: otrip_decoded = 16'b0000001000000000;
      4'b1000: otrip_decoded = 16'b0000000100000000;
      4'b0111: otrip_decoded = 16'b0000000010000000;
      4'b0110: otrip_decoded = 16'b0000000001000000;
      4'b0101: otrip_decoded = 16'b0000000000100000;
      4'b0100: otrip_decoded = 16'b0000000000010000;
      4'b0011: otrip_decoded = 16'b0000000000001000;
      4'b0010: otrip_decoded = 16'b0000000000000100;
      4'b0001: otrip_decoded = 16'b0000000000000010;
      4'b0000: otrip_decoded = 16'b0000000000000001;
    endcase
  end
endmodule
