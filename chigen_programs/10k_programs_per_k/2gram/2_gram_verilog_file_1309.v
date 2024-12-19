// Seed: 723215618
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_2 modCall_1 (id_3);
  assign modCall_1.type_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
  assign id_2 = 1'h0;
  wire id_4;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  wand id_3 = 1'h0;
endmodule
