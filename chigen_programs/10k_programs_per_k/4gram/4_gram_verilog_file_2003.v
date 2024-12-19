// Seed: 2490961865
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wand id_2,
    input tri id_3,
    output tri1 id_4,
    input wor id_5,
    output tri id_6,
    output supply1 id_7
);
  xor primCall (id_2, id_3, id_5, id_9);
  wire id_9 = id_3, id_10;
  module_2 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    deassign id_6;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input uwire id_2,
    output tri0 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3
  );
endmodule
module module_2 ();
  wire id_1 = id_1;
  assign module_0.id_10 = 0;
endmodule
