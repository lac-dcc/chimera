// Seed: 628867994
module module_0 (
    output tri1  id_0,
    input  tri1  id_1,
    output uwire id_2,
    output wand  id_3
);
  assign id_0 = id_1;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output wor id_0
    , id_10,
    input supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    input tri0 id_4,
    input uwire id_5,
    input wand id_6,
    input tri id_7,
    output wire id_8
);
  assign id_10 = -1;
  assign id_0  = id_6;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    input supply0 id_1,
    output logic id_2
);
  always @(posedge id_1) begin : LABEL_0
    id_2 <= id_1;
    id_2 <= id_1;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule
