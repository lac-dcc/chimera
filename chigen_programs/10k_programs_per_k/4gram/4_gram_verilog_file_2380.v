// Seed: 2645452832
module module_0 (
    output tri1 id_0,
    output supply0 id_1,
    input wire id_2,
    input tri1 id_3,
    input wire id_4,
    input tri1 id_5,
    input wand id_6,
    input tri0 id_7
);
  assign id_1 = id_6;
  assign id_0 = 1;
  supply0 id_9;
  wire id_10, id_11;
  wire id_12;
  assign id_9 = id_4;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input wor id_5,
    output supply1 id_6,
    input supply1 id_7,
    output supply0 id_8
);
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_0,
      id_5,
      id_3,
      id_5,
      id_0
  );
  assign modCall_1.type_0 = 0;
endmodule
