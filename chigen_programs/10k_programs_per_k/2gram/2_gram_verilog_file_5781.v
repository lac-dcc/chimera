// Seed: 1444517525
module module_0 (
    input supply1 id_0,
    output wor id_1,
    input tri id_2,
    output supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    output wire id_6,
    input supply0 id_7,
    input tri id_8,
    output uwire id_9
    , id_15,
    output tri0 id_10,
    input wand id_11,
    input tri0 id_12,
    output wand id_13
);
endmodule
module module_1 #(
    parameter id_39 = 32'd57,
    parameter id_40 = 32'd24
) (
    output tri0 id_0,
    input  wire id_1
);
  wire id_3;
  wire id_4;
  wire id_5 = 1'b0;
  wor id_6;
  logic [7:0] id_7;
  wire id_8, id_9;
  assign id_3 = 1'b0 ? id_7[1] : id_5;
  tri0 id_10;
  wire id_11;
  assign id_10 = id_6;
  wire id_12;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0
  );
  supply1  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  =  1  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ;
  wire id_36;
  wire id_37;
  assign id_28.id_5 = 1;
  wire id_38;
  assign id_27 = id_24;
  defparam id_39.id_40 = 1;
  wire id_41;
  assign id_16 = 1'h0;
  assign #id_42 id_15 = id_35 & id_6;
endmodule
