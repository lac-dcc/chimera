// Seed: 759193042
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_4 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  inout logic [7:0] id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_8;
  always begin : LABEL_0
    id_7[id_6||(id_6)] = id_5;
  end
  assign id_7 = id_8;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_8
  );
endmodule
