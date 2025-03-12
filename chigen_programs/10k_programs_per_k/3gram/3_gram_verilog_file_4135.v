// Seed: 3494893635
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input uwire id_8,
    input wire id_9,
    input tri1 id_10
);
  wire  id_12 = id_9;
  wire  id_13;
  logic id_14;
endmodule
module module_1 #(
    parameter id_18 = 32'd79,
    parameter id_4  = 32'd84
) (
    output supply0 id_0,
    input supply1 id_1
    , id_15,
    input supply0 id_2,
    input supply0 id_3,
    input tri0 _id_4,
    input tri id_5,
    output tri0 id_6,
    input wor id_7,
    input wor id_8,
    input supply0 id_9,
    output wand id_10,
    input wand id_11,
    input tri0 id_12,
    input tri0 id_13
);
  assign id_0 = id_13 + {id_15, id_5};
  wire id_16;
  ;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_0,
      id_6,
      id_9,
      id_3,
      id_7,
      id_3,
      id_1,
      id_12,
      id_9
  );
  assign modCall_1.id_2 = 0;
  assign id_0 = id_16#(
      .id_4 (-1),
      .id_3 (1),
      .id_2 (1'b0 == -1),
      .id_15(-1)
  );
  supply0 id_17;
  localparam id_18 = -1;
  assign id_17 = 'h0;
  localparam id_19 = -1'h0, id_20 = 1;
  logic [1 : id_4  ==  id_18] id_21;
  ;
endmodule
