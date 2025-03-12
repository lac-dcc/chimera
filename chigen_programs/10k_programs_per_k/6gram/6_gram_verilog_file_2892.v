// Seed: 170268959
module module_0 (
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
  output wire id_2;
  input wire id_1;
  assign id_6 = $clog2(83);
  ;
  specify
    specparam id_7 = -1;
  endspecify
  wire id_8;
endmodule
module module_1 #(
    parameter id_3 = 32'd40
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  output tri1 id_4;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_1,
      id_1,
      id_4,
      id_1
  );
  input wire _id_3;
  input wire id_2;
  output wire id_1;
  localparam id_5 = 1;
  assign id_4 = 1;
  wire [-1 : id_3] id_6;
endmodule
