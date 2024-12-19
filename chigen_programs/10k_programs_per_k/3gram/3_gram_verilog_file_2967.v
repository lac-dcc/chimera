// Seed: 463436491
module module_0 (
    input  tri1 id_0,
    input  wand id_1,
    output wor  id_2
);
  tri id_4;
  tri id_5;
  always_latch @(posedge id_1) begin : LABEL_0
    id_4 = id_0;
  end
  assign id_2 = id_0;
  assign id_4 = 1;
  supply1 id_6 = id_0;
  assign id_4 = id_5;
  supply1 id_7 = 1;
  assign id_7 = id_6;
  wire id_8;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    inout tri1 id_3,
    input wor id_4,
    output tri id_5,
    input supply1 id_6,
    output supply0 id_7,
    output wand id_8,
    input wire id_9,
    input wand id_10
);
  assign id_7 = 1;
  xnor primCall (id_7, id_0, id_2, id_10, id_4, id_6, id_9, id_3);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_7
  );
endmodule
