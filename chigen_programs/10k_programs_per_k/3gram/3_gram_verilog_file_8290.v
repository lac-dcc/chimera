// Seed: 3152338881
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4,
    input supply0 id_5
);
  string id_7 = "";
  tri id_8 = id_4;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    inout supply1 id_0,
    input supply1 id_1,
    input logic id_2,
    output logic id_3,
    input wand id_4,
    output wor id_5,
    input tri id_6
);
  always @(posedge (id_0) or posedge id_1) begin : LABEL_0
    id_3 <= id_2;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_0,
      id_6,
      id_0
  );
  assign id_3 = id_2;
endmodule
