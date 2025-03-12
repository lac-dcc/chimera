// Seed: 1565913009
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3[-1] = ((1'b0) & 1);
endmodule
module module_1 #(
    parameter id_4 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  input wire _id_4;
  inout wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign id_1[id_4] = 1;
endmodule
