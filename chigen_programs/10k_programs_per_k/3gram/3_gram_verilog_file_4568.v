// Seed: 383562531
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3
  );
  assign id_3[1] = id_5;
endmodule
module module_2 (
    input wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    output wand id_3,
    output wor id_4
);
  wire id_6;
endmodule
module module_3 (
    input tri0 id_0,
    input tri id_1,
    input uwire id_2,
    input tri1 id_3,
    output tri id_4,
    output uwire id_5,
    input uwire id_6,
    input tri id_7,
    output uwire id_8,
    input wand id_9,
    output wand id_10,
    input supply1 id_11,
    output supply0 id_12,
    input wor id_13,
    output wor id_14,
    input wand id_15,
    input wire id_16
);
  module_2 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_5,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
