// Seed: 3039207763
module module_0 (
    input supply1 id_0,
    output wire id_1,
    id_23 id_24,
    output wor id_2,
    input supply0 id_3,
    input wire id_4,
    output wand id_5,
    input tri0 id_6,
    output wor id_7,
    output wor id_8,
    input wire id_9,
    input tri id_10,
    input uwire id_11,
    input wor id_12,
    input wire id_13,
    output tri0 id_14,
    input wand id_15,
    input uwire id_16,
    input wire id_17,
    output supply1 id_18,
    output supply1 id_19,
    output uwire id_20,
    input tri1 id_21
);
  logic id_25;
  wire  id_26;
  wire  id_27;
  assign module_1.id_1 = 0;
  assign id_27 = id_14++;
  wire id_28;
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri1 id_3,
    output uwire id_4,
    output uwire id_5
    , id_16,
    output uwire id_6,
    input tri id_7,
    input wand id_8,
    output supply0 id_9,
    output wand id_10,
    input tri0 id_11,
    output tri0 id_12,
    output uwire id_13,
    output tri id_14
);
  assign id_14 = 1'b0;
  wire id_17;
  assign id_12 = 1;
  assign id_13 = 1;
  genvar id_18;
  module_0 modCall_1 (
      id_7,
      id_9,
      id_6,
      id_2,
      id_2,
      id_13,
      id_3,
      id_10,
      id_6,
      id_2,
      id_2,
      id_11,
      id_8,
      id_2,
      id_10,
      id_11,
      id_3,
      id_1,
      id_6,
      id_4,
      id_6,
      id_8
  );
  assign id_14 = id_7;
  wire [-1 : 1] id_19;
  wire id_20;
  assign id_18 = id_8;
  assign id_10 = id_16 + id_2;
  always begin : LABEL_0
    id_18 = 1;
  end
endmodule
