// Seed: 2094615618
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  assign module_2.id_5 = 0;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  tri id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd95
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
  wire _id_4;
  logic [-1 : 1 'b0] id_5 = 1 || id_2[id_4];
endmodule
