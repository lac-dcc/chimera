// Seed: 645168214
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input wand id_2,
    input tri id_3,
    input wire id_4,
    output uwire id_5,
    output tri0 id_6,
    input tri0 id_7,
    input uwire id_8,
    output tri id_9,
    input tri id_10,
    output tri0 id_11
    , id_26,
    input tri1 id_12,
    input wire id_13,
    input tri1 id_14,
    input wand id_15,
    input wor id_16,
    output uwire id_17,
    input wor id_18,
    output tri id_19,
    input wand id_20,
    output tri0 id_21,
    output uwire id_22,
    input tri id_23,
    output wire id_24
);
  assign id_26[(-1'd0==1-1)] = 1;
  logic [1 : 1] id_27 = 1;
  wire id_28, id_29;
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    output tri   id_2
);
  always
    if (1) begin : LABEL_0
      if (-1 && 1) id_1 <= id_0;
      id_1 <= id_0 | id_0;
    end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_11 = 0;
endmodule
