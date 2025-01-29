// Seed: 1763578202
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = id_4;
  module_2 modCall_1 (
      id_4,
      id_6
  );
endmodule
module module_1 ();
  wire id_1, id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_8 = 32'd4,
    parameter id_9 = 32'd33
) (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1'd0;
  tri1 id_3, id_4, id_5;
  parameter id_6 = -1'h0;
  assign id_4 = id_6;
  parameter id_7 = id_6;
  defparam id_8 = -1, id_9 = -1;
endmodule
