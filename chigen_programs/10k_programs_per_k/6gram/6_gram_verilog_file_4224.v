// Seed: 2018682997
module module_0 #(
    parameter id_1 = 32'd26,
    parameter id_3 = 32'd97
);
  parameter id_1 = 1;
  logic [7:0][-1 'b0 : -1] id_2;
  logic _id_3;
  initial begin : LABEL_0
    $unsigned(id_1);
    ;
    id_2[1==id_3+:(id_1&1)] = id_3;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input wire id_2,
    input wor id_3,
    input wire id_4,
    input tri0 id_5,
    output wand id_6,
    input supply1 id_7,
    output tri0 id_8,
    input tri1 id_9,
    input tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wand id_13,
    input tri1 id_14
);
  assign id_1 = id_7#(
      .id_11("" & 1),
      .id_7 (1)
  );
  module_0 modCall_1 ();
endmodule
