// Seed: 30874434
module module_0 (
    output wor id_0,
    input wire id_1,
    input tri id_2,
    output wor id_3,
    input tri1 id_4,
    output wire id_5,
    input wand id_6,
    input supply0 id_7,
    output tri id_8,
    input wand id_9
);
  if (1) begin : LABEL_0
    assign id_8 = 1;
  end
  wire id_11;
endmodule
module module_1 #(
    parameter id_13 = 32'd25,
    parameter id_19 = 32'd95
) (
    input tri0 id_0,
    input tri id_1,
    output tri id_2,
    input wor id_3,
    input wire id_4,
    input wire id_5,
    input wor id_6,
    input supply1 id_7,
    input tri0 id_8,
    output uwire id_9,
    input wire id_10,
    output tri id_11,
    input supply1 id_12,
    input uwire _id_13,
    output uwire id_14,
    input supply0 id_15,
    input wire id_16,
    output logic id_17
);
  wire _id_19;
  tri  id_20;
  assign id_20 = 1'd0;
  if (-1 * 1) begin : LABEL_0
    always id_17 <= 1;
  end
  generate
    supply1 [id_19 : 1] id_21;
  endgenerate
  assign id_21 = (-1);
  logic [id_19  +  id_13 : id_19] id_22 = -1;
  assign id_20 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_6,
      id_14,
      id_6,
      id_2,
      id_6,
      id_12,
      id_9,
      id_16
  );
  assign modCall_1.id_6 = 0;
  assign id_17 = id_20;
  struct packed {logic id_23;} id_24, id_25, id_26, id_27;
endmodule
