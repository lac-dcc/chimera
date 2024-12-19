// Seed: 2488337773
module module_0 (
    input supply1 id_0,
    output wor id_1,
    input wire id_2,
    input wor id_3,
    input supply0 id_4,
    input supply0 id_5,
    output supply1 id_6,
    input tri0 id_7
);
  uwire id_9;
  wire id_10, id_11;
  wand id_12 = 1;
  assign id_9 = id_7 - 1 ? id_0 : id_4;
  wire id_13;
  wire id_14;
  wire id_15, id_16;
  wire id_17;
  wire id_18;
  wire id_19 = id_13;
  wire id_20;
  wire id_21;
  logic [7:0][""] id_22 = id_20;
  wire id_23, id_24;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    input wand id_5,
    input wor id_6
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_6,
      id_2,
      id_5,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_9 = 0;
  assign id_0 = 1;
endmodule
