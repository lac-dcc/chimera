// Seed: 1973019932
module module_0 (
    output wire id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    input wand id_4,
    output wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    output supply1 id_8,
    input wor id_9,
    input wire id_10
);
  wire  module_0;
  logic id_12;
  parameter id_13 = 1;
  assign id_5 = id_10;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    output wor id_3,
    input wor id_4,
    input uwire id_5,
    output uwire id_6,
    inout tri id_7,
    input tri id_8,
    output supply1 id_9,
    input wire id_10,
    output wire id_11,
    input tri1 id_12,
    input supply1 id_13,
    output tri1 id_14
);
  logic id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_5,
      id_1,
      id_3,
      id_8,
      id_4,
      id_14,
      id_8,
      id_12
  );
  assign id_0#(
      .id_7 (-1),
      .id_13(1 ==? 1'b0),
      .id_5 (1),
      .id_16(-1),
      .id_4 (1),
      .id_12(1)
  ) = id_1;
  nor primCall (id_3, id_16, id_8, id_5, id_1, id_10, id_7, id_4, id_13);
endmodule
