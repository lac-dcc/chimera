// Seed: 3531054558
module module_0 #(
    parameter id_13 = 32'd28,
    parameter id_17 = 32'd60,
    parameter id_18 = 32'd85,
    parameter id_3  = 32'd68
) (
    output supply0 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri0 _id_3,
    input wand id_4,
    output wand id_5,
    input wand id_6,
    input wor id_7,
    output uwire id_8,
    input wire id_9,
    input tri0 id_10,
    output wire id_11,
    input tri1 id_12
    , id_20,
    input uwire _id_13,
    output supply1 id_14,
    output wor id_15,
    input tri1 id_16,
    input supply1 _id_17,
    input supply1 _id_18
);
  logic id_21 = 1, id_22;
  localparam id_23 = 1;
  logic [1 'd0 : id_13] id_24;
  logic [id_17 : id_3] id_25;
  logic [1 'h0 : -1] id_26;
  supply1 id_27 = id_1 << 1'b0;
  wire [-1 : id_18] id_28 = id_10;
  localparam id_29 = 1 + 1;
endmodule
macromodule module_1 #(
    parameter id_12 = 32'd91
) (
    output tri id_0,
    input wand id_1,
    input wire id_2,
    inout supply0 id_3,
    input wor id_4,
    output supply0 id_5,
    output uwire id_6
);
  wire id_8, id_9;
  wire [!  1 : 1] id_10;
  wire id_11;
  parameter id_12 = -1'b0 & 1 & -1 & 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_12,
      id_1,
      id_6,
      id_4,
      id_2,
      id_5,
      id_1,
      id_2,
      id_5,
      id_4,
      id_12,
      id_0,
      id_0,
      id_4,
      id_12,
      id_12
  );
  assign modCall_1.id_3 = 0;
  parameter [(  id_12  ) : -1] id_13 = id_12;
  wire id_14;
endmodule
