// Seed: 1374682320
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  localparam id_7 = 1;
  assign id_5 = id_1;
  wire id_8;
  parameter id_9 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_1
  );
  assign id_6 = id_2;
  wire [-1 'b0 : -1] id_7;
endmodule
