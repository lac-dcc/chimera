// Seed: 1348889560
module module_0 (
    input tri   id_0,
    input uwire id_1,
    input wor   id_2,
    input wor   id_3,
    input uwire id_4,
    input wire  id_5
);
  assign id_7 = id_7;
  assign id_8 = 1;
  tri id_9 = 1'b0 ? id_2 : id_0#(.id_3(id_7)) != 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input uwire id_5,
    output tri id_6
);
  assign id_6 = -1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0
  );
  assign modCall_1.id_8 = 0;
  wire id_8;
  always_comb @(posedge id_1 - id_5) @(posedge id_1) id_6 = id_1;
  assign id_6 = 1;
endmodule
