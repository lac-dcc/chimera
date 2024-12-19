// Seed: 3536655329
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5
);
  assign id_2 = id_3;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    input  wor   id_1,
    input  tri   id_2,
    output logic id_3,
    input  uwire id_4,
    output wand  id_5
);
  reg id_7;
  reg id_8;
  reg id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_0,
      id_4,
      id_1
  );
  reg id_10;
  always id_3 <= id_9;
  assign id_9 = 1;
  always id_5 = 1;
  assign id_9 = id_8;
  always begin : LABEL_0
    begin : LABEL_0
      id_10 <= 1;
    end
    id_7 <= 1;
    id_9 <= 1;
    id_8 <= id_7;
  end
  assign id_8 = 1;
  always begin : LABEL_0
    @(negedge id_7) id_5 = (id_2);
  end
  wire id_11, id_12;
endmodule
