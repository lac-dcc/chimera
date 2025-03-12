// Seed: 2927245266
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
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_9;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output reg id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4
  );
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always id_5 <= #1 id_4 * -1 * 1 * id_3;
endmodule
