// Seed: 3103931607
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output wor id_5,
    input wire id_6,
    output wand id_7,
    output supply1 id_8,
    input tri id_9,
    input wor id_10,
    input tri1 id_11,
    input tri id_12,
    input wand id_13,
    input supply1 id_14,
    input wand id_15,
    output wire id_16
);
  assign id_3 = id_14;
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    output wire  id_1,
    input  logic id_2,
    input  logic id_3
);
  reg id_5;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
  reg   id_6;
  logic id_7 = id_3;
  initial begin : LABEL_0
    id_6 <= id_2 * 1 - 1;
    id_7 <= #1 id_2;
    if (id_0) id_1 = {1, $display};
    id_7 <= id_2;
    id_5 <= 1 - id_2 == id_7;
  end
endmodule
