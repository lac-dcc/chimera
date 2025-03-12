// Seed: 789497360
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_6 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd91,
    parameter id_6 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6
);
  inout wire _id_6;
  output wire _id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_3,
      id_3
  );
  inout wire id_1;
  assign id_1 = id_4;
  logic [id_6 : id_5] id_7;
  ;
endmodule
