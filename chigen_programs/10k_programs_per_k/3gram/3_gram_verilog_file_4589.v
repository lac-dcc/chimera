// Seed: 16144456
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
  id_11(
      1'd0, &1'b0, 1, 1'b0 & id_5, 1
  );
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
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  final $display;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_7,
      id_3,
      id_7,
      id_3,
      id_6,
      id_1,
      id_3,
      id_3
  );
  assign id_2[1] = id_6;
endmodule
