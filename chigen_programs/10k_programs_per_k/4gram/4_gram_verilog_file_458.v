// Seed: 1273923096
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign id_1 = 1'h0;
  assign module_2.id_4 = 0;
  wire id_4;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  wire id_3;
  id_4(
      .id_0({id_2{id_3}}), .id_1(1)
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd86,
    parameter id_5 = 32'd0
) (
    output wor id_0,
    input  wor id_1
);
  generate
    wire id_3;
    defparam id_4.id_5 = id_5;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
endmodule
