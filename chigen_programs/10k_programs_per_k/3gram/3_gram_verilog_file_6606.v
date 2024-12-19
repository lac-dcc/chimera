// Seed: 2322966701
module module_0 (
    input uwire id_0,
    input tri id_1,
    output tri id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output uwire id_7,
    output wire id_8,
    input supply1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply0 id_12,
    input wor id_13,
    output wire id_14,
    output supply1 id_15,
    input wor id_16,
    input supply1 id_17,
    output supply0 id_18,
    output supply1 id_19,
    input tri0 id_20,
    output wire id_21
);
  assign id_8 = id_3;
  wire id_23 = 1;
  assign id_8 = 1;
  wor  id_24;
  wand id_25 = 1;
  assign id_8 = id_24;
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input tri1 id_2,
    output wire id_3,
    input wire id_4,
    input tri0 id_5
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_3,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_3,
      id_0,
      id_5,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
