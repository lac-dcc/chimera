// Seed: 393379308
module module_0 (
    input tri0 id_0
);
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    input supply1 id_2,
    output logic id_3,
    input wand id_4,
    input supply1 id_5
    , id_20, id_21, id_22,
    output logic id_6,
    input wor id_7,
    input wire id_8,
    input wand id_9,
    output tri id_10,
    input uwire id_11,
    input uwire id_12,
    output wor id_13,
    output wor id_14,
    input uwire id_15,
    input supply0 id_16,
    output supply1 id_17,
    input tri id_18
);
  wor id_23;
  module_0(
      id_2
  );
  always_comb begin
    id_20[1] <= ~((id_15));
    id_3 <= #1 id_23 - 1;
    id_20 = id_20;
    id_6 <= id_0;
  end
  nand (id_17, id_16, id_8, id_22, id_9, id_12, id_4, id_11, id_7, id_15, id_1, id_20, id_23);
endmodule
