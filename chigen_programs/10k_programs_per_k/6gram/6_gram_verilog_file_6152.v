// Seed: 1531290521
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output wire id_2,
    input supply1 id_3,
    input uwire id_4,
    input supply1 id_5,
    output wire id_6,
    output supply0 id_7,
    input wand id_8,
    input uwire id_9,
    input wand id_10,
    input wor id_11,
    input uwire id_12,
    output tri id_13
);
  logic id_15;
  wire  id_16;
  always force id_16 = id_10;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wor id_3,
    input wand id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input uwire id_8,
    inout supply1 id_9,
    input tri1 id_10,
    output supply0 id_11,
    input supply0 id_12,
    output supply0 id_13,
    inout supply1 id_14
);
  logic id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_5,
      id_5,
      id_3,
      id_11,
      id_9,
      id_14,
      id_14,
      id_12,
      id_8,
      id_6,
      id_11
  );
  xor primCall (id_11, id_5, id_4, id_12, id_7, id_8, id_16, id_9, id_14, id_0, id_3, id_2, id_6);
endmodule
