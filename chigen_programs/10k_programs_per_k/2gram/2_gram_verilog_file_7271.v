// Seed: 1082938170
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    input uwire id_3,
    output tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input supply1 id_9,
    input uwire id_10,
    input wand id_11,
    input wor id_12,
    input tri0 id_13,
    input wand id_14,
    output wire id_15,
    output uwire id_16
    , id_26,
    input uwire id_17,
    input uwire id_18,
    input tri0 id_19,
    input wand id_20,
    inout tri id_21,
    output tri0 id_22,
    input wire id_23,
    input supply0 id_24
);
  uwire id_27 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    inout tri1 id_1,
    input wire id_2,
    input wor id_3,
    input wire id_4,
    input tri0 id_5,
    input wire id_6,
    input wand id_7,
    input wand id_8,
    input supply1 id_9,
    output tri0 id_10,
    input uwire id_11
);
  reg id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_1,
      id_9,
      id_7,
      id_9,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6,
      id_8,
      id_8,
      id_10,
      id_1,
      id_8,
      id_7,
      id_2,
      id_6,
      id_1,
      id_10,
      id_1,
      id_11
  );
  assign modCall_1.type_37 = 0;
  initial id_13 = id_13;
  always id_13 <= 1;
  assign id_10 = id_3;
  wire id_14;
  id_15(
      id_10, 0, id_10, 1, 1
  );
endmodule
