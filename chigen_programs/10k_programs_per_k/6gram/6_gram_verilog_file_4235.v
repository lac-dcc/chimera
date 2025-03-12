// Seed: 354961388
module module_0 #(
    parameter id_17 = 32'd27
) (
    input supply0 id_0,
    input supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    output wor id_4,
    output supply1 id_5,
    input wor id_6,
    input uwire id_7,
    input uwire id_8,
    output wire id_9
);
  logic id_11;
  logic [1 : -1] id_12;
  assign id_11 = -1 ? -1 : 1;
  localparam id_13 = -1'h0 ? -1 : 1;
  wire id_14;
  wire id_15, id_16;
  parameter id_17 = -1;
  logic id_18;
  wire  id_19;
  wire [id_17 : 1] id_20, id_21, id_22, id_23;
  wire id_24;
  ;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    input wire id_2,
    output supply0 id_3,
    input tri id_4,
    output tri1 id_5,
    input uwire id_6,
    output wand id_7,
    input tri0 id_8,
    output supply1 id_9,
    output tri1 id_10,
    input tri0 id_11,
    input tri1 id_12
    , id_16,
    input wor id_13,
    input tri0 id_14
);
  logic id_17;
  ;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_5,
      id_9,
      id_5,
      id_8,
      id_12,
      id_2,
      id_7
  );
  assign modCall_1.id_6 = 0;
  assign id_5 = !id_2 == id_8;
  assign id_5 = 1;
endmodule
