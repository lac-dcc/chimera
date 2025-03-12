// Seed: 4167877298
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  wor   id_5,
    input  tri1  id_6
);
  assign id_4 = -1;
  assign module_1.id_38 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd89,
    parameter id_22 = 32'd10,
    parameter id_23 = 32'd5
) (
    output tri _id_0,
    output supply1 id_1,
    output wor id_2,
    output wor id_3,
    input supply1 id_4,
    output wand id_5,
    input tri id_6,
    input uwire id_7,
    input wire id_8,
    output tri0 id_9,
    output supply0 id_10,
    output tri id_11,
    input uwire id_12,
    output tri0 id_13,
    output supply1 id_14,
    output uwire id_15,
    output wor id_16,
    output tri1 id_17,
    input supply1 id_18,
    input tri0 id_19,
    input tri id_20,
    input tri1 id_21,
    input wor _id_22,
    output wand _id_23,
    input supply1 id_24,
    output supply0 id_25,
    input tri0 id_26,
    input supply1 id_27,
    input wire id_28,
    output supply1 id_29,
    input tri1 id_30,
    output tri id_31,
    input tri0 id_32,
    output supply0 id_33
);
  logic id_35;
  ;
  logic id_36 = id_35;
  parameter id_37 = 1'h0;
  logic [id_0 : -1] id_38 = 1 & 1 - id_35;
  assign id_17 = id_6;
  assign id_25 = id_20#(
      .id_21(id_37),
      .id_6 (id_37[1 : id_22]),
      .id_32(id_37),
      .id_8 (1'b0),
      .id_26(id_37[-1'b0]),
      .id_20(id_37)
  );
  wire id_39;
  module_0 modCall_1 (
      id_8,
      id_26,
      id_8,
      id_28,
      id_3,
      id_32,
      id_4
  );
  assign id_3  = id_27;
  assign id_15 = -1;
  logic [-1 'b0 : id_23  |  -1] id_40, id_41;
endmodule
