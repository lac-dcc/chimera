// Seed: 3074389585
module module_0 (
    input tri id_0,
    input wand id_1,
    input wand id_2,
    output supply0 id_3,
    input wor id_4,
    input tri id_5,
    input wor id_6,
    output uwire id_7,
    output tri id_8,
    output supply1 id_9,
    output supply0 id_10,
    output wand id_11
    , id_17,
    input wand id_12,
    output wand id_13,
    input wire id_14,
    output wire id_15
);
  wire id_18;
endmodule
module module_1 (
    input wand id_0
    , id_16,
    input wand id_1,
    output supply1 id_2,
    input logic id_3,
    input wire id_4,
    input supply0 id_5,
    output tri1 id_6,
    output tri id_7,
    output logic id_8,
    output tri id_9,
    output tri1 id_10
    , id_17,
    output wand id_11,
    input supply0 id_12,
    output wire id_13,
    input tri1 id_14
);
  tri1 id_18;
  supply0 id_19 = {id_18, id_14};
  wire id_20;
  wire id_21;
  wire id_22;
  module_0(
      id_14,
      id_4,
      id_1,
      id_2,
      id_14,
      id_0,
      id_4,
      id_11,
      id_18,
      id_13,
      id_9,
      id_7,
      id_14,
      id_9,
      id_0,
      id_10
  );
  always_ff @(posedge 1) begin
    if (id_5) begin
      id_17 = id_16;
      id_8 <= (id_3);
    end
  end
  nand (
      id_10, id_22, id_17, id_18, id_5, id_19, id_4, id_3, id_14, id_12, id_21, id_20, id_0, id_1
  );
endmodule
