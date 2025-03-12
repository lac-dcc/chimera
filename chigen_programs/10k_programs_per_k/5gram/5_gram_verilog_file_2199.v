// Seed: 2223564784
module module_0 (
    output wire id_0,
    output logic id_1,
    output wire id_2,
    output wor id_3,
    output tri1 id_4,
    input tri id_5,
    output wire id_6,
    input tri1 id_7,
    output supply1 id_8,
    output wire id_9,
    output tri1 id_10,
    output tri0 id_11
    , id_16,
    input wor id_12,
    input wire id_13,
    input tri id_14
);
  always @(negedge id_7) begin : LABEL_0
    id_1 <= #1 id_16 + 1 + 1;
  end
  wire id_17;
  assign id_0 = id_12;
  assign id_3 = id_12;
endmodule
module module_1 #(
    parameter id_0  = 32'd26,
    parameter id_12 = 32'd50
) (
    input uwire _id_0,
    output tri id_1,
    input tri0 id_2,
    output wor id_3,
    input tri1 id_4,
    output logic id_5,
    output wor id_6,
    output logic id_7,
    input wire id_8,
    input supply1 id_9,
    input tri1 id_10,
    input uwire id_11,
    input tri1 _id_12,
    output wire id_13,
    input supply1 id_14,
    input wire id_15
);
  wire [id_12  +  1  -  id_0 : -1] id_17;
  assign id_1 = -1;
  logic id_18;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_3,
      id_1,
      id_10,
      id_13,
      id_4,
      id_1,
      id_13,
      id_3,
      id_6,
      id_9,
      id_11,
      id_10
  );
  assign modCall_1.id_5 = 0;
  wire id_19;
  ;
  always @(posedge -1) begin : LABEL_0
    id_5 <= 1'b0;
    id_7 <= -1;
  end
endmodule
