// Seed: 2232231840
module module_0 (
    output uwire id_0,
    output tri id_1,
    output wire id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5,
    output wor id_6,
    input uwire id_7,
    output wire id_8
    , id_17,
    input uwire id_9,
    input supply0 id_10,
    output uwire id_11,
    input wand id_12,
    output supply1 id_13,
    input tri0 id_14,
    output wire id_15
);
endmodule
module module_1 #(
    parameter id_0  = 32'd0,
    parameter id_13 = 32'd34,
    parameter id_16 = 32'd64,
    parameter id_21 = 32'd24,
    parameter id_7  = 32'd14
) (
    input wor _id_0,
    inout uwire id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply0 id_4,
    input wire id_5,
    input wand id_6,
    input supply0 _id_7,
    output tri0 id_8,
    output wire id_9,
    output uwire id_10
    , _id_13,
    output tri id_11
);
  logic id_14;
  assign id_11 = -1'h0;
  wire [-1 : id_13] id_15;
  logic _id_16 = id_15;
  wire id_17;
  wire [1 'h0 : id_0] id_18;
  assign id_11 = -1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_1,
      id_6,
      id_9,
      id_1,
      id_11,
      id_4,
      id_9,
      id_2,
      id_4,
      id_9,
      id_3,
      id_10,
      id_1,
      id_9
  );
  assign modCall_1.id_5 = 0;
  genvar id_19;
  logic [id_7 : 1 'd0] id_20;
  assign id_20[id_16] = -1'b0;
  parameter id_21 = 1 < -1;
  wire id_22;
  localparam id_23 = -1;
  defparam id_21.id_21 = id_21;
endmodule
