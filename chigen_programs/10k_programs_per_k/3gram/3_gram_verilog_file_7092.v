// Seed: 1715344991
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
endmodule
module module_1;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_12 = 32'd46,
    parameter id_13 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire   id_9;
  wire   id_10 = 1;
  string id_11 = "";
  module_0 modCall_1 (
      id_2,
      id_3
  );
  defparam id_12.id_13 = id_12;
endmodule
