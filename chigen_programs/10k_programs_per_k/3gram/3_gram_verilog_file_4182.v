// Seed: 548942026
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri0 id_5,
    input wire id_6
    , id_27,
    input wand id_7,
    output tri0 id_8,
    input wand id_9,
    input wor id_10,
    input tri0 id_11,
    input wire id_12,
    input supply0 id_13,
    output tri id_14,
    output tri1 id_15,
    input uwire id_16,
    output wire id_17,
    input tri0 id_18,
    input supply0 id_19,
    output supply1 id_20,
    output tri1 id_21,
    output wor id_22,
    input wand id_23,
    input tri1 id_24,
    output wand id_25
);
  uwire id_28 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri id_3,
    input tri1 id_4,
    output uwire id_5,
    input tri id_6,
    output supply0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output wand id_10,
    output logic id_11
);
  logic id_13;
  ;
  initial id_11 = id_4;
  assign id_3  = id_13;
  assign id_13 = id_2;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_5,
      id_4,
      id_2,
      id_7,
      id_9,
      id_9,
      id_10,
      id_8,
      id_1,
      id_1,
      id_6,
      id_8,
      id_5,
      id_7,
      id_1,
      id_7,
      id_8,
      id_2,
      id_10,
      id_5,
      id_0,
      id_1,
      id_9,
      id_3
  );
  assign modCall_1.id_17 = 0;
  always @(posedge id_13 or posedge id_1) begin : LABEL_0
    id_11 <= 1;
  end
endmodule
