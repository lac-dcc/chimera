// Seed: 2043202189
module module_0 (
    output wor   id_0,
    output uwire id_1,
    output wand  id_2,
    input  uwire id_3
);
  wire id_5;
  wire id_6;
  assign module_1._id_19 = 0;
  assign id_2 = 1 ? id_5 : (id_6);
endmodule
module module_1 #(
    parameter id_17 = 32'd39,
    parameter id_19 = 32'd69
) (
    input supply0 id_0,
    input supply1 id_1,
    input wire id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wor id_6,
    output wire id_7,
    output uwire id_8,
    input supply1 id_9,
    input supply1 id_10[id_19 : 1 'b0 <  1],
    input supply0 id_11,
    input supply0 id_12[1 : id_17],
    output uwire id_13,
    input wand id_14,
    input wand id_15,
    input uwire id_16,
    input tri0 _id_17,
    input wor id_18,
    input tri _id_19,
    input supply0 id_20,
    input wire id_21,
    output tri void id_22
);
  initial $signed(42);
  ;
  assign id_22 = id_17;
  assign id_3  = id_0;
  assign id_8  = -1;
  localparam id_24 = -1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_8,
      id_20
  );
  assign id_7 = id_19;
  nand primCall (
      id_8, id_2, id_11, id_1, id_18, id_14, id_24, id_21, id_12, id_16, id_10, id_0, id_15, id_9
  );
endmodule
