// Seed: 436316204
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_7 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_ff id_4 <= #1 id_3 & id_1;
  assign id_2 = 1'd0;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_5,
      id_1,
      id_2,
      id_1,
      id_5
  );
  assign id_5 = | -1;
  wire id_6;
  wire id_7, id_8, id_9;
endmodule
