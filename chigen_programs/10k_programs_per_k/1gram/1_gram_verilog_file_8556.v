// Seed: 3779004899
module module_0;
  assign module_2.type_7 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd13
) (
    output supply0 id_0,
    output wire id_1,
    input tri0 id_2,
    output tri id_3,
    input wand id_4,
    input tri0 id_5,
    input uwire id_6,
    input wand id_7
);
  generate
    supply0 id_9, id_10, id_11, id_12, id_13 = 1;
  endgenerate
  defparam id_14 = 1;
  module_0 modCall_1 ();
  id_15(
      .id_0(id_9)
  );
  tri1 id_16 = 1, id_17;
endmodule
module module_2;
  wire id_1;
  logic [7:0] id_2;
  tri0 id_3;
  id_4(
      1, 1'b0, id_3, id_2[1 : 1]
  );
  module_0 modCall_1 ();
endmodule
