// Seed: 4283161504
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd29,
    parameter id_8 = 32'd0
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_3,
      id_3,
      id_3,
      id_5
  );
  input wire id_2;
  output logic [7:0] id_1;
  wire id_6;
  wire [-1  >=  1 : id_4] id_7;
  parameter id_8 = 1;
  assign id_1[id_8==-1] = id_6;
endmodule
