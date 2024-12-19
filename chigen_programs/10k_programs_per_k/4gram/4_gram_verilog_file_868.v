// Seed: 2343537589
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output wand id_2,
    input tri id_3,
    output tri1 id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7,
    input wire id_8,
    input wand id_9
);
  assign module_1.id_1 = 0;
  generate
    assign id_7 = 1 - 1;
  endgenerate
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wand id_3
);
  id_5 :
  assert property (@(posedge 1) !id_0)
  else $display(id_3, id_1);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0
  );
endmodule
