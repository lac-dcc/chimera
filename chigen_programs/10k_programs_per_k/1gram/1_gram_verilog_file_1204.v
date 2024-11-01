// Seed: 1704350868
module module_0 (
    input wand id_0,
    output tri id_1,
    output tri0 id_2,
    input uwire id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wand id_6,
    output wand id_7,
    input wand id_8,
    output wire id_9,
    input wor id_10
);
  initial begin
    $display;
  end
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri id_3,
    input uwire id_4,
    output tri0 id_5,
    output tri0 id_6,
    input wand id_7,
    input uwire id_8,
    input tri id_9,
    output tri1 id_10,
    input wand id_11,
    input supply1 id_12,
    input tri0 id_13,
    input tri1 id_14,
    input tri1 id_15,
    input wor id_16#(1),
    input supply0 id_17,
    input wand id_18,
    input wire id_19,
    input supply0 id_20,
    output uwire id_21,
    input wire id_22,
    output wor id_23,
    output uwire id_24,
    output logic id_25,
    input supply1 id_26,
    output wand id_27,
    input wor id_28,
    input supply0 id_29,
    output uwire id_30
);
  nand (
      id_25,
      id_20,
      id_7,
      id_13,
      id_0,
      id_15,
      id_17,
      id_9,
      id_1,
      id_19,
      id_22,
      id_16,
      id_12,
      id_29,
      id_14,
      id_18,
      id_11,
      id_4,
      id_26,
      id_2,
      id_28
  );
  module_0(
      id_8, id_24, id_5, id_11, id_10, id_22, id_8, id_21, id_4, id_30, id_8
  );
  initial @(*) id_25 <= "";
endmodule
