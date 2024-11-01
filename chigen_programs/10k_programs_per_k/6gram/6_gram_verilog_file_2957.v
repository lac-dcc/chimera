// Seed: 2775160527
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wor id_3,
    input wire id_4,
    input tri0 id_5,
    input tri module_0,
    inout wand id_7,
    input wor id_8,
    input wand id_9,
    input tri1 id_10,
    output tri id_11,
    output uwire id_12,
    output wand id_13
);
  wire id_15;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    output logic id_3,
    input wand id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wire id_8,
    input wand id_9,
    input tri id_10,
    input uwire id_11,
    input uwire id_12,
    input wor id_13,
    input logic id_14,
    output wor id_15,
    output uwire id_16,
    output tri id_17,
    output wor id_18
);
  tri1 id_20;
  wire id_21;
  xor (id_15, id_11, id_10, id_9, id_14, id_21, id_2, id_6, id_0, id_8, id_12, id_1);
  assign id_17 = id_20;
  module_0(
      id_18, id_13, id_18, id_8, id_2, id_8, id_6, id_20, id_0, id_20, id_12, id_15, id_18, id_20
  );
  tri id_22 = id_7;
  always @((id_11) or negedge 1) begin
    id_3 <= id_14;
  end
endmodule
