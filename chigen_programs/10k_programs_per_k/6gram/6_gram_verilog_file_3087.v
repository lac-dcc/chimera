// Seed: 1848071511
module module_0 #(
    parameter id_5 = 32'd70,
    parameter id_6 = 32'd83
) (
    input uwire id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3
);
  generate
    if (1) assign id_2 = 1;
    else begin : LABEL_0
      defparam id_5.id_6 = 1; id_7(
          .id_0(id_1), .id_1(1), .id_2(1), .id_3(id_3), .id_4(id_8[1] - 1)
      );
    end
  endgenerate
endmodule
module module_1 (
    input  wand id_0,
    input  tri0 id_1,
    input  tri  id_2,
    output tri0 id_3
);
  assign id_3 = id_1 == id_2;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
  wire id_5;
endmodule
