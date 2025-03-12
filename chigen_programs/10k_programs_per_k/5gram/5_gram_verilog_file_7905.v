// Seed: 1715838829
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 #(
    parameter id_7 = 32'd81
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  output logic [7:0] id_8;
  inout wire _id_7;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4
  );
  output wire id_6;
  input wire id_5;
  inout tri id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8[id_7] = id_4;
  generate
    assign id_4 = -1 & 1;
  endgenerate
endmodule
