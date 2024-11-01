// Seed: 3283241414
module module_0 (
    input tri1 id_0,
    output wor id_1,
    output tri0 id_2,
    input supply0 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri id_6,
    output tri id_7,
    input wire id_8,
    output wire id_9,
    input wire id_10,
    input supply0 id_11,
    output wand id_12,
    input tri1 id_13,
    input tri0 id_14,
    input uwire id_15,
    input wand id_16
    , id_22,
    input wand id_17,
    output wire id_18,
    input wand id_19,
    output wand id_20
);
  wire id_23;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    output supply1 id_2,
    output tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input uwire id_6
    , id_11,
    input uwire id_7,
    input supply0 id_8,
    output supply1 id_9
);
  assign id_2 = id_8;
  module_0(
      id_0,
      id_3,
      id_2,
      id_7,
      id_7,
      id_1,
      id_8,
      id_9,
      id_0,
      id_2,
      id_1,
      id_8,
      id_9,
      id_0,
      id_4,
      id_4,
      id_7,
      id_7,
      id_2,
      id_1,
      id_3
  );
  supply1 id_12;
  always_comb @(1 != id_12 or posedge id_11) begin
    id_3 = id_1 == 1;
  end
  wire id_13;
endmodule
