// Seed: 3702217392
module module_0 #(
    parameter id_2 = 32'd54
) (
    input wand id_0
);
  wire _id_2, id_3;
  logic id_4[id_2 : 1];
endmodule
program module_1 (
    input wire id_0,
    output wand id_1,
    input supply0 id_2,
    input wire id_3,
    output supply0 id_4
);
  genvar id_6;
  assign id_1 = -1;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_2 = 0;
  wire id_7, id_8, id_9, id_10;
endprogram
module module_2 #(
    parameter id_10 = 32'd91,
    parameter id_5  = 32'd46
) (
    input uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    inout uwire id_3,
    input supply1 id_4
    , id_13,
    input tri _id_5,
    input wire id_6,
    output tri0 id_7,
    input wor id_8,
    output supply0 id_9,
    input tri1 _id_10,
    input supply1 id_11
);
  parameter id_14 = ~|1;
  or primCall (id_7, id_0, id_14, id_4, id_13, id_1, id_3, id_11, id_15);
  bit id_15;
  id_16 :
  assert property (@(posedge -1 or posedge -1) 1'b0 ^ id_15) id_15 = id_4;
  module_0 modCall_1 (id_8);
  assign id_13[-1'h0][1!==id_10^-1 : id_5] = id_3;
endmodule
