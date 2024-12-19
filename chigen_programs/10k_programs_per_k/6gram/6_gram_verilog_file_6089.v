// Seed: 3948211214
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input tri id_2,
    input wire id_3,
    input tri id_4,
    output tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    output tri id_9,
    output supply1 id_10,
    output tri id_11,
    output uwire id_12,
    output wire id_13,
    output uwire id_14
    , id_16
);
  assign id_10 = id_2;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input wire id_2,
    input tri1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input wand id_8,
    input tri id_9,
    input tri0 id_10,
    input uwire id_11,
    input wor id_12,
    input tri1 id_13,
    output tri id_14,
    input uwire id_15,
    input supply0 id_16,
    input wire id_17
    , id_21,
    output wire id_18,
    output wand id_19
);
  assign id_19 = 1;
  nor primCall (id_18, id_15, id_16, id_6, id_21, id_1, id_5);
  module_0 modCall_1 (
      id_0,
      id_19,
      id_4,
      id_8,
      id_3,
      id_18,
      id_6,
      id_12,
      id_14,
      id_7,
      id_14,
      id_7,
      id_18,
      id_7,
      id_18
  );
  assign modCall_1.type_4 = 0;
  tri id_22;
  assign id_22 = id_0;
  initial begin : LABEL_0$display
    ;
  end
endmodule
