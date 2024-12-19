// Seed: 2413915775
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output supply1 id_2,
    output tri id_3,
    input uwire id_4,
    input tri0 id_5,
    input supply0 id_6,
    input wand id_7,
    input uwire id_8,
    input wand id_9,
    input uwire id_10,
    input tri id_11,
    input tri1 id_12,
    input wand id_13,
    input supply1 id_14,
    input tri0 id_15,
    output tri1 id_16,
    input tri0 id_17,
    input wire id_18,
    input supply0 id_19,
    output uwire id_20,
    input wire id_21,
    input wor id_22,
    input uwire id_23,
    input supply1 id_24,
    output wand id_25,
    output wor id_26,
    input supply0 id_27,
    input uwire id_28,
    input supply0 id_29,
    output tri id_30,
    input supply1 id_31,
    input tri id_32,
    output supply1 id_33,
    input uwire id_34
);
  wire id_36;
  wire id_37;
  assign id_30 = 1;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    inout supply1 id_2,
    output wand id_3,
    input supply1 id_4
);
  assign id_3 = id_0;
  or primCall (id_2, id_4, id_0, id_6);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_0,
      id_4,
      id_0,
      id_2,
      id_0,
      id_4,
      id_4,
      id_1,
      id_4,
      id_2,
      id_0,
      id_3,
      id_4,
      id_0,
      id_4,
      id_2,
      id_3,
      id_1,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_1,
      id_2
  );
  assign modCall_1.id_24 = 0;
  wire id_7;
endmodule
