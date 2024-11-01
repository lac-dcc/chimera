// Seed: 1499464562
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    output tri0 id_3,
    input wire id_4,
    output wor id_5,
    input wire id_6,
    output tri1 id_7,
    input wire id_8,
    output tri0 id_9,
    input uwire id_10,
    input supply1 id_11,
    output tri id_12,
    input tri0 id_13,
    output tri id_14,
    input wor id_15,
    output tri0 id_16,
    input tri0 id_17,
    output supply0 id_18,
    input wand id_19,
    output wand id_20,
    input supply1 id_21,
    output tri0 id_22
    , id_27,
    output uwire id_23,
    input wand id_24,
    input wand id_25
);
  assign id_27[1] = (id_8);
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output uwire id_2,
    input wire id_3,
    output tri0 id_4,
    input wand id_5,
    output wand id_6,
    input tri0 id_7,
    output wire id_8,
    output wand id_9,
    input tri0 id_10,
    input wor id_11,
    output logic id_12,
    output wand id_13,
    output uwire id_14,
    input logic id_15
);
  wire id_17;
  module_0(
      id_0,
      id_11,
      id_13,
      id_2,
      id_1,
      id_4,
      id_0,
      id_4,
      id_1,
      id_13,
      id_7,
      id_3,
      id_4,
      id_0,
      id_14,
      id_0,
      id_2,
      id_7,
      id_6,
      id_0,
      id_14,
      id_7,
      id_14,
      id_6,
      id_0,
      id_0
  );
  initial begin : id_18
    if (id_7) id_12 <= id_15;
    else cover (1'b0);
  end
endmodule
