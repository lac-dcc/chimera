// Seed: 3360954786
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    output supply1 id_7
);
  tri  id_9;
  wire id_10;
  assign id_9 = 1;
  struct packed {id_11 id_12;} id_13;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd13
) (
    input tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    output supply1 id_3,
    input wand id_4,
    input wor id_5,
    input wor id_6,
    input wor id_7,
    output tri0 id_8,
    input wire id_9,
    input wire _id_10,
    input wire id_11,
    output wire id_12
    , id_14
);
  tri0 id_15;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_8
  );
  assign modCall_1.id_1 = 0;
  localparam id_16 = -1'h0;
  assign (strong1, strong0) id_15 = 1;
  assign id_14[id_10] = -1;
endmodule
