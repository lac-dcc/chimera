// Seed: 629456113
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wand id_4,
    input tri1 id_5,
    output wand id_6,
    input tri0 id_7,
    input wor id_8,
    input tri id_9,
    input wire id_10,
    output uwire id_11,
    input wand id_12,
    input tri0 id_13,
    input tri0 id_14,
    input tri0 id_15,
    output wor id_16,
    input wand id_17,
    input wand id_18,
    output tri id_19,
    input wire id_20,
    input uwire id_21,
    output wor id_22,
    input uwire id_23,
    input tri0 id_24,
    input tri id_25,
    input wor id_26,
    input supply1 id_27,
    output uwire id_28,
    input tri1 id_29,
    input wire id_30,
    input supply1 id_31
);
  wire id_33, id_34, id_35, id_36;
  assign id_6 = id_23;
  logic id_37;
  ;
endmodule
module module_0 (
    output wand id_0,
    output tri0 id_1,
    input uwire id_2,
    input wire id_3,
    input wor id_4,
    output uwire id_5,
    input supply1 id_6
);
  assign id_0 = 1;
  assign module_1 = id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_2,
      id_3,
      id_3,
      id_1,
      id_4,
      id_2,
      id_4,
      id_3,
      id_1,
      id_6,
      id_6,
      id_2,
      id_6,
      id_1,
      id_3,
      id_2,
      id_0,
      id_3,
      id_3,
      id_5,
      id_4,
      id_2,
      id_3,
      id_2,
      id_4,
      id_5,
      id_4,
      id_6,
      id_3
  );
  assign modCall_1.id_11 = 0;
  int id_8;
  ;
  wire id_9;
  assign id_5 = id_2;
  assign id_1 = id_8 ? 1 : id_2#(.id_6(1));
endmodule
