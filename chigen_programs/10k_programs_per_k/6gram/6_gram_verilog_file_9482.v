// Seed: 1485510800
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input tri id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri id_6,
    input uwire id_7,
    output tri id_8,
    output tri0 id_9,
    input wand id_10,
    input wor id_11,
    input tri0 id_12
    , id_30,
    output tri id_13,
    input tri0 id_14,
    output tri0 module_0,
    input uwire id_16,
    input tri id_17,
    input wand id_18,
    input wand id_19
    , id_31,
    input supply1 id_20
    , id_32,
    input supply0 id_21,
    input wor id_22,
    input wor id_23,
    output wand id_24,
    input wire id_25,
    input tri0 id_26,
    output tri id_27,
    output wor id_28
);
endmodule
module module_1 #(
    parameter id_6 = 32'd96
) (
    input tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    input wire id_3,
    output logic id_4,
    input supply1 id_5,
    input wire _id_6
    , id_9, id_10,
    output wire id_7
);
  logic [1 : id_6] id_11;
  parameter id_12 = 1;
  logic id_13 = id_11, id_14;
  logic id_15;
  logic id_16;
  ;
  wire id_17;
  assign id_11[1] = id_2 === id_17;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_0,
      id_7,
      id_1,
      id_1,
      id_3,
      id_2,
      id_7,
      id_7,
      id_0,
      id_0,
      id_5,
      id_7,
      id_1,
      id_7,
      id_0,
      id_1,
      id_0,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_7,
      id_3,
      id_0,
      id_7,
      id_7
  );
  assign id_7 = -1;
  generate
    for (id_18 = id_13; 1; id_4 = id_11 > 1) begin : LABEL_0
      assign id_13 = id_1 ? -1'b0 : id_3;
    end
  endgenerate
  integer id_19;
endmodule
