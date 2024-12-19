// Seed: 704232997
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 (
    output tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    output supply0 id_3,
    output tri0 id_4,
    input uwire id_5,
    input wor id_6,
    output wor id_7,
    output uwire id_8,
    input uwire id_9,
    input wire id_10,
    output tri0 id_11,
    output supply0 id_12,
    output tri1 id_13,
    input tri id_14,
    input supply0 id_15,
    input tri id_16,
    output wor id_17,
    input tri1 id_18
);
  id_20 :
  assert property (@(id_20) id_18);
  always id_20 = 1;
endmodule
module module_3 (
    output wire id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4
);
  module_2 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_4,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_2
  );
  assign modCall_1.id_17 = 0;
  always id_0 = id_1;
endmodule
