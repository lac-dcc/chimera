// Seed: 3558697878
module module_0 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2[-1] = 1 - id_2;
  wire id_3;
endmodule
module module_1 #(
    parameter id_4 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  inout logic [7:0] id_3;
  output wand id_2;
  output wire id_1;
  parameter id_5 = 1 & ~1;
  buf primCall (id_3, id_5);
  module_0 modCall_1 (
      id_5,
      id_3
  );
  assign id_1 = id_3[-1'b0-id_4];
  assign id_2 = 1;
endmodule
