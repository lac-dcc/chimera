// Seed: 2201482548
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  generate
    wire id_4;
  endgenerate
  assign id_2 = (1);
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4[1'd0] = 1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
  assign id_2 = id_1 ? id_1 : 1;
  final $display(id_2, id_1);
endmodule
