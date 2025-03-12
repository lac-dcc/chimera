// Seed: 899045966
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  assign module_1.id_1 = 0;
  logic [-1 'h0 : 1] id_6;
  parameter id_7 = 1;
  assign id_1 = id_4;
  wire id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd49
) (
    _id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire _id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2
  );
  tri [id_1 : -1] id_4 = -1;
  wire id_5 = id_5;
  initial begin : LABEL_0
    return id_4;
  end
endmodule
