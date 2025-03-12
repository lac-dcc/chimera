// Seed: 1663435962
module module_0 (
    input wand id_0,
    output tri1 id_1,
    input wor id_2,
    input tri1 id_3,
    input wand id_4,
    input tri id_5,
    input wor id_6,
    output wand id_7,
    output tri0 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input uwire id_11
);
  initial begin : LABEL_0
    @(posedge -1) $clog2(58);
    ;
  end
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd99
) (
    input wand id_0,
    input uwire id_1,
    output supply1 _id_2,
    output uwire id_3
);
  logic [-1 'b0 : -1 'b0 +  id_2] id_5;
  ;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1
  );
endmodule
