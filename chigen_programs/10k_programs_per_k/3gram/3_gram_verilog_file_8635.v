// Seed: 1835614597
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_10;
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output reg id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  always @("") @(1 - id_1) id_2 <= -1'b0;
endmodule
