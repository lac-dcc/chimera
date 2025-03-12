// Seed: 462820625
module module_0 (
    input uwire id_0,
    input tri id_1,
    output wor id_2,
    input supply1 id_3,
    output tri id_4,
    output supply1 id_5
);
  assign id_2 = 1;
  assign id_5 = -1;
  tri0 id_7 = (id_0) & 1'b0;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd95,
    parameter id_1 = 32'd29,
    parameter id_6 = 32'd37
) (
    input tri0 _id_0,
    input wor _id_1
    , id_11,
    input tri id_2,
    input wire id_3,
    input wor id_4,
    input tri1 id_5,
    input tri0 _id_6,
    input supply1 id_7,
    output wand id_8,
    input tri1 id_9
);
  wire [id_1  |  id_0 : id_6] id_12;
  assign id_11 = id_1 - 1'b0;
  wire id_13;
  ;
  and primCall (id_8, id_2, id_9, id_12, id_7, id_13, id_4, id_3);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_8,
      id_9,
      id_8,
      id_8
  );
  always @(posedge id_9, id_3 & id_12) id_11 <= 1'h0;
endmodule
