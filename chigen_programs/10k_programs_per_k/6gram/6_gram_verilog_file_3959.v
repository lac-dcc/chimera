// Seed: 2856973326
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input supply0 id_2,
    input supply0 id_3,
    output supply1 id_4
);
  assign id_4 = 1 == id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd37,
    parameter id_7 = 32'd28
) (
    output wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri0 id_3,
    output supply1 id_4
);
  defparam id_6.id_7 = id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.type_9 = 0;
endmodule
module module_2 #(
    parameter id_14 = 32'd17,
    parameter id_15 = 32'd46
) (
    input  tri  id_0,
    input  wire id_1,
    inout  tri  id_2,
    input  tri0 id_3,
    output tri0 id_4
);
  logic [7:0] id_6;
  wire id_7;
  tri0 id_8;
  id_9(
      .id_0(id_2), .id_1(|id_6[""]), .id_2(1), .id_3(id_4), .id_4(id_2), .id_5(id_7)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.type_9 = 0;
  wand id_10 = 1;
  assign id_8 = 1;
  wire id_11;
  wire id_12;
  assign id_4 = 1'b0 ? id_8 : 1 & id_1 ? id_8 : 1 ? id_8 : "" ? 1 : id_1;
  wire id_13;
  defparam id_14.id_15 = (1);
endmodule
