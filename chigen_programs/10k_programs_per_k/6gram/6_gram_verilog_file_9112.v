// Seed: 474115203
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input wor id_4
);
  assign id_0 = id_2;
endmodule
module module_1 (
    output logic id_0,
    input logic id_1,
    input supply1 id_2,
    output tri0 id_3
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
  tri0 id_5 = 1;
  always @(negedge id_1 or posedge 1)
    for (id_5 = id_2; id_2; id_0 = !id_5)
      if (id_2 == 1'b0) id_0 <= id_1;
endmodule
