// Seed: 2181547484
macromodule module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  bit id_3;
  always
  fork
    id_3 <= -1;
    @(1'd0) id_3 <= -1;
    id_3 = -1;
    id_3 <= id_3;
  join
  assign id_3 = 1'b0;
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
  output wire id_5;
  input logic [7:0] id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  parameter id_8 = 1;
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_8,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
