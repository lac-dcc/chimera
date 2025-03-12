// Seed: 3440064953
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_2 = id_1[(-1'b0)];
endmodule
module module_1 #(
    parameter id_3 = 32'd59
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  input wire _id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  parameter id_5 = 1;
  supply1 id_6;
  module_0 modCall_1 (
      id_1,
      id_5
  );
  logic id_7;
  assign id_6 = -1'b0;
  initial id_1[id_3] <= #1 id_4 >> 1 - 1;
endmodule
