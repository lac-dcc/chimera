// Seed: 836168454
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_4, id_5;
endmodule
module module_1 #(
    parameter id_5 = 32'd95
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_5 = 1;
  reg id_6;
  assign id_3 = id_5;
  defparam id_5.id_5 = id_5;
  initial begin : LABEL_0
    id_6 <= id_5 + 1;
  end
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_7
  );
endmodule
