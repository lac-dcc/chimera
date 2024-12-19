// Seed: 2534852533
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input tri id_2
);
  wire id_4;
  buf primCall (id_1, id_0);
  module_2 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.type_0 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input wand id_2
    , id_7,
    input tri0 id_3,
    output uwire id_4,
    output wor id_5
);
  wire id_8;
  always @(posedge 1) begin : LABEL_0
    id_4 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3
  );
endmodule
module module_2 (
    output supply1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wand id_3,
    output wor id_4
);
  always @(*) #1 $display;
endmodule
