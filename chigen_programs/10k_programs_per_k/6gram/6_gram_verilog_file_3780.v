// Seed: 2442025973
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    input  tri   id_3,
    output uwire id_4
);
  assign id_0 = "" ? id_1 : 1;
  wire id_6;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    output tri id_4
);
  always @(posedge id_3 or negedge 1) for (id_4 = 1; id_1; id_4 = id_1) id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.type_10 = 0;
endmodule
