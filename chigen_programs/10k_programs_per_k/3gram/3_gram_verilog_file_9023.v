// Seed: 3888786705
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  tri0 id_3;
  tri1 id_4 = !id_3 && 1 && 1 && 1'b0 && 1 && id_4;
endmodule
module module_1 #(
    parameter id_10 = 32'd26,
    parameter id_9  = 32'd59
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
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  defparam id_9.id_10 = 1; id_11(
      .id_0(1), .id_1(id_7), .id_2(1)
  );
  wire id_12;
  module_0 modCall_1 (
      id_8,
      id_4
  );
  assign modCall_1.id_4 = 0;
  wire id_13;
  or primCall (id_4, id_11, id_1, id_3, id_12, id_10, id_2, id_7, id_8, id_9);
  wire id_14;
endmodule
