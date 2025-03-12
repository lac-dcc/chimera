// Seed: 3606358726
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wand id_2,
    input wor id_3,
    input wand id_4,
    input tri0 id_5,
    input supply1 id_6,
    output supply1 id_7
);
  wire id_9 = id_3;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd30
) (
    input tri id_0,
    input supply0 id_1,
    output tri id_2,
    input supply1 id_3,
    input wire id_4,
    input wire _id_5
    , id_9,
    input tri1 id_6,
    input uwire id_7
);
  logic [id_5 : 1] id_10;
  ;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_6,
      id_2
  );
  assign modCall_1.id_5 = 0;
  always @(negedge -1) begin : LABEL_0
    id_10 = id_7;
  end
endmodule
