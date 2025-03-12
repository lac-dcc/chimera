// Seed: 2255928503
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wire id_3,
    output supply1 id_4
    , id_20,
    output tri id_5,
    output uwire id_6,
    input tri0 id_7,
    input tri id_8,
    input tri1 id_9,
    input tri1 id_10,
    input tri1 id_11,
    input wire id_12,
    input uwire id_13,
    input wor id_14,
    output wire id_15
    , id_21,
    input wand id_16,
    input supply0 id_17,
    output tri0 id_18
);
  parameter id_22 = 1;
  wire  id_23;
  logic id_24;
  initial begin : LABEL_0
    id_20 <= -1;
  end
  assign #id_25 id_20 = id_12 < -1;
endmodule
module module_1 (
    output wor id_0,
    inout supply0 id_1,
    input wand id_2,
    output uwire id_3,
    input wor id_4,
    output tri0 id_5,
    input wor id_6,
    input uwire id_7,
    output tri1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_4,
      id_1,
      id_8,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_4,
      id_3,
      id_7,
      id_2,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
