// Seed: 2399554284
module module_0 (
    input tri0 id_0,
    output tri1 id_1
    , id_28,
    input wand id_2,
    input supply1 id_3,
    input tri id_4,
    output uwire id_5,
    output tri0 id_6,
    input supply0 id_7,
    input uwire id_8,
    input wand id_9,
    output uwire id_10,
    input tri id_11,
    input tri1 id_12,
    input wand id_13,
    input supply1 id_14,
    input tri0 id_15,
    output tri1 id_16,
    output wor id_17,
    output wand id_18,
    output wire id_19,
    input supply0 id_20,
    input uwire id_21,
    output wire id_22,
    input wor id_23,
    input uwire id_24
    , id_29, id_30,
    output supply1 id_25,
    output wand id_26
);
  wire id_31;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd41,
    parameter id_7 = 32'd31
) (
    output wire  id_0,
    input  uwire id_1,
    output logic id_2,
    output uwire id_3,
    input  tri1  id_4
);
  wire _id_6;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4,
      id_3,
      id_1,
      id_4,
      id_1,
      id_1,
      id_4,
      id_3,
      id_3,
      id_0,
      id_0,
      id_4,
      id_1,
      id_3,
      id_4,
      id_4,
      id_3,
      id_0
  );
  parameter id_7 = 1;
  parameter [{  id_7  {  id_6  }  } : !  -1  ==  -1] id_8 = -1;
  wire id_9;
  always begin : LABEL_0
    id_2 <= #1 id_4;
  end
endmodule
