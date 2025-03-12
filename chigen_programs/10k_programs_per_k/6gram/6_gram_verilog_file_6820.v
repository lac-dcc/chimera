// Seed: 2039356483
module module_0 #(
    parameter id_4 = 32'd44,
    parameter id_5 = 32'd30
) (
    output supply0 id_0,
    output tri id_1,
    input tri0 id_2
);
  wire _id_4;
  wire _id_5;
  wire id_6;
  ;
  logic [id_4 : id_4  +  1 'b0] id_7;
  wire [1 : 1  &  1] id_8;
  assign id_7 = -1'b0;
  assign module_1.id_5 = 0;
  wire [-1 'd0 : id_5] id_9;
  assign id_8 = 1;
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    output wand id_2,
    input wire id_3,
    input uwire id_4,
    output tri0 id_5,
    input wand id_6,
    output uwire id_7
);
  logic id_9 = id_6;
  and primCall (id_1, id_4, id_9, id_6, id_3);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4
  );
endmodule
