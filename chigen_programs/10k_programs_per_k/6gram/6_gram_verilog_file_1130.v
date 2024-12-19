// Seed: 3747877466
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output wor id_2,
    input uwire id_3,
    output wand id_4,
    output tri id_5
);
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri1 id_3
);
  wire id_5;
  id_6(
      .id_0(1), .id_1(1)
  );
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_0,
      id_1,
      id_3
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    output supply0 id_1,
    input logic id_2,
    input supply0 id_3,
    output logic id_4,
    output wor id_5
);
  always @(posedge id_3) begin : LABEL_0
    id_4 <= id_2;
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
