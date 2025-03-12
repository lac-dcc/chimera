// Seed: 2868258318
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output reg id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire  id_6;
  logic id_7 = -1'd0;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_6,
      id_6
  );
  always id_4 = #1 1;
  parameter id_8 = "";
  id_9 :
  assert property (@(negedge 1 + ~id_8) id_6)
  else $unsigned(52);
  ;
  localparam id_10 = id_8;
endmodule
