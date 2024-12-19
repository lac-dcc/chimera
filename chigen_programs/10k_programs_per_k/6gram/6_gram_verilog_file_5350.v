// Seed: 3402945842
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    input tri id_5
);
  assign id_1 = 1'b0;
  assign id_0 = id_3 && id_4;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri0  id_2,
    output wor   id_3,
    output tri0  id_4,
    output uwire id_5,
    input  tri1  id_6,
    input  wand  id_7,
    input  tri   id_8,
    input  tri0  id_9,
    output logic id_10
);
  reg id_12;
  id_13(
      !(id_10), 1, 1'b0, id_7
  );
  assign id_2 = id_1;
  always id_10 = #1 id_12;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_8,
      id_7,
      id_8,
      id_9
  );
  assign modCall_1.type_3 = 0;
endmodule
