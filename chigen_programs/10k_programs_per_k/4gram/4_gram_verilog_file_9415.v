// Seed: 2011368650
module module_0 (
    output supply0 id_0,
    output tri0 id_1
);
  wire id_3;
  ;
  assign id_3 = -1;
endmodule
module module_1 #(
    parameter id_15 = 32'd74,
    parameter id_5  = 32'd45,
    parameter id_6  = 32'd0
) (
    input tri id_0,
    output supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    output wor id_4,
    input supply1 _id_5,
    output wand _id_6,
    output logic id_7,
    output supply0 id_8,
    input supply0 id_9
    , id_17,
    output wor id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13,
    input uwire id_14,
    input tri0 _id_15
);
  logic [id_6 : 1] id_18;
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_10
  );
  assign modCall_1.id_1 = 0;
  always @(id_13 or posedge -1) begin : LABEL_0
    id_7 <= id_13;
  end
  integer [(  id_5  ) : id_15] \id_20 = id_9;
  logic id_21[id_5 : -1];
  always disable id_22;
  and primCall (id_10, id_3, id_9, id_12, id_18, id_19, id_14, id_0, id_13, id_11, id_17, id_2);
  logic id_23;
  ;
endmodule
