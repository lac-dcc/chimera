// Seed: 1127453670
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wor id_2,
    output wand id_3,
    output wor id_4,
    output tri1 id_5,
    input tri1 id_6,
    output wand id_7,
    output wire id_8,
    output tri1 id_9,
    output tri1 id_10,
    output tri id_11,
    input tri0 id_12,
    input wor id_13,
    output tri id_14,
    input tri id_15,
    input uwire id_16,
    input tri1 id_17,
    input tri0 id_18,
    output tri0 id_19,
    output wand id_20,
    input wand id_21,
    output supply0 id_22,
    output wor id_23,
    output wor id_24,
    output tri0 id_25,
    output supply0 id_26,
    input tri id_27,
    input tri0 id_28,
    output supply0 id_29,
    input supply1 id_30
);
  assign id_10 = id_30 - id_13;
endmodule
module module_1 (
    input tri   id_0,
    input uwire id_1,
    input wand  id_2,
    input wire  id_3
);
  assign id_5 = (id_1);
  wor id_6, id_7;
  assign id_6.id_1 = id_3;
  wire id_8;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_6,
      id_7,
      id_5,
      id_6,
      id_7,
      id_7,
      id_6,
      id_5,
      id_6,
      id_6,
      id_3,
      id_5,
      id_2,
      id_0,
      id_3,
      id_3,
      id_7,
      id_5,
      id_3,
      id_5,
      id_5,
      id_7,
      id_7,
      id_5,
      id_5,
      id_0,
      id_5,
      id_6
  );
  assign modCall_1.id_19 = 0;
  assign id_6 = 1'b0;
  timeunit 1ps;
endmodule
