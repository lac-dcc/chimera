// Seed: 2252351663
module module_0 (
    output supply0 id_0,
    input  uwire   id_1,
    input  uwire   id_2
);
  assign id_0 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output tri id_2,
    output uwire id_3,
    output tri1 id_4,
    input wire id_5,
    input supply1 id_6,
    input wor id_7
);
  generate
    assign id_2 = 1'b0;
  endgenerate
  xnor primCall (id_4, id_6, id_0, id_7);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2;
  always @(posedge id_1) disable id_2;
endmodule
