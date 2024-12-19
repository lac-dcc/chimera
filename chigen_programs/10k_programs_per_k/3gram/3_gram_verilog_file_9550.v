// Seed: 2205626875
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input wire id_2,
    output wire id_3,
    input supply1 id_4,
    output tri1 id_5,
    output tri1 id_6
    , id_8
);
  assign id_5 = id_8;
  always
    for (id_3 = 1'b0; 1; id_3 = 1) begin : LABEL_0
      id_5 = 1;
      `define pp_9 0
    end
  wire id_10;
  wire id_11;
  wire id_12;
  logic [7:0] id_13;
  wire id_14 = id_13[(1)];
endmodule
module module_1 (
    output tri id_0,
    output uwire id_1,
    output wand id_2,
    input wire id_3,
    input uwire id_4,
    output logic id_5,
    input uwire id_6,
    output uwire id_7,
    output tri1 id_8,
    output wor id_9,
    input logic id_10,
    input tri0 id_11,
    input uwire id_12,
    input uwire id_13,
    output wire id_14,
    input wand id_15,
    input supply1 id_16,
    output wand id_17,
    input supply1 id_18,
    output supply1 id_19,
    input tri id_20
);
  assign id_5 = 1'b0;
  always @(id_3 | 1 or id_13) id_5 = #1 id_10;
  module_0 modCall_1 (
      id_20,
      id_15,
      id_18,
      id_8,
      id_3,
      id_8,
      id_14
  );
  assign modCall_1.type_3 = 0;
endmodule
