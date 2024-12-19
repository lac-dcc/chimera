// Seed: 4237870630
module module_0;
  tri id_2;
  supply1 id_3;
  always @(id_2 - id_3 or negedge 1) begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    output supply1 id_2,
    output wand id_3,
    output supply0 id_4,
    input tri id_5,
    input wor id_6
);
  wire id_8;
  wire id_9;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
endmodule
module module_2 (
    input  uwire id_0,
    output wire  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output wand  id_4,
    input  uwire id_5
);
  wire id_7;
  xnor primCall (id_1, id_2, id_3, id_5, id_7, id_8);
  supply1 id_8 = 1;
  module_0 modCall_1 ();
  assign id_4 = id_8;
  wire id_9;
  assign id_8 = 1'b0;
  id_10(
      .id_0(1'b0), .id_1(1), .id_2(id_2), .id_3(1 == 1), .id_4(1)
  );
endmodule
