// Seed: 1167449887
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1;
endmodule
module module_1 (
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
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_8,
      id_9
  );
  assign modCall_1.id_1 = 0;
  output wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_9 = id_2[-1 :-1'b0];
  integer id_10;
endmodule
