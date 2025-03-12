// Seed: 1740699286
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input  wand id_2,
    output wand id_3
);
  assign id_1 = id_2;
endmodule
module module_1 #(
    parameter id_4 = 32'd11
) (
    output wire id_0,
    input wire id_1,
    input supply1 id_2,
    output tri id_3,
    input tri1 _id_4,
    input wand id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri id_8,
    output supply1 id_9,
    output wand id_10,
    output wor id_11,
    input wire id_12,
    input wire id_13,
    output logic id_14,
    input tri id_15,
    output supply0 id_16,
    input uwire id_17,
    output uwire id_18,
    input uwire id_19,
    output wor id_20,
    output wor id_21,
    input uwire id_22,
    output logic id_23
);
  wire id_25;
  module_0 modCall_1 (
      id_0,
      id_18,
      id_13,
      id_6
  );
  assign modCall_1.id_0 = 0;
  always_latch @(posedge -1) begin : LABEL_0
    if (1)
      if (1) begin : LABEL_1
        id_23 = 1;
      end else #1 id_14 = -1;
  end
  final $clog2(36);
  ;
  wire id_26, id_27;
  wire id_28;
  logic [id_4 : id_4] id_29 = -1 | 1;
  wire [1 : -1] id_30;
endmodule
