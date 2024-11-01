// Seed: 2569427359
module module_0 (
    input tri id_0,
    input tri0 id_1,
    output wire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wire id_5,
    output wand id_6,
    input tri id_7,
    input tri id_8,
    input uwire id_9,
    output tri1 id_10,
    output supply1 id_11,
    input tri0 id_12,
    input wor id_13,
    input wire id_14,
    output wand id_15
);
  tri0 id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24;
  wire id_25;
  assign id_21 = 1 | 1;
  assign id_2  = id_17;
  wire id_26;
  wire id_27;
  wire id_28;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wor id_5,
    input tri0 id_6
);
  wire id_8;
  integer id_9;
  wire id_10;
  wire id_11;
  or (id_5, id_4, id_9, id_11, id_10, id_8, id_0, id_6);
  wire id_12;
  id_13 :
  assert property (@("" + id_6 or 1) id_10)
  else disable id_14;
  module_0(
      id_2, id_3, id_5, id_6, id_4, id_0, id_5, id_4, id_3, id_2, id_1, id_1, id_3, id_2, id_0, id_5
  );
  wire id_15;
  wire id_16;
endmodule
