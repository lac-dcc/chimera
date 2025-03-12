// Seed: 1084374195
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri0 id_2
);
  logic id_4;
endmodule
module module_1 (
    output logic id_0,
    input wand id_1,
    input wand id_2,
    input tri0 id_3,
    input tri0 id_4,
    output supply1 id_5
);
  parameter id_7 = ~1;
  always_ff begin : LABEL_0
    begin : LABEL_1
      id_0 <= -1'b0;
    end
  end
  assign id_0 = (-1'b0);
  assign id_5 = id_7 & id_2;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
