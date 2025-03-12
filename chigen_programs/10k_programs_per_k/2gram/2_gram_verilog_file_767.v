// Seed: 2290906844
module module_0 #(
    parameter id_23 = 32'd34
) (
    output supply0 id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    output wor id_4,
    output supply1 id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri1 id_8,
    input wand id_9,
    input tri id_10,
    input supply1 id_11,
    output wand id_12,
    input wand id_13
    , id_20,
    output wor id_14,
    output tri0 id_15,
    output uwire id_16,
    input supply1 id_17,
    output tri0 id_18
);
  assign id_6  = -1'd0;
  assign id_20 = -1;
  always disable id_21;
  wire id_22;
  wire _id_23;
  wire [id_23 : 1] id_24;
  assign id_12 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd98,
    parameter id_4 = 32'd49,
    parameter id_5 = 32'd54
) (
    input tri1 id_0,
    input wire _id_1,
    output supply0 id_2,
    input supply1 id_3,
    input wire _id_4,
    input tri0 _id_5,
    input wire id_6,
    output wire id_7
);
  struct packed {
    logic [-1  -  id_4 : -1] id_9;
    struct packed {
      logic id_10;
      logic [id_1 : -1 'd0] id_11;
    } id_12;
  } [id_5 : 1] id_13;
  ;
  always begin : LABEL_0
    id_13.id_11 = id_13.id_10;
  end
  logic [-1 : -1] id_14;
  assign id_13.id_11 = 1'd0;
  wire id_15;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_3,
      id_6,
      id_7,
      id_7,
      id_7,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_7,
      id_6,
      id_7,
      id_2,
      id_2,
      id_6,
      id_7
  );
  assign modCall_1.id_0 = 0;
  parameter id_16 = 1 == -1;
  assign id_7 = (1);
  assign id_2 = -1;
  if (1 - 'd0 ? -1 : (-1 - -1)) begin : LABEL_1
    wire id_17;
  end
  logic [-1  !==  1 : 1] id_18;
endmodule
