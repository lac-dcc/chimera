// Seed: 1508836795
module module_0;
  always @(posedge id_1) repeat (id_1 == 1) #1 repeat (1) #1;
  id_2(
      .id_0(id_1)
  );
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output wire id_8,
    input tri1 id_9,
    input wand id_10,
    output uwire id_11
);
  nor primCall (id_11, id_4, id_5, id_6, id_7, id_9);
  assign id_8 = 1;
  module_0 modCall_1 ();
endmodule
