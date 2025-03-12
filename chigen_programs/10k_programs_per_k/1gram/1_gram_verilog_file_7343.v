// Seed: 1506177313
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input tri id_2,
    input supply0 id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output wire id_7,
    input wire id_8
    , id_14,
    input tri1 id_9,
    output supply1 id_10,
    output tri1 id_11,
    input tri id_12
    , id_15, id_16
);
  struct packed {
    logic id_17;
    logic id_18;
    logic id_19;
  }
      id_20, id_21;
  assign id_20.id_19 = id_2;
  assign id_11 = id_0;
  assign id_16 = -1'b0;
  assign id_21 = 1;
endmodule
module module_1 #(
    parameter id_1  = 32'd59,
    parameter id_10 = 32'd84,
    parameter id_12 = 32'd63
) (
    input supply1 id_0
    , _id_10,
    input wor _id_1,
    output wand id_2,
    input supply1 id_3,
    output uwire id_4,
    input uwire id_5,
    input tri1 id_6
    , id_11,
    output tri1 id_7,
    input supply0 id_8
);
  tri1 [1 : id_10] _id_12 = id_3, id_13 = 1;
  wire [id_10 : id_1  +  id_12  << ""] id_14 = id_3;
  xnor primCall (id_4, id_11, id_15, id_14, id_5, id_8, id_6, id_0, id_13, id_3);
  logic id_15;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_8,
      id_5,
      id_5,
      id_6,
      id_3,
      id_2,
      id_5,
      id_0,
      id_2,
      id_7,
      id_5
  );
  assign modCall_1.id_15 = 0;
  logic id_16;
endmodule
