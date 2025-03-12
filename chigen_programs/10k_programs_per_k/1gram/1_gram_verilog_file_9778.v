// Seed: 3086563215
module module_0 #(
    parameter id_5 = 32'd19,
    parameter id_8 = 32'd16
) (
    input supply1 id_0,
    output tri0 id_1,
    output wand id_2
);
  parameter id_4 = -1;
  wire _id_5;
  always $unsigned(98);
  ;
  assign module_1.id_10 = 0;
  logic id_6, id_7;
  wire _id_8;
  wire [id_8 : id_8  .  id_5] id_9, id_10;
  logic id_11;
endmodule
module module_1 #(
    parameter id_6 = 32'd32
) (
    input wire id_0,
    input tri id_1,
    input wire id_2,
    input tri1 id_3,
    output uwire id_4,
    output uwire id_5,
    input tri0 _id_6,
    input supply1 id_7,
    input tri id_8,
    output uwire id_9,
    input wire id_10[-1 : id_6  ?  1  -  -1 : -1],
    input tri1 id_11
);
  logic id_13;
  ;
  xnor primCall (id_9, id_3, id_13, id_2, id_10, id_0, id_11, id_7, id_1);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9
  );
endmodule
