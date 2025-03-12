// Seed: 211582415
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output uwire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd13,
    parameter id_7 = 32'd26
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_5,
      id_2
  );
  input wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire _id_1;
  localparam id_7 = 1'b0;
  wire id_8;
  nor primCall (id_2, id_4, id_3);
  logic [id_7 : 1] id_9;
endmodule
