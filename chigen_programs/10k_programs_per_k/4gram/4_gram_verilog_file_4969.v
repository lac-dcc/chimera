// Seed: 2091464984
module module_0 (
    input  tri  id_0,
    input  tri0 id_1,
    output tri  id_2,
    input  wor  id_3,
    input  tri1 id_4,
    output tri0 id_5
    , id_13,
    input  tri  id_6,
    input  wand id_7,
    output wire id_8,
    output tri  id_9,
    input  wire id_10,
    output tri0 id_11
);
  wire id_14;
  assign module_1.id_6 = 0;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input uwire id_2,
    output wand id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wor id_6
);
  assign id_5 = 1'b0;
  final $display(1);
  module_0 modCall_1 (
      id_6,
      id_1,
      id_5,
      id_2,
      id_6,
      id_0,
      id_1,
      id_1,
      id_0,
      id_5,
      id_2,
      id_4
  );
  always_ff @('b0 or posedge id_6) begin : LABEL_0$display
    ;
  end
endmodule
