// Seed: 945112757
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output wand id_2,
    output tri1 id_3,
    output supply0 id_4,
    input tri0 id_5,
    input wor id_6,
    output supply1 id_7
);
  logic id_9;
  always @(negedge id_5 or posedge ("" * id_1 - id_9)) begin : LABEL_0
    $unsigned(20);
    ;
    if (1 < 1) id_9 = 1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd55,
    parameter id_4 = 32'd39
) (
    input  wand  _id_0,
    output wand  id_1,
    output wand  id_2,
    input  uwire id_3,
    input  tri   _id_4,
    output wand  id_5,
    output tri1  id_6,
    output tri1  id_7
);
  localparam [id_0 : id_4  |  id_4] id_9 = 1;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_5,
      id_3,
      id_3,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
