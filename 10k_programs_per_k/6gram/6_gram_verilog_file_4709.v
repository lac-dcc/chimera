// Seed: 1187240480
`timescale 1 ps / 1 ps
module module_0 ();
  reg id_1;
  always @(posedge 1'b0) begin
    id_1 <= id_1 ? id_1 : 1 - id_1;
  end
endmodule
