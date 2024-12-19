// Seed: 1184052307
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    input supply0 id_5
);
  assign id_3 = id_5;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    output logic id_2,
    output uwire id_3,
    input  logic id_4,
    output logic id_5,
    input  tri   id_6,
    input  tri0  id_7
);
  always @(posedge 1) begin : LABEL_0
    id_2 <= id_4;
    id_5 <= id_4;
  end
  module_0 modCall_1 (
      id_3,
      id_0,
      id_6,
      id_3,
      id_3,
      id_6
  );
  assign id_2 = id_4;
endmodule
