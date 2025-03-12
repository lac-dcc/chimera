// Seed: 498852488
module module_0 (
    output supply1 id_0,
    output wor id_1,
    input supply1 id_2,
    input uwire id_3,
    output wand id_4,
    output tri0 id_5,
    input tri1 id_6,
    output wire id_7,
    input uwire id_8,
    input supply0 id_9,
    output supply0 id_10,
    input supply1 id_11,
    output wand id_12,
    input uwire id_13,
    output wor id_14,
    output tri1 id_15,
    input tri1 id_16,
    output supply1 id_17,
    input tri1 id_18
);
  logic id_20;
  ;
  assign id_4 = -1;
  rtran ((id_11), -1 * 1'h0 - 1);
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd31
) (
    input tri id_0,
    input wor id_1,
    output supply1 id_2,
    input wor id_3,
    input uwire id_4,
    output supply1 id_5,
    input wor _id_6,
    input tri id_7,
    input tri1 id_8,
    input tri1 id_9,
    input wor id_10,
    input supply1 id_11,
    output wor id_12,
    input tri1 id_13,
    input wor id_14,
    input supply0 id_15,
    input supply0 id_16
);
  localparam id_18 = 'b0;
  wire [id_6 : 1] id_19;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3,
      id_12,
      id_11,
      id_10,
      id_12,
      id_15,
      id_5,
      id_7,
      id_2,
      id_12,
      id_1,
      id_12,
      id_8
  );
  always @(id_14, posedge -1) begin : LABEL_0
    if (-1) disable id_20;
  end
endmodule
