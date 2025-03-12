// Seed: 3860912477
module module_0 (
    input  wor   id_0,
    input  tri   id_1,
    output wand  id_2,
    input  uwire id_3,
    input  tri   id_4,
    output uwire id_5,
    output tri0  id_6
);
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output uwire id_2,
    output wor id_3,
    output supply0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output wor id_0,
    input wire id_1,
    input uwire id_2,
    output logic id_3,
    input tri id_4,
    output uwire id_5,
    input wand id_6,
    output supply0 id_7,
    output wire id_8,
    output tri0 id_9,
    output supply0 id_10,
    input wand id_11,
    input wire id_12,
    input tri1 id_13,
    input wor id_14,
    input wor id_15
);
  initial begin : LABEL_0
    id_3 <= -1;
  end
  module_0 modCall_1 (
      id_6,
      id_12,
      id_10,
      id_1,
      id_1,
      id_7,
      id_8
  );
endmodule
