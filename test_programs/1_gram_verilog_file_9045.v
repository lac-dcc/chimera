// Seed: 4263190261
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  parameter id_3 = -1;
  assign module_1.id_2 = 0;
endmodule
module module_1 ();
  assign id_1 = -1;
  assign id_2 = id_1 + 1'b0;
  localparam id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  wire id_4;
  tri0 id_5, id_6, id_7 = -1;
endmodule
module module_2 (
    input wand id_0,
    input wor  id_1,
    input tri  id_2
);
  assign id_4 = (1);
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
module module_3 #(
    parameter id_3 = 32'd83,
    parameter id_4 = 32'd64,
    parameter id_5 = 32'd67,
    parameter id_6 = 32'd97,
    parameter id_7 = 32'd0
) ();
  wand id_1;
  assign id_2 = id_1;
  defparam id_3 = id_3, id_4 = id_4, id_5 = id_1 < 1, id_6 = 1, id_7 = 1'b0;
endmodule
module module_4 #(
    parameter id_6 = 32'd11
) (
    input tri0 id_0
);
  id_2 :
  assert property (@(negedge -1) id_0) id_3 <= 1;
  wor id_4, id_5;
  module_3 modCall_1 ();
  assign modCall_1.id_5 = 0;
  defparam id_6 = id_5;
endmodule
