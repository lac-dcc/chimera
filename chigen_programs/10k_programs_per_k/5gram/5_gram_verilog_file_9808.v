// Seed: 3373109415
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd58
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_4
  );
  inout wire _id_1;
  assign id_2[id_1 :-1'b0] = {1'b0 > -1, 1'h0 == id_1, id_4, id_4} == 1;
  assign id_2 = id_4;
endmodule
