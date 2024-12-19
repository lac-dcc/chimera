// Seed: 3759012786
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    input supply0 id_7,
    input wand id_8,
    output supply1 id_9,
    output tri0 id_10,
    output uwire id_11,
    output wire id_12,
    input wor id_13,
    output tri1 id_14
);
  wand id_16 = id_2 ? 1'b0 : id_16 < 1;
  wire id_17;
  wire id_18;
  wire id_19;
  assign id_1 = !id_2;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    output wand id_3,
    input wire id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wor id_7,
    input tri id_8
);
  real id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_8,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_6,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
