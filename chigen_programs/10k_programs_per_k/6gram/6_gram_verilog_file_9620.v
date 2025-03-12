// Seed: 2773166489
module module_0 #(
    parameter id_12 = 32'd76,
    parameter id_8  = 32'd47
) (
    input tri1 id_0,
    input wire id_1,
    input wor id_2,
    input supply0 id_3,
    output supply0 id_4,
    output tri id_5
    , id_10,
    input wand id_6,
    input uwire id_7,
    output wor _id_8
);
  assign id_5 = id_2 && -1;
  wire id_11;
  wire _id_12;
  wire id_13;
  ;
  wire id_14;
  ;
  logic id_15;
  ;
  logic [id_12 : id_8  ==  1] id_16;
endmodule
module module_1 #(
    parameter id_6 = 32'd60
) (
    output uwire id_0,
    input supply0 id_1,
    output wire id_2,
    input uwire id_3,
    output wor id_4,
    output supply1 id_5,
    output tri0 _id_6
);
  wire id_8;
  logic [-1 'h0 : id_6] id_9;
  ;
  assign id_6 = id_1;
  assign id_8 = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_5,
      id_5,
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.id_8 = 0;
endmodule
