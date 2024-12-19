// Seed: 828931881
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output tri1  id_3,
    input  tri   id_4,
    output tri0  id_5
);
  wire id_7;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    output supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output supply1 id_5
);
  reg id_7;
  `define pp_8 (  pp_9  ,  pp_10  )  0
  always @(posedge id_7) begin : LABEL_0
    id_0 <= id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_3,
      id_2
  );
  assign id_2 = 1'h0;
  assign `pp_9[1] = id_3#(.id_1(1));
  initial begin : LABEL_0
    id_7 = 1'h0;
    id_2 = id_3;
  end
endmodule
