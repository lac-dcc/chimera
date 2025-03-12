// Seed: 11211315
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    output wire id_9,
    input wor id_10,
    input tri id_11,
    output supply0 id_12
);
endmodule
module module_1 #(
    parameter id_1 = 32'd14,
    parameter id_8 = 32'd12
) (
    input supply0 id_0,
    input wire _id_1,
    input tri id_2,
    input wor id_3,
    output wand id_4
);
  wire id_6;
  logic [7:0] id_7, _id_8;
  bit ["" : -1] id_9;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_3,
      id_4,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_12 = 0;
  bit id_10;
  ;
  assign id_7 = ~id_6;
  assign id_7[-1] = -1;
  wire  id_11;
  logic id_12;
  ;
  wire  [  id_1  :  id_8  <  -1 'b0 ]  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  assign id_20 = id_12;
  wire id_24;
  initial begin : LABEL_0
    $signed(66);
    ;
    id_9 <= id_1;
    if (-1)
      if (!1) id_10 <= 1;
      else disable id_25;
  end
endmodule
