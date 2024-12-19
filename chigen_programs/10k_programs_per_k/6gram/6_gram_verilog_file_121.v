// Seed: 4286364493
module module_0 (
    input tri id_0,
    output tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    output uwire id_5,
    input wor id_6,
    output uwire id_7,
    output wor id_8,
    output wor id_9,
    input uwire id_10,
    input wire id_11,
    output tri id_12,
    input tri id_13,
    output wand id_14,
    output wire id_15,
    input tri1 id_16,
    output wor id_17,
    input wand id_18,
    output supply1 id_19,
    input wor id_20,
    output supply1 id_21
);
  tri0 id_23;
  assign id_23 = {1, id_13};
  assign id_5  = 1;
  id_24(
      id_3, 1 - 1'd0, id_20
  );
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input logic id_0,
    inout supply0 id_1,
    input wand id_2,
    input wand id_3,
    output wor id_4,
    output wire id_5,
    input wire id_6,
    output tri0 id_7
);
  wire id_9;
  always force id_4 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_5,
      id_6,
      id_1,
      id_7,
      id_4,
      id_1,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1,
      id_5,
      id_2,
      id_4
  );
endmodule
