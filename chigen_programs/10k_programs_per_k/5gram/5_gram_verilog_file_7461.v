// Seed: 2535218982
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd22
) (
    id_1,
    id_2
);
  inout wire id_2;
  input logic [7:0] id_1;
  logic [-1 : 1] _id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign id_3 = id_3;
  logic id_4 = id_1[1==id_3 : 1] & id_1;
endmodule
