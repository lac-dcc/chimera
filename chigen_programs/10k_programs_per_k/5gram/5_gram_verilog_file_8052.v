// Seed: 3927823293
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri id_5
    , id_16,
    input wor id_6,
    output tri1 id_7,
    output supply0 id_8,
    input wor id_9,
    input wire id_10,
    input wand id_11,
    input tri id_12,
    input uwire id_13,
    input uwire id_14
    , id_17
);
  integer id_18;
  assign module_1.id_17 = 0;
  assign id_8 = id_17;
  wor  id_19;
  wire id_20;
  assign id_8 = id_19;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    output tri0 id_2,
    input wire id_3,
    input wire id_4
    , id_20,
    input logic id_5,
    output wire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input wor id_9,
    input supply1 id_10,
    output wand id_11,
    input wor id_12,
    output wor id_13,
    input uwire id_14,
    output supply1 id_15,
    input tri1 id_16,
    output wire id_17,
    input tri0 id_18
);
  always_ff @(1'b0 or posedge id_1) begin : LABEL_0
    id_0 <= id_5;
  end
  wire id_21, id_22;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_4,
      id_11,
      id_7,
      id_4,
      id_11,
      id_17,
      id_10,
      id_9,
      id_8,
      id_10,
      id_9,
      id_8
  );
  assign id_17 = 1 ? 1'b0 : id_14 << "";
endmodule
