// Seed: 1581888530
module module_0 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input uwire id_3,
    output uwire id_4,
    input tri id_5,
    output wand id_6,
    input wire id_7,
    input uwire id_8,
    input uwire id_9
    , id_23,
    input supply0 id_10,
    input tri id_11,
    input tri id_12,
    input supply1 id_13,
    output wire id_14,
    output wire id_15,
    output tri1 id_16,
    output supply1 id_17,
    input wor id_18,
    output supply0 id_19,
    input supply1 id_20,
    input wand id_21
);
  assign id_4 = 1'b0 < id_12;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output supply1 id_2
    , id_10,
    input tri1 id_3,
    output logic id_4,
    input wor id_5,
    input logic id_6,
    output wand id_7,
    input wire id_8
);
  wire id_11;
  always @(1) begin : LABEL_0
    id_4 <= id_6;
  end
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_1,
      id_3,
      id_7,
      id_8,
      id_7,
      id_8,
      id_5,
      id_8,
      id_1,
      id_0,
      id_5,
      id_8,
      id_7,
      id_7,
      id_2,
      id_7,
      id_8,
      id_7,
      id_5,
      id_1
  );
endmodule
