// Seed: 3881382828
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
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = id_8;
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
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_6,
      id_3,
      id_6,
      id_1,
      id_2,
      id_5,
      id_3,
      id_5
  );
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge -1) {id_5, 1} = id_5;
  parameter id_8 = -1;
endmodule
