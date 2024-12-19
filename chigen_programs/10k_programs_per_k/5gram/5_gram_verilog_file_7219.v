// Seed: 700740739
module module_0 #(
    parameter id_4 = 32'd27,
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_4.id_5 = 1;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  tri0 id_5;
  assign id_5 = 1;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5
  );
  assign modCall_1.id_5 = 0;
  assign (strong1, strong0) id_8 = id_3;
  wire id_11;
endmodule
