// Seed: 2714764506
module module_0 (
    output logic id_0,
    input  tri1  id_1,
    input  uwire id_2
);
  id_4 :
  assert property (@(posedge {id_1{-1'b0}}) -1) id_0 <= 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd17
) (
    input wor id_0,
    input supply0 id_1["" : id_8],
    input tri0 id_2,
    output supply0 id_3,
    input wor id_4,
    output wor id_5,
    output logic id_6,
    input uwire id_7,
    input wire _id_8,
    input uwire id_9,
    output tri id_10,
    output supply1 id_11,
    input tri id_12,
    output tri0 id_13,
    output uwire id_14,
    input tri id_15,
    output tri1 id_16,
    input supply0 id_17,
    output logic id_18,
    input tri1 id_19,
    input tri1 id_20,
    input wor id_21,
    output supply1 id_22,
    input wor id_23,
    output wire id_24,
    output uwire id_25,
    output supply0 id_26,
    output tri0 id_27,
    output tri0 id_28
);
  assign id_24 = {id_2 <-> id_19, 1, (-1), 1'b0};
  logic id_30;
  ;
  logic id_31;
  always_comb id_18 = id_15;
  module_0 modCall_1 (
      id_18,
      id_15,
      id_2
  );
  assign modCall_1.id_2 = 0;
  parameter id_32 = 1;
  reg id_33;
  final
    @(negedge (-1'h0)) begin : LABEL_0
      id_6  = id_31;
      id_33 = -1;
    end
endmodule
