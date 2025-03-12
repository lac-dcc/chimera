// Seed: 2352432083
module module_0 #(
    parameter id_2 = 32'd63,
    parameter id_4 = 32'd18
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  assign module_1.id_4 = 0;
  input wire id_6;
  output wire id_5;
  inout wire _id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  uwire [id_2 : id_4] id_8 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd48
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  parameter id_3 = -1'b0;
  wire _id_4;
  wire [id_4 : -1] id_5;
  assign id_2 = id_3;
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_4,
      id_1,
      id_2,
      id_3
  );
  static logic [-1 : ""] id_6;
  ;
endmodule
