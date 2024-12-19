// Seed: 548493057
module module_0 (
    input wor id_0,
    inout uwire id_1,
    input wand id_2,
    input supply0 id_3,
    output wor id_4,
    output wand id_5,
    input wor id_6,
    input supply0 id_7,
    output tri id_8,
    input wand id_9,
    input tri1 id_10,
    input tri1 id_11,
    output tri id_12,
    input wire id_13,
    input wor id_14,
    input tri id_15,
    input supply0 id_16
);
  assign id_12 = id_1;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  tri   id_2,
    input  wor   id_3,
    input  tri   id_4
);
  wand id_6;
  supply1 id_7;
  assign id_7 = (1);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_6,
      id_6,
      id_3,
      id_2,
      id_6,
      id_2,
      id_1,
      id_1,
      id_1
  );
  uwire id_8;
  always id_0 <= 1;
  wand id_9 = 1;
  always begin : LABEL_0
    begin : LABEL_0
      begin : LABEL_0
        id_9 = 1'h0;
      end
    end
  end
  assign id_8 = id_4;
  assign id_6 = id_4;
  assign id_8 = 1 - id_4;
  wire id_10;
  wire id_11, id_12;
endmodule
