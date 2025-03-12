// Seed: 1990573013
module module_0 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2[-1] = id_2.sum;
endmodule
module module_1 #(
    parameter id_2 = 32'd75,
    parameter id_7 = 32'd50,
    parameter id_8 = 32'd79
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9
);
  output wire id_9;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  inout wire _id_8;
  inout wire _id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  inout reg id_3;
  inout wire _id_2;
  inout wire id_1;
  always_latch id_3 = id_4;
  assign id_4 = id_7;
  logic [~  1 : id_2] id_10;
  ;
  assign id_9 = id_5[id_7 : id_8];
endmodule
