// Seed: 687277775
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
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_7;
  wire  id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd16
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire _id_1;
  localparam [-1 : id_1] id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_4
  );
  assign id_2 = id_6;
endmodule
