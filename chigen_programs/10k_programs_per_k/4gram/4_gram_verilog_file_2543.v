// Seed: 3487832614
module module_0 #(
    parameter id_11 = 32'd49
) (
    output supply1 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input supply0 id_3
    , id_7,
    input wand id_4,
    input supply1 id_5
);
  tri  id_8  ,  id_9  ,  id_10  ,  _id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ;
  assign id_12 = 1;
  assign module_1.id_8 = 0;
  wire  [  1 'b0 :  id_11  ]  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ;
  wire id_38;
endmodule
module module_1 #(
    parameter id_1  = 32'd19,
    parameter id_10 = 32'd84,
    parameter id_12 = 32'd37,
    parameter id_15 = 32'd98,
    parameter id_17 = 32'd24
) (
    output logic id_0,
    input supply0 _id_1,
    input supply1 id_2,
    output supply1 id_3,
    output wor id_4,
    output tri0 id_5,
    output wor id_6,
    input uwire id_7,
    output wire id_8,
    input wand id_9,
    input supply0 _id_10,
    output tri1 id_11,
    output supply0 _id_12,
    input supply1 id_13,
    input wire id_14,
    output uwire _id_15,
    input uwire id_16,
    input tri _id_17,
    input tri id_18,
    input tri0 id_19,
    output tri1 id_20,
    input tri0 id_21
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_16,
      id_2,
      id_19
  );
  assign id_15 = id_9;
  logic [7:0][id_10 : 1] id_23, id_24;
  always @(posedge id_24[id_1]) id_0 <= 1;
  wire id_25;
  logic [(  id_12  ?  id_17 : "" ?  -1 : id_15  ) : -1] id_26 = -1'h0;
endmodule
