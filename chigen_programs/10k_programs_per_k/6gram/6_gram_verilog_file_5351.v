// Seed: 3472279902
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wand id_4,
    input wor id_5,
    input tri id_6,
    input wand id_7,
    output supply1 id_8,
    input supply1 id_9,
    output wire id_10
);
  parameter id_12 = 1;
  always @(*) begin : LABEL_0
    $signed(17);
    ;
  end
  assign module_1.id_11 = 0;
  always @(1 or posedge 1'b0) begin : LABEL_1
    disable id_13;
  end
endmodule
module module_1 #(
    parameter id_0  = 32'd6,
    parameter id_17 = 32'd95
) (
    input tri0 _id_0,
    output tri1 id_1,
    input tri id_2,
    output wire id_3,
    input wire id_4,
    output tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    input wire id_8,
    output wire id_9,
    output wire id_10,
    output wor id_11,
    input supply1 id_12,
    output tri id_13,
    output wand id_14,
    input wire id_15,
    output supply1 id_16,
    input tri0 _id_17,
    input tri id_18,
    input supply1 id_19,
    input tri id_20,
    output uwire id_21
);
  wire [id_17 : id_0] id_23;
  xor primCall (id_13, id_15, id_18, id_4, id_20, id_7, id_8, id_2, id_19, id_12, id_6, id_23);
  module_0 modCall_1 (
      id_1,
      id_16,
      id_7,
      id_5,
      id_20,
      id_2,
      id_15,
      id_2,
      id_1,
      id_18,
      id_13
  );
endmodule
