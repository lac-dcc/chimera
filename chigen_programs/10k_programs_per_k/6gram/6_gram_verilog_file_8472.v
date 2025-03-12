// Seed: 4234857036
module module_0 #(
    parameter id_28 = 32'd7
) (
    input tri0 id_0,
    output supply1 id_1
    , id_27,
    input tri1 id_2,
    input uwire id_3,
    output tri0 id_4,
    input uwire id_5,
    input tri0 id_6,
    input wor id_7,
    output supply1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    input uwire id_11,
    output tri id_12,
    input tri1 id_13,
    output supply1 id_14,
    output supply1 id_15,
    output supply1 id_16,
    output wor id_17,
    input tri1 id_18
    , _id_28,
    input tri1 id_19,
    input tri1 id_20,
    input supply1 id_21,
    output supply0 id_22,
    input supply1 id_23,
    output supply0 id_24,
    output tri0 id_25
);
  wire [(  id_28  ) : ~  (  -1  )] \id_29 ;
  initial begin : LABEL_0
    disable id_30;
    $clog2(19);
    ;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd87,
    parameter id_2 = 32'd2
) (
    input supply0 _id_0,
    input wand id_1,
    input wire _id_2,
    input uwire id_3,
    output tri id_4,
    input tri0 id_5,
    output tri id_6,
    output uwire id_7,
    input tri0 id_8,
    input uwire id_9,
    input tri1 id_10,
    output wand id_11,
    input wire id_12,
    output supply0 id_13
);
  logic [id_0 : id_2] id_15;
  ;
  assign id_11 = 1 & id_15;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_8,
      id_5,
      id_11,
      id_9,
      id_9,
      id_9,
      id_11,
      id_8,
      id_10,
      id_1,
      id_6,
      id_8,
      id_4,
      id_13,
      id_7,
      id_7,
      id_12,
      id_9,
      id_9,
      id_10,
      id_13,
      id_10,
      id_13,
      id_7
  );
  assign modCall_1.id_23 = 0;
endmodule
