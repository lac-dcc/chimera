// Seed: 1592078953
module module_0 (
    input tri0 id_0,
    input wand id_1,
    id_11,
    output wire id_2,
    output wor id_3,
    output wor id_4,
    output supply0 id_5,
    output wor id_6,
    input wor id_7,
    output tri0 id_8,
    input tri0 id_9
);
  wire id_12, id_13;
  assign id_8 = -1;
  genvar id_14;
  assign {-1'd0, 1} = id_7;
  wire id_15;
  timeprecision 1ps;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output tri0 id_2,
    input wor id_3,
    input wor id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    inout logic id_8,
    id_11,
    id_12,
    input logic id_9
);
  always begin : LABEL_0
    id_8 <= id_6 || -1'b0;
  end
  module_0 modCall_1 (
      id_5,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_7,
      id_2,
      id_0
  );
  assign modCall_1.type_17 = 0;
  assign id_11 = id_9;
  wire id_13;
  tri1 id_14 = id_14 && -1;
  assign id_11 = id_8;
  assign id_2  = 1;
endmodule
