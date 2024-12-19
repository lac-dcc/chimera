// Seed: 1558907099
module module_0 (
    input tri id_0,
    input uwire id_1,
    input uwire id_2,
    input tri id_3,
    output tri0 id_4 id_26
    , id_27,
    input tri1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wire id_8,
    input supply1 id_9,
    input supply1 id_10,
    input supply0 id_11
    , id_28,
    input supply0 id_12,
    output wor id_13,
    input wire id_14,
    input supply1 id_15,
    input wor id_16,
    output supply1 id_17,
    input supply0 id_18,
    input supply1 id_19,
    input tri0 id_20,
    input wire id_21,
    input wire id_22,
    output wor id_23,
    input wand id_24
);
  wire id_29;
  genvar id_30;
  assign module_1.id_0 = 0;
  wire id_31;
  assign id_17 = id_28;
  supply0 id_32;
  assign (pull1, supply0) id_13 = id_32;
  wire id_33, id_34;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule
