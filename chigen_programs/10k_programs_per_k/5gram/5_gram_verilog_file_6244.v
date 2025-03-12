// Seed: 3406792664
module module_0 (
    input uwire id_0,
    input wor id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wire id_4,
    output supply0 id_5,
    input supply0 id_6,
    output supply1 id_7,
    output tri id_8,
    output wor id_9,
    output supply0 module_0,
    input wire id_11,
    input supply1 id_12,
    input tri1 id_13,
    output uwire id_14,
    input uwire id_15,
    input wand id_16
    , id_25,
    input wor id_17,
    input wor id_18,
    input supply0 id_19,
    input tri0 id_20,
    input tri id_21,
    input uwire id_22,
    input wire id_23
);
  localparam id_26 = 1;
  wire id_27;
endmodule
module module_1 #(
    parameter id_13 = 32'd48,
    parameter id_7  = 32'd27
) (
    output logic id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    input tri id_5,
    input wand id_6,
    input wor _id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wire id_10,
    output wire id_11,
    output supply0 id_12,
    input tri _id_13,
    input tri id_14,
    output tri0 id_15,
    input tri0 id_16,
    input uwire id_17,
    input tri0 id_18,
    input wand id_19
);
  wire [-1 : !  id_13] id_21;
  logic [1 : id_7] id_22;
  module_0 modCall_1 (
      id_16,
      id_6,
      id_11,
      id_3,
      id_5,
      id_15,
      id_5,
      id_11,
      id_11,
      id_12,
      id_15,
      id_4,
      id_10,
      id_19,
      id_15,
      id_14,
      id_9,
      id_5,
      id_10,
      id_6,
      id_5,
      id_4,
      id_5,
      id_4
  );
  assign id_22 = -1;
  always @(posedge id_14) begin : LABEL_0
    id_0 <= -1;
  end
endmodule
