// Seed: 1792803042
module module_0 (
    input wor id_0,
    output wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    input wand id_5,
    output wand id_6,
    input tri1 id_7
    , id_21,
    input tri0 id_8,
    output supply0 id_9,
    input tri0 id_10,
    input wand id_11,
    output supply1 id_12,
    input uwire id_13,
    input wire id_14,
    output supply0 id_15,
    input wand id_16,
    output tri1 id_17,
    output tri0 id_18,
    input wor id_19
);
  logic id_22;
  assign id_21 = ~id_7;
  assign module_1._id_16 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd90,
    parameter id_13 = 32'd65,
    parameter id_16 = 32'd51,
    parameter id_19 = 32'd51,
    parameter id_3  = 32'd7,
    parameter id_8  = 32'd8
) (
    input supply1 _id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand _id_3,
    output supply1 id_4,
    input supply1 id_5,
    inout tri id_6,
    input supply1 id_7,
    input tri0 _id_8,
    input supply1 id_9,
    input wire id_10,
    input wor id_11,
    output supply1 id_12,
    input tri0 _id_13,
    output wire id_14,
    output uwire id_15,
    input supply1 _id_16,
    output supply0 id_17,
    output wand id_18
    , id_28,
    input wor _id_19,
    output wand id_20,
    input wand id_21,
    input uwire id_22,
    input wire id_23,
    input tri0 id_24,
    output wire id_25,
    output tri1 id_26
);
  wire [id_0 : (  id_19  )] id_29;
  logic [7:0][~  (  id_13  ?  id_8 : id_16  ) : 1] id_30;
  wire id_31;
  wire id_32;
  assign id_20 = id_28 - id_10;
  assign id_12 = |id_13;
  assign id_17 = 1 ** 1'b0;
  module_0 modCall_1 (
      id_23,
      id_20,
      id_7,
      id_9,
      id_7,
      id_21,
      id_17,
      id_7,
      id_22,
      id_26,
      id_21,
      id_21,
      id_25,
      id_2,
      id_11,
      id_6,
      id_22,
      id_12,
      id_4,
      id_5
  );
  assign id_28 = id_19;
  generate
    for (id_33 = id_30; 1; id_28 = 1) begin : LABEL_0
      assign id_30[id_3==-1] = id_22;
    end : SymbolIdentifier
  endgenerate
endmodule
