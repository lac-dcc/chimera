// Seed: 3118604697
macromodule module_0 #(
    parameter id_11 = 32'd80
) (
    output wor id_0,
    output wire id_1,
    output supply0 id_2,
    output supply1 id_3,
    output supply1 id_4,
    output wire id_5,
    output uwire id_6,
    output supply1 id_7,
    output wor id_8,
    output tri0 id_9,
    output uwire id_10,
    output wand _id_11,
    output tri1 id_12,
    output supply0 id_13
);
  bit id_15;
  always #1 @(posedge id_15) id_15 <= -1'b0;
  assign id_6 = id_15;
  assign module_1.id_1 = 0;
  logic [id_11 : -1] id_16;
  ;
endmodule
module module_1 #(
    parameter id_22 = 32'd51
) (
    output supply0 id_0,
    input tri0 id_1,
    output logic id_2,
    output tri0 id_3,
    output tri1 id_4,
    output tri0 id_5,
    input wand id_6,
    output logic id_7,
    output tri id_8,
    input tri1 id_9,
    output wor id_10,
    input tri id_11,
    input wand id_12,
    output supply1 id_13,
    output wire id_14,
    output tri1 id_15,
    input tri0 id_16
);
  always disable id_18;
  parameter [-1 : 1] id_19 = 1;
  always @(posedge -1) id_7 = -1'b0;
  bit id_20;
  supply1 id_21;
  parameter id_22 = id_19;
  assign id_21 = -1;
  always @(posedge 1) id_20 <= -1 & id_21;
  wire id_23;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_13,
      id_10,
      id_3,
      id_0,
      id_13,
      id_4,
      id_10,
      id_10,
      id_14,
      id_22,
      id_13,
      id_14
  );
  if ('b0) begin : LABEL_0
    defparam id_22.id_22 = id_19;
    if (id_22 == -1) begin : LABEL_1
      initial id_2 = id_16 * 1'd0 == -1;
    end else begin : LABEL_2
      supply1 id_24 = -1;
    end
  end else assign id_18 = id_12;
endmodule
