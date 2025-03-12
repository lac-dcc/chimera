// Seed: 3280610207
module module_0 (
    output wire id_0,
    input  tri1 id_1
);
  uwire id_3;
  assign id_0 = id_3;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd49,
    parameter id_3 = 32'd37,
    parameter id_5 = 32'd5
) (
    input uwire id_0,
    input tri1 _id_1,
    output wand id_2,
    input supply1 _id_3,
    input wire id_4,
    output uwire _id_5,
    input wand id_6
);
  parameter id_8 = 1;
  wire id_9;
  assign id_5 = id_0;
  assign id_9 = id_3;
  module_0 modCall_1 (
      id_2,
      id_4
  );
  assign modCall_1.id_3 = 0;
  logic [7:0][!  -1 : 1] id_10;
  struct packed {logic [id_5 : id_3] id_11;} [id_1 : 1 'h0] id_12;
  assign id_10[id_3] = id_1 !=? id_12;
  logic id_13;
  ;
endmodule
