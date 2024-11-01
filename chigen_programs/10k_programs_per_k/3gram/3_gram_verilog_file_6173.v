// Seed: 816329899
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    input wire id_3,
    output wire id_4,
    input supply1 id_5,
    output tri id_6,
    input tri id_7,
    input tri id_8,
    output wand id_9,
    input supply0 id_10,
    input wand id_11,
    input wor id_12,
    input wire id_13,
    input wire id_14,
    output tri0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input supply0 id_18,
    input uwire id_19
);
  always @(*) begin
    release id_4;
  end
  assign id_15 = id_19;
  assign id_9  = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    input wor id_4,
    output wand id_5,
    output wand id_6,
    output tri1 id_7,
    input uwire id_8,
    input supply1 id_9,
    input wire id_10,
    input wand id_11
    , id_17,
    input wor id_12,
    input wire id_13,
    output supply0 id_14,
    output wor id_15
);
  wire id_18 = id_8;
  xor (id_15, id_3, id_17, id_13, id_0, id_8, id_11, id_10);
  module_0(
      id_4,
      id_11,
      id_18,
      id_4,
      id_2,
      id_13,
      id_6,
      id_10,
      id_11,
      id_18,
      id_10,
      id_4,
      id_8,
      id_12,
      id_10,
      id_1,
      id_3,
      id_18,
      id_8,
      id_4
  );
endmodule
