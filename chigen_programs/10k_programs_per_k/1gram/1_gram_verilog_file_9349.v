// Seed: 2691857642
module module_0 (
    output wand id_0,
    output supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri id_6
);
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1,
    output tri1  id_2,
    input  tri1  id_3,
    output tri0  id_4,
    output logic id_5,
    input  wand  id_6,
    output logic id_7,
    output wand  id_8
);
  always if (-1 + -1'b0) id_7 <= id_6;
  xnor primCall (id_5, id_0, id_3, id_1);
  final begin : LABEL_0
    @(posedge id_6) @(posedge id_3 & id_1) id_5 <= -1;
  end
  module_0 modCall_1 (
      id_4,
      id_8,
      id_4,
      id_0,
      id_3,
      id_3,
      id_2
  );
endmodule
