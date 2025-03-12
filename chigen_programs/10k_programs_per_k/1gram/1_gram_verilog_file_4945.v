// Seed: 2736821330
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri0 id_8 = ~-1 ? -1'd0 : id_4, id_9;
  wire id_10;
  genvar id_11, id_12;
  logic [7:0] id_13, id_14, id_15;
  assign id_13[-1'b0] = id_14;
  assign id_2 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_1,
      id_6,
      id_1,
      id_2
  );
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  xor primCall (id_2, id_6, id_7, id_5, id_1, id_3, id_4);
endmodule
