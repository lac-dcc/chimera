// Seed: 3079416735
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
  id_3(
      .id_0(1'b0), .id_1(1 < 1)
  );
  parameter id_4 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always id_3 <= id_8 & 1;
  xnor primCall (id_3, id_8, id_2, id_7, id_6, id_1, id_4);
  assign id_1 = id_6;
  assign id_4 = id_8;
  module_0 modCall_1 (id_7);
endmodule
