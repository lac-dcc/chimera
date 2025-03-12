// Seed: 889580842
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wire id_3,
    input uwire id_4,
    input uwire id_5,
    input wire id_6,
    output tri1 id_7,
    output wire id_8
);
  logic id_10;
  ;
  logic ["" : -1] id_11;
endmodule
module module_0 #(
    parameter id_11 = 32'd89,
    parameter id_2  = 32'd74
) (
    input wire id_0,
    input tri id_1,
    input tri _id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri1 id_6,
    output tri1 id_7,
    output wand id_8,
    output logic id_9,
    output tri0 id_10,
    input wand module_1,
    output wand id_12,
    output tri1 id_13,
    output wire id_14,
    input wire id_15,
    output tri1 id_16,
    input uwire id_17,
    input supply0 id_18,
    output wand id_19
);
  wire id_21;
  localparam id_22 = 1;
  logic ["" : id_11] id_23 = 1;
  logic [ id_2 : -1] id_24 = -1;
  module_0 modCall_1 (
      id_3,
      id_17,
      id_8,
      id_8,
      id_15,
      id_0,
      id_4,
      id_12,
      id_19
  );
  assign modCall_1.id_4 = 0;
  initial begin : LABEL_0
    if (1'b0) assign {1, id_4, id_18[1'd0], id_5} = id_15 == id_15;
  end
  initial begin : LABEL_1
    id_9 <= id_18;
  end
endmodule
