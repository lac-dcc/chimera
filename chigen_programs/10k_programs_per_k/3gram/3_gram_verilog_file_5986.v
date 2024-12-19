// Seed: 618769711
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output supply0 id_3,
    input tri id_4,
    input tri1 id_5,
    output tri1 id_6
);
  final begin : LABEL_0
    #1;
  end
  assign module_1.type_3 = 0;
  supply0 id_8 = id_1;
  assign id_2 = id_0;
endmodule
module module_1 (
    input  wor   id_0,
    input  wor   id_1,
    input  logic id_2,
    input  wire  id_3,
    output logic id_4,
    output tri0  id_5
);
  always_ff @(*) id_4 <= id_0 == 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_5,
      id_5,
      id_0,
      id_3,
      id_5
  );
  assign id_4 = id_2;
endmodule
