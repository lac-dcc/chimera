// Seed: 2649416298
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always begin : LABEL_0
    if (id_6 & id_9) id_10 <= id_7;
    else id_10 <= 1;
  end
  assign id_1 = 1 * 1;
  wire id_11;
  assign id_4 = 1;
  wire id_12;
  assign id_10 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_7 = id_6;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_6,
      id_10,
      id_2,
      id_6
  );
  wire id_11;
  always begin : LABEL_0
    id_5 <= id_6;
  end
  assign id_6 = id_10 * 1;
  nand primCall (id_10, id_9, id_6, id_2, id_5, id_1, id_4);
endmodule
