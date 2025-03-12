// Seed: 3121892001
module module_0;
endmodule
module module_1 #(
    parameter id_4 = 32'd26
) (
    input  tri   id_0,
    output uwire id_1,
    output logic id_2,
    input  wor   id_3,
    input  wor   _id_4,
    output uwire id_5,
    input  uwire id_6,
    input  wand  id_7,
    input  wire  id_8,
    input  wor   id_9
);
  always @(posedge id_4) begin : LABEL_0
    id_2 <= id_9;
    if (1) id_2 <= 1;
  end
  module_0 modCall_1 ();
  xor primCall (id_1, id_3, id_6, id_7, id_8, id_9);
  wire id_11;
  wire [id_4 : 1 'b0] id_12;
endmodule
