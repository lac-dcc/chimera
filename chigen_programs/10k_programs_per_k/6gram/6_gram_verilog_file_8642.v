// Seed: 3510654525
module module_0 (
    input  tri0  id_0,
    output wand  id_1,
    output uwire id_2,
    output tri0  id_3,
    input  tri0  id_4,
    input  wor   id_5,
    input  wand  id_6,
    input  tri0  id_7,
    input  wire  id_8,
    output tri   id_9
);
  assign id_9 = id_6;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    output logic id_3,
    output supply0 id_4
);
  always id_3 = #1 1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_4,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.type_5 = 0;
endmodule
