// Seed: 2210273598
module module_0 (
    input tri id_0,
    input wor id_1,
    input wand id_2,
    output supply1 id_3,
    input supply1 id_4,
    input wire id_5
    , id_9,
    input wor id_6,
    input tri0 id_7
    , id_10
);
  id_11 :
  assert property (@(negedge ({id_10{1}})) id_11)
  else $unsigned(61);
  ;
  tri id_12 = 1, id_13 = id_12;
endmodule
module module_1 #(
    parameter id_8 = 32'd28
) (
    output logic id_0,
    output supply1 id_1,
    output supply1 id_2,
    input wor id_3,
    input tri id_4,
    input uwire id_5,
    output wor id_6,
    output wor id_7,
    input wor _id_8,
    input wand id_9,
    output tri0 id_10,
    output logic id_11,
    output tri id_12,
    input tri1 id_13,
    output wor id_14,
    output tri0 id_15,
    input supply0 id_16
);
  always @(posedge id_5 or posedge -1) begin : LABEL_0
    id_0  <= -1;
    id_11 <= id_9 & -1;
  end
  module_0 modCall_1 (
      id_5,
      id_4,
      id_16,
      id_10,
      id_4,
      id_16,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
  wire [ id_8 : 1] id_18;
  wire [-1 : id_8] id_19;
endmodule
