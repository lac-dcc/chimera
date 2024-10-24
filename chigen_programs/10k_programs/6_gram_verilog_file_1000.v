// Seed: 2769384944
module module_0 (
    input logic id_0,
    input id_1,
    input logic id_2
);
  assign id_3 = 1 ? id_0 : 1'b0;
  reg id_4;
  always @(id_0)
    if (id_3) id_4 <= 1;
    else if (1)
      if (id_2) id_4 <= 1;
      else id_4 <= !id_1;
endmodule
