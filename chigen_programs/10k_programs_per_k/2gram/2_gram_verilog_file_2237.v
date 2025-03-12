// Seed: 2887881107
module module_0 (
    output uwire id_0,
    output wor id_1,
    input wor id_2,
    input uwire id_3,
    output uwire id_4,
    output uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    output tri id_8,
    input tri id_9,
    output supply1 id_10,
    output wire id_11,
    output wire id_12,
    input tri1 id_13
    , id_16,
    input supply1 id_14
);
  assign id_1 = id_16;
  wire id_17;
  wire id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29;
  assign module_1.id_5 = 0;
  parameter id_30 = -1;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    output tri1 id_4,
    input supply1 id_5,
    input uwire id_6,
    input uwire id_7,
    output tri0 id_8,
    input wire id_9
);
  bit id_11 = id_11;
  assign id_11 = 1;
  initial begin : LABEL_0
    id_11 <= 1;
  end
  xnor primCall (id_4, id_7, id_6, id_5, id_3, id_11, id_9, id_2, id_0);
  module_0 modCall_1 (
      id_4,
      id_8,
      id_7,
      id_9,
      id_8,
      id_1,
      id_6,
      id_6,
      id_4,
      id_6,
      id_1,
      id_8,
      id_4,
      id_3,
      id_7
  );
  assign id_8 = -1;
endmodule
