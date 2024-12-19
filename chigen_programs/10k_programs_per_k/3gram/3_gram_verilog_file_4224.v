// Seed: 128583224
module module_0 (
    output uwire id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wor id_4,
    input wire id_5,
    input supply1 id_6,
    output tri id_7,
    input supply1 id_8,
    input wand id_9
);
  assign id_7 = 1'b0;
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  reg id_15 = 1, id_16, id_17, id_18;
  initial id_17 <= id_2 == id_1++;
  assign id_16 = 1;
endmodule
module module_1 (
    output wire id_0
    , id_15,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input wire id_4,
    input uwire id_5,
    output tri id_6,
    input tri id_7,
    input wor id_8,
    output wor id_9,
    output uwire id_10,
    output tri0 id_11,
    input supply1 id_12,
    input tri id_13
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_1,
      id_3,
      id_8,
      id_9,
      id_12,
      id_3
  );
  assign modCall_1.type_21 = 0;
endmodule
