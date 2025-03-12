// Seed: 2323834170
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wand id_2,
    output tri1 id_3,
    output supply1 id_4,
    output tri id_5,
    input tri1 id_6
);
  localparam id_8 = 1'b0;
endmodule
module module_1 #(
    parameter id_15 = 32'd87,
    parameter id_2  = 32'd12,
    parameter id_24 = 32'd48,
    parameter id_25 = 32'd72,
    parameter id_28 = 32'd59,
    parameter id_4  = 32'd9,
    parameter id_8  = 32'd36,
    parameter id_9  = 32'd10
) (
    input wire id_0,
    output wand id_1,
    input supply0 _id_2,
    input supply0 id_3,
    input tri1 _id_4,
    input tri id_5,
    input wor id_6,
    output tri1 id_7,
    output supply1 _id_8,
    input tri1 _id_9,
    inout uwire id_10,
    input tri0 id_11,
    input tri id_12,
    input wand id_13,
    input tri0 id_14,
    input uwire _id_15,
    output tri0 id_16,
    output wor id_17,
    input tri0 id_18,
    inout uwire id_19
    , id_27,
    output tri1 id_20,
    input supply0 id_21,
    input wire id_22,
    input wand id_23,
    input supply0 _id_24,
    output supply1 _id_25
);
  wire _id_28;
  ;
  wire id_29;
  ;
  module_0 modCall_1 (
      id_22,
      id_13,
      id_5,
      id_20,
      id_20,
      id_19,
      id_14
  );
  assign modCall_1.id_0 = 0;
  struct packed {
    logic [id_28 : 1] id_30;
    id_31 id_32;
  } [id_8 : id_25] id_33;
  localparam id_34 = 1;
  assign id_33.id_31[id_2 : id_15] = (-1) && id_18 && 1 && ~id_10;
  logic [1 : id_24  +  1  ^  id_4] id_35;
  assign id_1 = id_24 ? id_15 : id_10 ? -1 : id_22;
  wire [id_9 : ""] id_36;
endmodule
