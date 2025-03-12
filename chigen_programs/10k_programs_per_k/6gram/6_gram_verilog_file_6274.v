// Seed: 2654991810
module module_0 (
    output wand id_0,
    output wire id_1,
    input tri id_2,
    input supply0 id_3,
    output supply1 id_4
    , id_21,
    input uwire id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wire id_8,
    output wand id_9,
    output supply1 id_10,
    output supply0 id_11,
    output tri0 id_12,
    input wire id_13,
    input wand id_14
    , id_22,
    input supply1 id_15,
    output wor id_16,
    input wire id_17,
    input wire id_18,
    output tri1 id_19
);
  always @(posedge -1) $signed(74);
  ;
endmodule
module module_1 #(
    parameter id_17 = 32'd26,
    parameter id_20 = 32'd18,
    parameter id_26 = 32'd65,
    parameter id_8  = 32'd94
) (
    input wire id_0,
    input uwire id_1,
    output wand id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    output wand id_6,
    output tri1 id_7,
    input wand _id_8,
    input uwire id_9,
    input tri0 id_10,
    output supply0 id_11,
    output wand id_12,
    output uwire id_13,
    output wand id_14
    , id_19,
    input supply1 id_15,
    input uwire id_16,
    input uwire _id_17
);
  assign id_12 = id_5 * id_3 ? -1 : id_16;
  wire _id_20;
  wire id_21;
  wire id_22;
  ;
  logic [7:0] id_23;
  logic [7:0] id_24;
  localparam [id_17 : 1] id_25 = 1;
  module_0 modCall_1 (
      id_14,
      id_11,
      id_1,
      id_3,
      id_14,
      id_0,
      id_3,
      id_10,
      id_10,
      id_13,
      id_12,
      id_7,
      id_6,
      id_4,
      id_0,
      id_15,
      id_6,
      id_10,
      id_16,
      id_2
  );
  assign modCall_1.id_6 = 0;
  assign id_19 = ~id_0;
  assign id_24[id_8] = 1;
  wire _id_26;
  wire [1 : -1] id_27;
  wire [id_26 : -1] id_28;
  assign id_23[id_20==1] = 1;
endmodule
