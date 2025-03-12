// Seed: 2249419753
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  assign module_1._id_3 = 0;
  output wire id_2;
  output wire id_1;
  generate
    for (id_8 = id_8 ~^ id_3; id_5(id_8); id_8 = -1) begin : LABEL_0
      logic id_9;
      ;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_3 = 32'd99
) (
    output supply1 id_0,
    input wand id_1,
    input uwire id_2,
    input wand _id_3,
    output tri0 id_4
);
  wire [id_3 : 1] id_6;
  wire id_7;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6
  );
  assign id_7 = id_2;
endmodule
