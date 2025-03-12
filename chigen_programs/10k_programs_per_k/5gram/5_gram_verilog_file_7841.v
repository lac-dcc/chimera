// Seed: 640291707
module module_0 (
    output supply1 id_0,
    input tri0 id_1
);
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input supply1 id_2,
    output uwire id_3,
    output supply0 id_4,
    output wor id_5,
    input wand id_6,
    output supply1 id_7
);
  tri id_9 = -1'd0;
  xor primCall (id_1, id_9, id_2, id_6, id_0);
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_6 = 32'd14,
    parameter id_7 = 32'd14
) (
    input wire id_0,
    input uwire id_1,
    output tri0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply0 _id_6,
    input tri1 _id_7,
    input supply1 id_8
);
  logic id_10;
  ;
  wire id_11;
  reg [id_6 : id_7] id_12;
  module_0 modCall_1 (
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    id_12 = #(id_1) id_8;
  end
endmodule
