// Seed: 2734714942
module module_0 (
    input  tri0 id_0,
    input  tri1 id_1,
    input  tri1 id_2,
    input  wor  id_3,
    input  tri0 id_4,
    output wire id_5,
    output wand id_6
);
  assign id_5 = -1'h0 ? 1 : 1 ? 1 : id_1;
  assign module_1.id_17 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd50,
    parameter id_4  = 32'd0
) (
    input tri id_0,
    input wand id_1,
    output tri id_2,
    input wor id_3,
    input tri0 _id_4,
    output uwire id_5,
    input wor id_6,
    input supply1 id_7,
    output supply0 id_8,
    output wor id_9,
    output tri0 id_10,
    output wand id_11,
    output wire id_12
);
  wire id_14;
  assign id_10 = id_3;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_7,
      id_1,
      id_12,
      id_9
  );
  logic [7:0] id_15, id_16;
  localparam [1 'b0 : id_4] id_17 = 1;
  assign id_15[id_17] = id_14;
endmodule
