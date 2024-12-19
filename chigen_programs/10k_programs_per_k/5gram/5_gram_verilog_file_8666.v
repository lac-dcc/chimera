// Seed: 3590191659
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3 == id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
  wire id_4;
endmodule
module module_2 #(
    parameter id_5 = 32'd85,
    parameter id_6 = 32'd89
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_5.id_6 = 1'b0 ==? 1'b0;
  wire id_7;
  tri1 id_8 = 1;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_2
  );
endmodule
