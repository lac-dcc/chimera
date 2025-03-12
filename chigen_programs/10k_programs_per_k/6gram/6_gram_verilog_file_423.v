// Seed: 4038633901
module module_0 #(
    parameter id_4 = 32'd69
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire [-1 'b0 : id_4] id_5;
  wire id_6;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd90
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  inout wire _id_1;
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.id_4 = 0;
  assign id_2[id_1] = -1 ==? id_4;
endmodule
