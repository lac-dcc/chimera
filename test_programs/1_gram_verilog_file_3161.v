// Seed: 2653653748
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  assign id_3 = 1 | id_1 & -1;
  wor id_8, id_9;
  assign id_5 = -1;
  assign id_5 = id_8;
  assign id_8 = id_3;
  wire id_10;
  logic [7:0] id_11, id_12;
  assign module_1.type_7 = 0;
  localparam id_13 = id_11[-1'b0];
  tri0 id_14 = id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5 = id_5;
  nor primCall (id_4, id_3, id_6, id_5);
  reg id_6;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_4,
      id_1,
      id_4
  );
  initial id_2 <= #id_5 id_6;
endmodule
