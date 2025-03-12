// Seed: 1943970643
module module_0 (
    input  tri1  id_0,
    output wand  id_1,
    input  wor   id_2,
    input  uwire id_3
);
  assign id_1 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd21,
    parameter id_5 = 32'd48
) (
    input  wire  id_0,
    output uwire id_1,
    input  wor   _id_2,
    input  wand  id_3
);
  if (-1'b0) begin : LABEL_0
    assign id_1 = id_3;
    assign id_1 = id_3;
  end else assign id_1 = 1;
  buf primCall (id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0
  );
  wire _id_5;
  wire [id_5 : id_5  -  id_2] id_6;
endmodule
