// Seed: 947180644
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input wor id_2,
    output wire id_3,
    input tri0 id_4,
    output wire id_5,
    output tri0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input wand id_9
);
  wire id_11;
  assign id_1 = -1'd0;
  assign id_1 = 1'b0;
  wire [1 : 1] id_12, id_13, id_14;
endmodule
module module_1 #(
    parameter id_11 = 32'd26,
    parameter id_8  = 32'd94,
    parameter id_9  = 32'd16
) (
    output tri0 id_0,
    output tri1 id_1,
    input wor id_2,
    output tri id_3[-1 'h0 : id_9  *  id_8],
    input wand id_4,
    input tri0 id_5,
    output tri id_6,
    output tri id_7,
    input wor _id_8,
    input tri _id_9,
    input wand id_10,
    input supply1 _id_11,
    output supply1 id_12,
    output tri0 id_13,
    input tri id_14,
    output logic id_15,
    output wire id_16,
    input tri id_17,
    output wire id_18,
    input tri0 id_19
);
  wire id_21;
  assign id_0 = id_21;
  wire [id_11 : -1] id_22;
  module_0 modCall_1 (
      id_0,
      id_12,
      id_4,
      id_3,
      id_5,
      id_6,
      id_18,
      id_10,
      id_2,
      id_2
  );
  assign modCall_1.id_6 = 0;
  always_latch begin : LABEL_0
    @(posedge id_2 or negedge 1'b0 or posedge id_11 or posedge id_4)
    id_15 <= ((1'h0)) + id_10 || "";
  end
  logic id_23, id_24;
  ;
  assign id_24 = -1;
  parameter id_25 = -1;
endmodule
