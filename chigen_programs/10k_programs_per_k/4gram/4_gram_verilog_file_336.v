// Seed: 1268291228
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  assign module_1.id_1 = 0;
  assign id_3[1] = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd65,
    parameter id_3 = 32'd14
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  inout wire _id_1;
  parameter id_6 = -1'd0;
  assign id_4[1] = -1;
  assign id_2 = id_6;
  assign id_4[1] = id_6 ? id_6 : -1 ? -1 : ~id_6;
  wire [id_1 : id_3] id_7;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_4,
      id_6
  );
endmodule
