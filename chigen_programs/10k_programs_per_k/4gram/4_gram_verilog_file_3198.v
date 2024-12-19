// Seed: 3120709248
module module_0 #(
    parameter id_2 = 32'd13,
    parameter id_3 = 32'd57
) ();
  id_1(
      .id_0(1), .id_1(1)
  ); defparam id_2.id_3 = id_3;
  assign module_1.type_0 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd71,
    parameter id_8 = 32'd32
) (
    input  tri1  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  wire  id_3,
    input  wire  id_4
);
  wand id_6;
  defparam id_7.id_8 = id_7;
  or primCall (id_2, id_3, id_4, id_6, id_7, id_8, id_9);
  tri0 id_9;
  initial begin : LABEL_0
    if (id_6(id_6)) begin : LABEL_0
      id_2 = id_9;
    end
  end
  module_0 modCall_1 ();
endmodule
