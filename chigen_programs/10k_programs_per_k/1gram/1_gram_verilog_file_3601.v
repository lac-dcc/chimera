// Seed: 3414861471
module module_0;
endmodule
module module_1 #(
    parameter id_2 = 32'd79,
    parameter id_3 = 32'd41,
    parameter id_5 = 32'd12,
    parameter id_7 = 32'd38,
    parameter id_9 = 32'd69
) (
    output tri0 id_0,
    input tri id_1,
    input tri0 _id_2,
    input wand _id_3,
    input wire id_4,
    input supply1 _id_5[1 : id_5]
);
  wire [id_3 : id_2] _id_7;
  parameter id_8 = -1;
  always_latch #(id_5) $unsigned(54);
  ;
  parameter id_9 = {1};
  logic id_10 = id_1;
  logic id_11;
  always id_11 = id_11;
  logic [7:0][-1 : id_2] id_12;
  nor primCall (id_0, id_1, id_10, id_11, id_12, id_4, id_7, id_8, id_9);
  assign id_7 = id_12[id_7 :-1];
  assign id_0 = id_12;
  module_0 modCall_1 ();
  struct packed {logic id_13;} [1  <<  id_2  .  id_9 : 1] id_14;
  ;
endmodule
