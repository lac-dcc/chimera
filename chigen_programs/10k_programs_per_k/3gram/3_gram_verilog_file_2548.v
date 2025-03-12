// Seed: 1511723535
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input wand id_2,
    output tri0 id_3,
    input supply0 id_4,
    output logic id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input wand id_10,
    input wor id_11,
    output tri0 id_12,
    input wire id_13,
    input wor id_14,
    output tri0 id_15
    , id_30,
    input supply1 id_16,
    input tri1 id_17,
    input wor id_18,
    input wand id_19,
    output tri1 id_20,
    input wand id_21,
    input uwire id_22,
    input tri1 id_23,
    output wire id_24,
    input tri1 id_25,
    input supply1 id_26,
    input tri id_27,
    input wor id_28
);
  always @(posedge id_0 && id_14) begin : LABEL_0
    id_5 = id_18;
  end
  assign module_1.id_5 = 0;
  parameter id_31 = 1;
  parameter id_32 = -1;
  localparam id_33 = id_32;
  logic id_34 = 1 == 1;
  parameter id_35 = id_33;
  wire [-1 : -1] id_36;
endmodule
module module_1 #(
    parameter id_13 = 32'd48,
    parameter id_5  = 32'd3
) (
    input tri id_0,
    output wor id_1,
    input tri1 id_2,
    input uwire id_3,
    output tri1 id_4,
    input tri _id_5,
    input wor id_6,
    input supply1 id_7,
    output logic id_8,
    output tri1 id_9,
    input tri1 id_10,
    output uwire id_11,
    output tri0 id_12,
    input tri _id_13,
    output uwire id_14,
    output tri id_15
);
  logic [id_5 : id_13] id_17;
  ;
  assign id_1 = (-1) == 1 | -1'b0;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_14,
      id_3,
      id_8,
      id_7,
      id_3,
      id_3,
      id_12,
      id_3,
      id_7,
      id_15,
      id_6,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_7,
      id_9,
      id_10,
      id_10,
      id_2,
      id_14,
      id_0,
      id_0,
      id_3,
      id_3
  );
  always @(id_17, 1'b0) begin : LABEL_0
    id_8 = -1'b0;
    id_8 = (id_10);
  end
endmodule
