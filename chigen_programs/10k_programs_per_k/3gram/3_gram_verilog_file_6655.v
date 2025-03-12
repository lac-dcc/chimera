// Seed: 240308386
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output uwire id_3,
    input wor id_4,
    input wor id_5,
    output tri1 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input uwire id_9,
    input uwire id_10,
    output uwire id_11,
    input wire id_12,
    input tri0 id_13,
    output supply0 id_14,
    input tri1 id_15,
    input tri id_16
);
  static logic id_18, id_19, id_20;
  wire id_21;
  ;
  logic [(  -1  -  1  ) : -1 'd0] id_22;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd35
) (
    output wand id_0,
    output tri1 id_1,
    input  wire id_2,
    input  wand _id_3,
    output tri0 id_4,
    output wire id_5,
    input  tri0 id_6,
    input  tri0 id_7,
    input  wand id_8#(.id_14(-1'b0)),
    output tri0 id_9,
    output tri  id_10,
    output wire id_11,
    input  tri  id_12
);
  union packed {logic [id_3 : 1] id_15;} id_16;
  ;
  localparam id_17 = "";
  logic id_18;
  ;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_2,
      id_5,
      id_2,
      id_7,
      id_0,
      id_12,
      id_1,
      id_7,
      id_7,
      id_9,
      id_2,
      id_12,
      id_1,
      id_12,
      id_2
  );
  assign modCall_1.id_16 = 0;
endmodule
