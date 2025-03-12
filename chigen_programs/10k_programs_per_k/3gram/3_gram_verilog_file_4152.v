// Seed: 1276156611
module module_0 (
    input  wor   id_0,
    output uwire id_1,
    input  tri1  id_2,
    output wor   id_3,
    input  tri1  id_4,
    output tri1  id_5
);
  assign id_5 = 1;
  assign module_1.id_2 = 0;
  wire id_7;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    output wor id_2,
    input wor id_3,
    input supply0 id_4,
    output wire id_5,
    input wand id_6
);
  assign id_5 = id_3 + 1 == id_4;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_3,
      id_0
  );
endmodule
module module_2 #(
    parameter id_19 = 32'd35,
    parameter id_5  = 32'd47,
    parameter id_8  = 32'd48,
    parameter id_9  = 32'd75
) (
    output supply1 id_0
    , id_16,
    output tri1 id_1,
    output wire id_2,
    input tri1 id_3,
    input tri0 id_4,
    output wor _id_5,
    output wire id_6,
    output wire id_7,
    output tri _id_8,
    output supply0 _id_9,
    output tri id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wire id_13,
    output wor id_14
);
  logic [1 'b0 : id_5] id_17;
  ;
  logic [-1 : id_9] id_18;
  ;
  assign id_17 = id_16;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_12,
      id_11,
      id_12,
      id_0
  );
  assign modCall_1.id_3 = 0;
  logic _id_19 = id_18(id_16[-1]);
  wire [id_19 : !  1] id_20;
  assign id_18 = 1;
  assign id_17[-1'b0] = id_19 || -1;
  logic [id_8  -  -1 : -1] id_21;
endmodule
