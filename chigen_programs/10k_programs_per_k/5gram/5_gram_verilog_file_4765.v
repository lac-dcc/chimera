// Seed: 1667671713
module module_0 (
    input tri id_0
    , id_12,
    input supply1 id_1,
    input wor id_2,
    output wor id_3
    , id_13,
    input supply1 id_4,
    input uwire id_5,
    output wor id_6,
    input uwire id_7,
    output wire id_8
    , id_14,
    input wand id_9
    , id_15,
    input tri id_10
);
  assign id_15 = id_5;
  wire id_16;
  supply1 id_17 = id_4;
  assign id_13 = id_4 == 1;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wand id_3,
    input logic id_4,
    output wire id_5,
    output logic id_6,
    input wire id_7
);
  wire id_9;
  initial begin
    id_6 <= id_4;
  end
  nand (id_6, id_7, id_3, id_2, id_0);
  module_0(
      id_3, id_1, id_1, id_5, id_3, id_3, id_5, id_1, id_5, id_2, id_1
  );
  tri id_10 = id_1;
endmodule
