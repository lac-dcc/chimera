// Seed: 3806903730
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  integer id_9 = $display, id_10, id_11, id_12, id_13, id_14, id_15;
  always @(posedge ~id_14 or negedge 1 - id_10 & "") id_12 = 1;
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
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_5,
      id_1,
      id_5,
      id_1
  );
  assign modCall_1.id_10 = 0;
  wire id_6;
  wire id_7;
endmodule
