// Seed: 3866956569
module module_0 (
    output supply0 id_0,
    output tri id_1,
    output wor id_2,
    output wor id_3,
    output uwire id_4,
    input uwire id_5,
    input tri id_6,
    input uwire id_7,
    input uwire id_8,
    output tri id_9,
    input supply1 id_10#(.id_26(1)),
    input wire id_11,
    input wire id_12,
    input tri1 id_13,
    input supply1 id_14,
    input uwire id_15,
    input tri1 id_16,
    output wand id_17,
    input wire id_18,
    output wor id_19,
    input supply0 id_20,
    input supply1 id_21,
    output wand id_22,
    output supply1 id_23,
    output supply0 id_24
);
  wire id_27;
  assign id_26 = id_5;
  assign id_9  = 1;
  assign id_26 = 'b0;
  assign id_2  = 1;
  wire id_28;
endmodule
module module_1 (
    input  wor  id_0,
    inout  tri1 id_1,
    output wand id_2,
    output tri1 id_3,
    input  wand id_4
);
  uwire id_6 = id_6, id_7;
  assign id_3 = 1 ? 1 : 1 ? id_0 : 1;
  assign id_7 = 1;
  assign id_6 = id_4;
  module_0(
      id_3,
      id_6,
      id_7,
      id_2,
      id_6,
      id_0,
      id_1,
      id_1,
      id_0,
      id_6,
      id_0,
      id_4,
      id_7,
      id_0,
      id_1,
      id_7,
      id_1,
      id_3,
      id_1,
      id_7,
      id_1,
      id_6,
      id_2,
      id_2,
      id_2
  );
  assign id_6 = id_1;
endmodule
