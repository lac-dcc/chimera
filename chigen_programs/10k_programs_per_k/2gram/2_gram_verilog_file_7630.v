// Seed: 1215541422
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input uwire id_2,
    input wand id_3,
    output supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output wor id_7,
    input wand id_8,
    output uwire id_9
);
  wire id_11;
  always begin : LABEL_0
    id_4 = 1;
  end
endmodule
module module_1 (
    output logic id_0,
    output wor   id_1,
    output logic id_2,
    output wire  id_3,
    input  wand  id_4,
    input  logic id_5,
    input  logic id_6
);
  reg id_8;
  always begin : LABEL_0
    id_2 <= 1 ? 1 : 1 ? 1 : id_6;
  end
  reg  id_9 = id_8;
  wire id_10;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.type_2 = 0;
  initial id_2 <= id_8;
  wire id_11;
endmodule
