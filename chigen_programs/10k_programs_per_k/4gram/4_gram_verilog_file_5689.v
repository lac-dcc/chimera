// Seed: 3014626746
module module_0 (
    input tri id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri id_3,
    output supply1 id_4,
    output wor id_5,
    output supply0 id_6,
    output wor id_7,
    input tri0 id_8,
    input wand id_9
);
  assign id_4#(
      .id_8(1),
      .id_2(1)
  ) = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    input tri1 id_6,
    input supply1 id_7,
    input tri id_8,
    input tri1 id_9,
    input tri0 id_10,
    output logic id_11,
    input uwire id_12,
    input tri1 id_13,
    output tri0 id_14,
    output wire id_15,
    input wire id_16,
    input wand id_17,
    output tri1 id_18,
    input supply0 id_19,
    input wire id_20
);
  reg id_22, id_23 = id_22 - 1;
  nand (id_18, id_8, id_12, id_19, id_22, id_17, id_5, id_13, id_4, id_16, id_7);
  always begin
    if (1) begin
      id_11 <= id_22;
    end
  end
  module_0(
      id_20, id_10, id_19, id_10, id_3, id_0, id_14, id_1, id_19, id_9
  );
  assign id_11 = 1 ? 1 : 1;
endmodule
