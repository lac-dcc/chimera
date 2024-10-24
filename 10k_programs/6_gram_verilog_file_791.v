// Seed: 3211557387
`timescale 1ps / 1 ps
module module_0 (
    input  id_0,
    input  id_1,
    output id_2
);
  reg id_3 = id_0.id_1;
  always @(posedge id_1 or posedge id_3) begin
    id_2[1] <= id_3;
    if (id_3) begin
      id_3 <= 1;
    end else id_3 <= id_0;
  end
endmodule
