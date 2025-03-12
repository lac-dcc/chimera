// Seed: 234878281
module module_0 (
    input  tri0 id_0,
    input  wor  id_1,
    output tri  id_2,
    output tri  id_3
);
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd69
) (
    output supply0 id_0,
    input wire id_1,
    output logic id_2,
    input tri0 id_3,
    input wire id_4,
    input wand _id_5,
    output tri0 id_6
);
  generate
    for (id_8 = id_5; id_8[-1!=1 : id_5]; id_2 = -1) begin : LABEL_0
      always @(-1'b0 or posedge id_5)
        if (1) assign id_6 = id_5;
        else assign id_0 = id_5;
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
