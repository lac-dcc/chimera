// Seed: 946197331
module module_0 #(
    parameter id_5 = 32'd26
) (
    input  wand  id_0,
    input  tri   id_1,
    output uwire id_2,
    output uwire id_3
);
  logic _id_5;
  wire  id_6;
  ;
  wire [1 : id_5] id_7;
  rnmos (1'h0, {id_3, id_1}, 1, -1'b0, id_3 - id_0);
  wire id_8;
  wire id_9;
  wire id_10;
  assign module_1.id_9 = 0;
  wire id_11;
  parameter id_12 = -1;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input tri1 id_2,
    input wor id_3,
    input tri id_4,
    output supply1 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wire id_8,
    input tri1 id_9,
    input supply0 id_10,
    output tri0 id_11,
    output supply0 id_12,
    output uwire id_13
);
  assign id_13 = 1;
  assign id_5  = id_0;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_12
  );
  parameter id_15 = 1;
endmodule
