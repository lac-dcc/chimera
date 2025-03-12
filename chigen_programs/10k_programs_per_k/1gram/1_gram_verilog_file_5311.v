// Seed: 3770697008
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output wire id_2,
    input tri id_3,
    input supply0 id_4
);
  logic id_6;
  ;
  assign module_1._id_11 = 0;
  wire id_7 = id_0, id_8;
endmodule
program module_0 #(
    parameter id_11 = 32'd16,
    parameter id_7  = 32'd24
) (
    output wire id_0,
    input wor id_1,
    input tri1 id_2,
    output supply0 id_3,
    input supply0 id_4["" : -1],
    input supply1 id_5,
    output supply1 id_6,
    input supply0 _id_7[id_11 : -1],
    output tri1 id_8,
    input uwire id_9,
    input wire id_10,
    input wand _id_11
);
  wire id_13, id_14;
  and primCall (id_0, id_13, id_16, id_17, id_10, id_2, id_5, id_18, id_14);
  wire [-1 : id_7] id_15, id_16;
  wire  id_17;
  logic id_18;
  ;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_0,
      id_4,
      id_1
  );
  always_comb id_18[1] <= module_1 !=? -1;
endprogram
