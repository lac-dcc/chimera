// Seed: 3670746406
macromodule module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input wor id_2,
    input uwire id_3,
    input tri1 id_4,
    output tri id_5,
    input uwire id_6,
    output supply0 id_7,
    input wire id_8,
    input supply1 id_9,
    input supply1 id_10,
    input supply1 id_11,
    output wire id_12,
    output wire id_13,
    output tri id_14,
    output wire id_15,
    input wand id_16,
    output tri0 id_17,
    output tri id_18,
    output tri id_19,
    input tri0 id_20,
    input supply1 id_21
    , id_28,
    output wor id_22,
    input tri id_23,
    input supply1 id_24,
    input uwire id_25,
    input tri0 id_26
);
  wire id_29;
  assign module_1._id_9 = 0;
  localparam id_30 = 1;
  wire id_31;
endmodule
module module_1 #(
    parameter id_12 = 32'd36,
    parameter id_7  = 32'd55,
    parameter id_9  = 32'd70
) (
    input supply1 id_0,
    input wor id_1,
    input wire id_2,
    input wire id_3,
    input tri id_4,
    input wand id_5,
    input wire id_6,
    input supply1 _id_7,
    input supply1 id_8,
    output supply0 _id_9,
    input supply1 id_10,
    input wire id_11,
    input tri _id_12,
    output tri1 id_13
);
  assign id_9 = id_2;
  logic [id_7 : id_12  *  id_9] id_15;
  always @(posedge -1) id_15 = 1'b0;
  wire id_16;
  wire [1 : -1] id_17;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_3,
      id_3,
      id_3,
      id_13,
      id_6,
      id_13,
      id_1,
      id_4,
      id_1,
      id_6,
      id_13,
      id_13,
      id_13,
      id_13,
      id_3,
      id_13,
      id_13,
      id_13,
      id_10,
      id_1,
      id_13,
      id_2,
      id_8,
      id_0,
      id_0
  );
  logic id_18;
  ;
endmodule
