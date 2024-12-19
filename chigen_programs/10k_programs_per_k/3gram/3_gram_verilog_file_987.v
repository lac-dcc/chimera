// Seed: 1188955599
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input wor id_2,
    output wor id_3,
    output supply0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    output tri1 id_8,
    input tri1 id_9
);
  wire id_11;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    output wor id_2,
    output supply0 id_3
);
  uwire id_5 = id_0;
  not primCall (id_2, id_0);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_5,
      id_3,
      id_3,
      id_5,
      id_0,
      id_5,
      id_3,
      id_5
  );
  assign modCall_1.type_4 = 0;
endmodule
module module_2 #(
    parameter id_2 = 32'd49,
    parameter id_3 = 32'd99
);
  for (id_1 = 1; 1'b0; id_1 = id_1) begin : LABEL_0
    defparam id_2.id_3 = id_2;
  end
  assign module_0.id_9 = 0;
endmodule
