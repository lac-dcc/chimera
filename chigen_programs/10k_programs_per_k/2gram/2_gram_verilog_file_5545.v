// Seed: 1556320900
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_1.id_2 = 0;
  parameter id_5 = 1, id_6 = id_4;
endmodule
module module_1 #(
    parameter id_2 = 32'd96,
    parameter id_3 = 32'd67
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1,
      id_1
  );
  input wire _id_2;
  inout wire id_1;
  wire [id_3 : id_2] id_6;
endmodule
