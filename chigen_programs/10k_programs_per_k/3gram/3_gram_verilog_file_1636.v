// Seed: 937709792
module module_0;
  always @(posedge 1'b0) begin : LABEL_0
    id_1 = 1;
  end
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    output supply1 id_4
    , id_13,
    output supply0 id_5,
    input wor id_6,
    output wire id_7,
    input uwire id_8,
    input tri0 id_9,
    output wand id_10,
    input tri0 id_11
);
  wire id_14;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  wire id_0,
    input  wor  id_1,
    output wor  id_2,
    input  tri0 id_3
);
  genvar id_5;
  assign id_2 = id_0;
  wire id_6;
  assign id_2 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wor id_7 = id_1;
  assign id_2 = 1;
  always_comb @(*);
  wire id_8;
  id_9(
      .id_0({1, 1 + 1 - 1}), .id_1(1), .id_2(id_0)
  );
  wire id_10;
endmodule
