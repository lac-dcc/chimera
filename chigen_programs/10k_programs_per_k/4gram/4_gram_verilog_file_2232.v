// Seed: 811060422
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  assign id_2 = id_3;
  assign id_5 = id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd75
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1
  );
  wire _id_4;
  wire id_5 = id_1;
  wire id_6;
  logic [id_4 : 1] id_7;
endmodule
