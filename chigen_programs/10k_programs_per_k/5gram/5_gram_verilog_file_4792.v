// Seed: 3126091657
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wire id_2,
    input uwire id_3,
    output supply0 id_4,
    input wand id_5,
    output tri id_6,
    output wand id_7,
    input uwire id_8,
    input uwire id_9,
    output tri id_10,
    output wire id_11,
    input wand id_12,
    output wand id_13,
    input uwire id_14,
    input wand id_15
);
  logic id_17 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd22
) (
    output tri1 id_0,
    input tri id_1,
    input wand id_2,
    input supply0 id_3,
    output logic id_4,
    input wand id_5,
    input supply1 _id_6,
    input tri1 id_7
);
  logic id_9;
  ;
  always @(posedge id_2) begin : LABEL_0
    id_4 <= -1;
  end
  logic id_10;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_10,
      id_10,
      id_0,
      id_7,
      id_0,
      id_2,
      id_1
  );
  final $clog2(83);
  ;
  logic [7:0][1 : !  id_6] id_11;
  assign #id_12 id_11[-1!=?1] = id_5;
  assign id_11 = id_7.id_10;
endmodule
