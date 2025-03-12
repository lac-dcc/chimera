// Seed: 3976176550
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout tri1 id_1;
  assign id_1 = -1'b0;
  logic [7:0] id_4;
  assign id_4[1] = id_3;
  generate
    logic [1 : (  -1  )] id_5;
  endgenerate
  parameter id_6 = 1;
  wire id_7;
  parameter id_8 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_2;
endmodule
