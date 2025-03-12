// Seed: 721068810
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    output uwire id_3,
    input uwire id_4,
    input wire id_5,
    output wand id_6,
    input tri id_7,
    input uwire id_8,
    input tri0 id_9
);
  wire [1 'b0 : 1] id_11 = -1;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd59,
    parameter id_7 = 32'd28,
    parameter id_8 = 32'd71
) (
    input wand id_0,
    output logic id_1,
    output supply0 id_2,
    input wire id_3,
    input wire _id_4,
    output supply1 id_5,
    input wand id_6,
    input uwire _id_7,
    input wor _id_8
    , id_11,
    input uwire id_9
);
  logic [id_4 : (  id_7  )] id_12;
  assign id_11[id_8] = $realtime ? id_12 : -1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_0,
      id_2,
      id_3,
      id_3,
      id_5,
      id_0,
      id_0,
      id_0
  );
  assign id_12 = -1'b0;
  xor primCall (id_2, id_6, id_3, id_12, id_9);
  assign id_2  = -1;
  assign id_11 = id_6;
  always @(negedge 1 or posedge id_6) begin : LABEL_0
    if (1'b0) id_1 = -1;
  end
endmodule
