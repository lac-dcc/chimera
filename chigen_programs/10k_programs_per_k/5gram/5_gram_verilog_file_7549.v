// Seed: 3024158404
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
  nor primCall (id_2, id_6, id_5);
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_3;
  logic [7:0] id_4 = id_4[1];
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3
  );
  wire id_5, id_6, id_7, id_8;
  tri1 id_9 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_5 !== id_3#(1) == id_4;
endmodule
