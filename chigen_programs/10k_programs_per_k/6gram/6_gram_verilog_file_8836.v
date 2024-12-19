// Seed: 3116410046
module module_0 #(
    parameter id_6 = 32'd36,
    parameter id_7 = 32'd58
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  assign id_4 = id_1;
  assign id_4 = 1;
  defparam id_6.id_7 = "";
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  id_6(
      .id_0(id_4), .id_1(1), .id_2(!id_1), .id_3(id_2)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
  wire id_7;
  assign id_2[1] = 1'b0 ? 1'b0 : 1'd0;
  id_8(
      .id_0(id_4),
      .id_1(1),
      .id_2(id_3),
      .id_3(1),
      .id_4(id_1),
      .id_5(1),
      .id_6(id_3),
      .id_7(id_4),
      .id_8(1)
  );
endmodule
