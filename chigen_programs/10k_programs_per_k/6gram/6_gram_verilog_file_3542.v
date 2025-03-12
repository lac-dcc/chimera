// Seed: 2083079681
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    output supply0 id_6,
    output wor id_7
);
  assign id_5 = -1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    output uwire id_2,
    output logic id_3,
    output uwire id_4,
    output wand id_5,
    input wand id_6
    , id_9,
    input uwire id_7
);
  always @* begin : LABEL_0
    if (1'b0) id_3 <= id_7;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_7,
      id_7,
      id_6,
      id_5,
      id_5,
      id_1
  );
endmodule
