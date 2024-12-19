// Seed: 3443791995
module module_0 (
    output tri1 id_0,
    output wire id_1,
    input tri1 id_2,
    output tri id_3,
    input wand id_4,
    input supply0 id_5,
    output wand id_6,
    output wire id_7,
    output supply1 id_8,
    output tri id_9,
    input tri id_10,
    output supply0 id_11
);
  wire id_13;
  assign id_7 = id_4;
  supply1 id_14;
  assign id_14 = 1;
  assign id_0  = {1, 1};
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2
);
  assign id_1 = ~id_0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_6 = 0;
  assign id_1 = id_2;
  wire id_4;
endmodule
