// Seed: 3444549895
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input tri id_2,
    output wire id_3,
    input wire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    output uwire id_9
);
  wire id_11, id_12, id_13, id_14;
  wire id_15;
  assign id_9 = id_4;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input logic id_2,
    input wor id_3,
    output wire id_4,
    output wand id_5,
    input supply1 id_6,
    output logic id_7,
    output supply0 id_8,
    input supply1 id_9,
    output tri id_10,
    input wor id_11,
    output tri1 id_12,
    input tri id_13
    , id_15
);
  supply0 id_16;
  assign id_15 = 1;
  always @(negedge 1) begin : LABEL_0
    id_4 = id_16;
    if (1'b0 == id_2) id_7 <= id_2;
  end
  module_0 modCall_1 (
      id_16,
      id_10,
      id_0,
      id_5,
      id_13,
      id_3,
      id_11,
      id_9,
      id_0,
      id_16
  );
  assign modCall_1.id_5 = 0;
endmodule
