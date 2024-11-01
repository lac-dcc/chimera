// Seed: 3447766901
module module_0 #(
    parameter id_6 = 32'd99,
    parameter id_7 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_5(
      .id_0(id_3), .id_1(1), .id_2(~id_4), .id_3(1'b0), .id_4(id_1), .id_5(1)
  ); defparam id_6.id_7 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_3;
  xor (id_4, id_1, id_2, id_3);
  module_0(
      id_4, id_4, id_5, id_4
  );
endmodule
