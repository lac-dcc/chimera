// Seed: 3274830787
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    input wire id_6,
    input tri1 id_7,
    output uwire id_8,
    output supply1 id_9,
    output supply0 id_10,
    output supply0 id_11,
    input uwire id_12,
    input tri id_13,
    output wor id_14,
    input wand id_15,
    output supply0 id_16,
    input wor id_17,
    output tri1 id_18,
    input wand id_19,
    input uwire id_20,
    output wor id_21,
    input tri0 id_22,
    input tri1 id_23,
    input wand id_24,
    input tri0 id_25,
    input tri0 id_26,
    output tri0 id_27,
    output wor id_28
);
  wire id_30;
endmodule
module module_1 (
    output tri0 id_0,
    output tri id_1,
    input wand id_2,
    output supply1 id_3,
    input supply1 id_4,
    input wire id_5
);
  wor id_7;
  module_0(
      id_4,
      id_1,
      id_0,
      id_2,
      id_5,
      id_0,
      id_5,
      id_4,
      id_0,
      id_1,
      id_3,
      id_1,
      id_4,
      id_2,
      id_1,
      id_5,
      id_1,
      id_5,
      id_3,
      id_5,
      id_5,
      id_3,
      id_2,
      id_4,
      id_2,
      id_2,
      id_5,
      id_0,
      id_1
  ); id_8(
      id_7, $display, 1, 1, id_7
  );
  always @(*) begin
    if (id_2) disable id_9;
  end
endmodule
