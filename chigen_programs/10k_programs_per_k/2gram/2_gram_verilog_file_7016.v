// Seed: 908205264
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input uwire id_2,
    output tri1 id_3,
    output supply1 id_4,
    input tri id_5,
    input wor id_6,
    input wire id_7,
    output tri id_8,
    output uwire id_9,
    input wire id_10,
    input wand id_11
);
  wire id_13;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output supply0 id_2,
    output wire id_3,
    input tri1 id_4,
    output tri id_5,
    output supply1 id_6,
    output wire id_7,
    output supply0 id_8
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_1,
      id_8,
      id_5,
      id_1,
      id_0,
      id_1,
      id_3,
      id_2,
      id_4,
      id_0
  );
endmodule
