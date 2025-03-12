// Seed: 1024987897
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri id_4,
    input supply0 id_5,
    input wor id_6,
    input wor id_7,
    input tri0 id_8,
    output supply1 id_9,
    output supply0 id_10,
    output supply0 id_11,
    input wor id_12,
    input wor id_13,
    output wire id_14,
    output supply0 id_15
    , id_25,
    input tri0 id_16,
    input wire id_17,
    input supply1 id_18,
    output tri1 id_19,
    output uwire id_20,
    input wor id_21,
    input wor id_22,
    output tri1 id_23
);
  always_latch
    if (1) begin : LABEL_0
      $signed(27);
      ;
    end
endmodule
module module_1 #(
    parameter id_8 = 32'd82
) (
    output tri1 id_0,
    input wire id_1,
    output tri0 id_2,
    output supply1 id_3,
    input wor id_4,
    output wor id_5,
    output tri0 id_6,
    input wire id_7,
    input wire _id_8,
    input supply1 id_9,
    output tri1 id_10
);
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4,
      id_9,
      id_1,
      id_0,
      id_0,
      id_10,
      id_4,
      id_1,
      id_10,
      id_0,
      id_4,
      id_7,
      id_7,
      id_10,
      id_10,
      id_1,
      id_7,
      id_10
  );
  assign modCall_1.id_21 = 0;
  uwire [1 : -1] id_14;
  wire [-1 : id_8] id_15;
  logic id_16;
  assign id_14 = 1;
  wire id_17;
endmodule
