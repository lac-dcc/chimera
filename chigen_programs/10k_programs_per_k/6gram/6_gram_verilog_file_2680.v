// Seed: 880855867
module module_0 #(
    parameter id_7 = 32'd95,
    parameter id_8 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_1;
  defparam id_7.id_8 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2
  );
  buf primCall (id_2, id_3);
  assign id_4[1'd0] = id_3;
  assign id_1 = id_4;
endmodule
