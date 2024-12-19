// Seed: 3925211900
module module_0 #(
    parameter id_5 = 32'd35,
    parameter id_6 = 32'd47
) (
    output supply0 id_0
    , id_3,
    input wand id_1
);
  always @(*) begin : LABEL_0
    assume (id_3);
  end
  wire id_4 = id_4 == 1;
  defparam id_5.id_6 = 1'b0;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    input  tri1  id_2,
    output wand  id_3,
    input  wand  id_4,
    input  tri1  id_5,
    output wand  id_6,
    input  tri1  id_7,
    input  logic id_8,
    input  tri1  id_9,
    output tri1  id_10
);
  always force id_1 = id_8;
  nor primCall (id_3, id_2, id_8, id_5, id_4, id_9, id_0);
  module_0 modCall_1 (
      id_3,
      id_7
  );
  assign modCall_1.id_1 = 0;
endmodule
