// Seed: 1362817796
module module_0 #(
    parameter id_7 = 32'd42,
    parameter id_8 = 32'd54,
    parameter id_9 = 32'd44
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_1.id_1 = 0;
  defparam id_7#(
      .id_8(1'b0)
  ).id_9 = (id_4 == 1'b0);
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
