// Seed: 3846577957
module module_0 (
    input  wand id_0,
    input  tri1 id_1,
    output tri0 id_2,
    input  tri0 id_3,
    output wand id_4
);
  always @(*) begin : LABEL_0
    #1;
    wait ("");
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    output tri0 id_5,
    output wor id_6,
    output supply1 id_7
);
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_6
  );
endmodule
