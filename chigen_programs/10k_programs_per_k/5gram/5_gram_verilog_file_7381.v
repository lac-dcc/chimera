// Seed: 1759633024
module module_0 (
    output tri id_0,
    input wand id_1,
    output supply1 id_2,
    input wor id_3,
    input tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output tri1 id_8
);
  logic id_10;
  ;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output supply0 id_2,
    output logic id_3,
    output logic id_4,
    input tri1 id_5,
    output wor id_6
);
  logic [7:0] id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_0,
      id_0,
      id_6,
      id_5,
      id_5,
      id_6
  );
  assign id_6 = 1'b0;
  always @(posedge id_8[-1]) begin : LABEL_0
    id_4 <= id_8;
  end
  final begin : LABEL_1
    id_3 = id_0;
  end
  assign id_8 = id_4++;
  assign id_8 = id_5;
  assign id_6 = id_0;
endmodule
