// Seed: 1052352957
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input wire id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    input tri1 id_7,
    input wor id_8,
    input supply1 id_9,
    output wor id_10,
    input tri id_11,
    output uwire id_12,
    input tri0 id_13,
    output wand id_14,
    output tri0 id_15
);
  logic id_17;
endmodule
module module_1 #(
    parameter id_15 = 32'd38
) (
    output logic id_0,
    output wor id_1,
    output logic id_2
    , id_17,
    input tri id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply1 id_6,
    output wand id_7,
    input wor id_8,
    output wor id_9,
    input uwire id_10,
    input supply1 id_11,
    input tri id_12,
    input wand id_13,
    input tri id_14,
    input tri0 _id_15
);
  logic id_18;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_3,
      id_5,
      id_4,
      id_5,
      id_8,
      id_12,
      id_8,
      id_13,
      id_9,
      id_14,
      id_9,
      id_12,
      id_1,
      id_6
  );
  assign modCall_1.id_13 = 0;
  initial begin : LABEL_0
    force id_7[id_15] = 1'b0;
    id_2 <= id_5 ? id_4 : -1 ? id_12 : 1;
    id_0 <= id_12;
  end
endmodule
