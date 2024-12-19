// Seed: 385035023
module module_0 #(
    parameter id_7 = 32'd38,
    parameter id_8 = 32'd6
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  assign id_1 = id_3;
  generate
    wire id_5;
  endgenerate
  wand id_6 = 1;
  defparam id_7.id_8 = 1;
  assign id_2 = 1'b0;
  module_2 modCall_1 (
      id_2,
      id_6,
      id_6
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  assign id_2 = 1'h0;
  assign id_3 = (id_4);
  assign id_5 = id_4;
endmodule
