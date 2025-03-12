// Seed: 2401784665
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply0 id_3,
    output supply0 id_4
    , id_11,
    output wor id_5,
    input wor id_6,
    input tri0 id_7,
    input tri0 id_8,
    output tri0 id_9
);
  logic id_12;
  ;
  assign id_5 = id_3;
endmodule
module module_1 #(
    parameter id_6 = 32'd11
) (
    input wire id_0,
    output wire id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    output supply1 id_5,
    input supply0 _id_6,
    input supply1 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri0 id_11
);
  if (1) begin : LABEL_0
    logic [id_6 : ""] id_13 = id_11 - $unsigned(93);
    ;
  end else begin : LABEL_1
    wire id_14;
  end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_7,
      id_9,
      id_8,
      id_1,
      id_10,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_4 = 0;
  parameter id_15 = -1;
  parameter id_16 = -1;
endmodule
