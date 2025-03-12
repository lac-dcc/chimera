// Seed: 2493994278
module module_0 (
    input wor id_0,
    output wire id_1,
    input wor id_2,
    output wand id_3,
    input tri id_4,
    output tri1 id_5,
    input tri0 module_0,
    output uwire id_7,
    output tri0 id_8,
    input uwire id_9,
    output wire id_10,
    output supply0 id_11,
    output wor id_12,
    output tri1 id_13,
    output supply1 id_14,
    output wire id_15
);
  assign id_8 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd1
) (
    input tri0 id_0,
    input wire _id_1
    , id_12,
    input wand id_2,
    input wor id_3,
    output uwire id_4,
    input tri1 id_5,
    output wand id_6,
    output supply1 id_7,
    input wor id_8,
    input supply1 id_9,
    output wor id_10
);
  reg [id_1 : ( "" )] id_13 = -1;
  assign id_12 = ~id_0;
  parameter id_14 = -1 == 1;
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_8,
      id_7,
      id_2,
      id_4,
      id_9,
      id_6,
      id_6,
      id_8,
      id_10,
      id_10,
      id_6,
      id_7,
      id_4,
      id_7
  );
  assign modCall_1.id_0 = 0;
  always
  fork
    id_13 <= 1;
    id_15(1'b0, 1'd0);
    #1 force id_6 = id_3;
  join
endmodule
