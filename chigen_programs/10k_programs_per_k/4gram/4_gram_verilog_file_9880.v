// Seed: 2511725161
module module_0 #(
    parameter id_34 = 32'd93,
    parameter id_35 = 32'd35
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  tri  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ;
  defparam id_34.id_35 = id_18;
endmodule
module module_0 (
    input  tri0 id_0,
    input  tri0 id_1
    , id_4,
    output wand id_2
);
  static integer id_5;
  wire module_1;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  assign modCall_1.id_27 = 0;
  id_7(
      .id_0(id_6[1]), .id_1(id_2)
  );
  always @* begin : LABEL_0
    id_7 = (~id_1);
  end
endmodule
