// Seed: 2002374537
module module_0 #(
    parameter id_8 = 32'd95
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_7, _id_8;
  always $clog2(52);
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_8 = 0;
  wire id_5;
  localparam id_6 = 1 === $realtime;
endmodule
