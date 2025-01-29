// Seed: 3191363328
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wor id_5,
    input tri1 id_6,
    output wor id_7,
    input uwire id_8,
    input wor id_9,
    input uwire id_10,
    input wire id_11,
    input uwire id_12,
    input tri id_13,
    input supply1 id_14,
    output supply0 id_15,
    output wor id_16
);
  assign module_1.type_0 = 0;
  always id_15 = id_1;
  assign #1 id_7 = id_10;
  wire id_18;
  assign id_15 = 1;
  assign id_15 = id_1;
  assign id_7  = id_4;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input tri1 id_2,
    input logic id_3,
    output logic id_4,
    input uwire id_5,
    input wand id_6,
    input supply1 id_7,
    input tri id_8
);
  initial begin : LABEL_0
    id_4 <= id_3;
    id_4 <= -1'b0 >> id_5;
  end
  assign id_4 = -1'b0;
  tri id_10 = id_6;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_1,
      id_8,
      id_8,
      id_5,
      id_6,
      id_10,
      id_10,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_8,
      id_10,
      id_0
  );
endmodule
