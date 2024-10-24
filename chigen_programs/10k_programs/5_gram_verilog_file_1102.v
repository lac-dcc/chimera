// Seed: 3409446533
`timescale 1ps / 1ps
module module_0;
  reg id_0;
  always @(posedge 1'b0 or posedge id_0) id_0 = 1;
  reg id_1;
  always @(posedge id_1) begin
    id_1 <= id_0;
    id_0 <= id_1;
    id_1 <= id_1;
  end
endmodule
