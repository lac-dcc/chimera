// Seed: 3825773981
module module_0 (
    input tri1 id_0,
    input tri1 id_1
);
  wire id_3;
  ;
  assign module_2.id_4 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd54
) (
    output tri0 id_0
    , _id_6,
    output tri0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output supply0 id_4
);
  wire id_7;
  wire [1 : id_6] id_8;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
  generate
    wire id_9;
  endgenerate
endmodule
module module_2 (
    input wor id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    output tri0 id_4,
    input wand id_5,
    input wire id_6
);
  parameter id_8 = 1;
  and primCall (id_2, id_8, id_3, id_1);
  always @(*)
    if (-1) begin : LABEL_0
      $signed(24);
      ;
    end
  module_0 modCall_1 (
      id_1,
      id_5
  );
endmodule
