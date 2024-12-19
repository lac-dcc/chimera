// Seed: 113384704
module module_0 (
    input uwire id_0,
    input tri   id_1
);
  assign id_3 = id_0;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output wand id_0,
    output tri id_1,
    input tri0 id_2,
    output wire id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri id_6
    , id_9,
    input supply1 id_7
);
  assign id_0 = 1;
  xnor primCall (id_1, id_9, id_2, id_5, id_6, id_7, id_4);
  module_0 modCall_1 (
      id_4,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    output wire id_0,
    input uwire id_1,
    input wor id_2,
    output logic id_3,
    input tri1 id_4,
    input supply0 id_5,
    output tri1 id_6,
    output tri id_7,
    input wand id_8
);
  always_comb @(posedge 1) begin : LABEL_0
    id_3 <= 1'h0;
    wait (id_4);
  end
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
