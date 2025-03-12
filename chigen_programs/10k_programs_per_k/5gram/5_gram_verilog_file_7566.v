// Seed: 1293117545
module module_0 (
    input wor id_0,
    output wor id_1,
    input supply1 id_2,
    output tri1 id_3,
    output wand id_4,
    input tri id_5
);
  wire id_7;
  parameter id_8 = 1;
  wire id_9;
endmodule
module module_1 (
    output uwire id_0,
    output supply1 id_1,
    input tri id_2,
    output logic id_3,
    output uwire id_4,
    output wand id_5
);
  wire id_7;
  assign id_5 = id_2;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_0,
      id_5,
      id_2
  );
  assign modCall_1.id_4 = 0;
  always @(posedge -1 or -1) begin : LABEL_0
    if (id_5++) id_3 <= id_2;
  end
endmodule
