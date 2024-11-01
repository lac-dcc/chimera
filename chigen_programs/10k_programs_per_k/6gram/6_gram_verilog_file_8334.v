// Seed: 907220247
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wire id_7,
    output supply1 id_8,
    input tri1 id_9,
    output uwire id_10
);
  assign id_10 = 1;
  assign id_8  = id_6 == 1;
  wire id_12;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    output wor id_2,
    output tri0 id_3,
    input wire id_4,
    input tri0 id_5,
    input uwire id_6
    , id_14,
    input tri id_7,
    input supply0 id_8,
    output wire id_9,
    output wand id_10,
    input tri id_11
    , id_15,
    output supply0 id_12
);
  wire id_16;
  nand (id_12, id_16, id_15, id_8, id_5, id_1, id_6, id_7, id_11, id_4, id_14);
  module_0(
      id_6, id_5, id_5, id_5, id_1, id_1, id_11, id_4, id_0, id_11, id_12
  );
  initial begin
    $display;
  end
endmodule
