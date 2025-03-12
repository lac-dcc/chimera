// Seed: 5549770
program module_0 ();
  logic id_1 = 1;
endprogram
module module_1 #(
    parameter id_0 = 32'd0,
    parameter id_2 = 32'd45,
    parameter id_4 = 32'd82
) (
    input tri1 _id_0,
    output logic id_1,
    input wor _id_2,
    output tri id_3,
    output wand _id_4,
    output supply1 id_5,
    input supply0 id_6,
    output logic id_7,
    input tri0 id_8
);
  for (id_10 = id_8; id_10[-1]; id_7 = id_10 <-> id_8) begin : LABEL_0
    initial begin : LABEL_1
      id_1 <= id_2;
      id_7 = id_6;
    end
  end
  logic id_11[id_4 : 1];
  logic [id_2  -  id_0  !=  -1 : 1] id_12;
  assign id_10 = id_2;
  assign id_1  = id_11;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  generate
    assign id_11[-1] = id_0;
  endgenerate
  assign id_10 = ~id_11;
endmodule
