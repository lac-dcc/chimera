// Seed: 1100904727
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output uwire id_2,
    input wand id_3,
    input supply1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    output uwire id_7,
    input tri0 id_8,
    input tri1 id_9,
    output wor module_0,
    output tri id_11,
    output tri1 id_12,
    input tri0 id_13,
    output wor id_14,
    output wor id_15,
    output tri id_16,
    input wor id_17,
    output wand id_18,
    input tri0 id_19,
    output tri id_20,
    input tri0 id_21
);
  id_23(
      .id_0(1), .id_1(id_21), .id_2(id_11 + 1 - 1), .id_3(1), .id_4(id_2)
  );
endmodule
module module_1 (
    output tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    output wand id_3,
    output wand id_4,
    input tri0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    input wire id_10,
    inout wand id_11,
    input tri0 id_12
);
  reg id_14;
  module_0(
      id_8,
      id_10,
      id_0,
      id_9,
      id_5,
      id_9,
      id_11,
      id_4,
      id_11,
      id_2,
      id_0,
      id_3,
      id_4,
      id_1,
      id_11,
      id_4,
      id_11,
      id_1,
      id_4,
      id_1,
      id_0,
      id_12
  );
  always @(posedge id_9) begin
    if (id_1) id_14 <= 1;
  end
endmodule
