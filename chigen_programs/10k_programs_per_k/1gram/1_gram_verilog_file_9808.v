// Seed: 1219967357
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    output uwire id_4,
    input tri1 id_5,
    input wire id_6,
    output tri id_7,
    output supply1 id_8,
    input tri0 id_9,
    input tri0 id_10
);
  always_latch $clog2(0);
  ;
  wire id_12, id_13;
endmodule
module module_1 #(
    parameter id_9 = 32'd59
) (
    output supply1 id_0,
    output wand id_1,
    output tri0 id_2,
    input tri1 id_3,
    output wire id_4,
    input tri1 id_5,
    input supply1 id_6
);
  parameter id_8 = 1'b0;
  wire _id_9 = id_5;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_5,
      id_0,
      id_6,
      id_5,
      id_2,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_9 = 0;
  supply1 [-1 'b0 : id_9] id_10 = id_6, id_11 = -1;
  assign id_9 = id_5;
  or primCall (id_0, id_3, id_6, id_8, id_5);
endmodule
