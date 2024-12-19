// Seed: 344100130
module module_0 (
    input  tri0 id_0,
    input  wand id_1,
    output wand id_2,
    input  wand id_3,
    output tri1 id_4,
    input  tri1 id_5,
    output wor  id_6
);
  always @(posedge 1 & 1'd0) #1;
  initial assume (id_5);
  tri0 id_8 = id_5;
  wire id_9, id_10, id_11, id_12, id_13, id_14;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input wand id_2,
    input logic id_3,
    input tri0 id_4,
    output logic id_5,
    input supply1 id_6,
    input tri id_7
);
  always @(negedge id_4)
    if (id_0)
      #1 begin : LABEL_0
        id_5 <= id_3;
      end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.type_16 = 0;
endmodule
