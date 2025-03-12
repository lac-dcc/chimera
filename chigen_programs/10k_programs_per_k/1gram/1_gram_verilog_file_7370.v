// Seed: 3796751316
module module_0 (
    output uwire id_0,
    output wire id_1,
    output logic id_2
    , id_6,
    input supply1 id_3,
    input tri1 id_4
);
  always id_2 <= id_4;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    output logic id_5,
    input wire id_6,
    output wor id_7,
    output wor id_8,
    output wire id_9,
    input tri id_10,
    input tri id_11
);
  for (id_13 = id_4; 1; id_5 = {id_0}) begin : LABEL_0
    assign id_5 = id_10;
  end
  xnor primCall (id_8, id_1, id_10, id_13, id_0, id_3, id_4, id_6);
  module_0 modCall_1 (
      id_8,
      id_7,
      id_5,
      id_3,
      id_11
  );
endmodule
