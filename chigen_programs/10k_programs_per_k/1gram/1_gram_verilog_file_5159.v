// Seed: 1401467718
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    output wand id_2,
    input wand id_3,
    input wand id_4,
    input supply1 id_5
);
  reg id_7;
  initial id_7 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd7,
    parameter id_14 = 32'd59
) (
    input supply0 id_0,
    output logic id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input wand id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wand id_8,
    input wire id_9,
    input tri0 id_10,
    input wor _id_11,
    input tri1 id_12,
    input tri0 id_13,
    input tri1 _id_14,
    input supply1 id_15
);
  always begin : LABEL_0
    id_1 <= #(-1  : id_14  : 1) id_13;
  end
  wire id_17[id_11 : 1  ==  id_14], id_18;
  logic id_19;
  ;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_2,
      id_5,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
