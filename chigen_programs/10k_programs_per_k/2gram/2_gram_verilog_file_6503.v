// Seed: 4243438199
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output wor id_2,
    input supply1 id_3,
    output tri id_4,
    input tri0 id_5,
    output tri id_6,
    input wor id_7,
    output tri1 id_8
);
  tri0 id_10;
  assign id_10 = 1;
  assign module_1.id_3 = 0;
  wire id_11;
endmodule
module module_1 (
    output wor id_0,
    input logic id_1,
    input wand id_2,
    input supply0 id_3,
    output logic id_4,
    output logic id_5,
    input tri id_6,
    input uwire id_7,
    input supply0 id_8,
    input logic id_9,
    input supply0 id_10
);
  always begin : LABEL_0
    id_5 <= 1'd0 - id_6;
  end
  reg id_12;
  assign id_4 = 1;
  id_13 :
  assert property (@(posedge id_0++) id_3)
  else;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_13,
      id_3,
      id_13,
      id_13,
      id_0,
      id_13,
      id_13
  );
  assign id_0 = 1;
  assign id_0 = id_6;
  always begin : LABEL_0
    if (1'b0) id_5 <= id_9;
    else id_12 <= id_1;
    id_4 <= 1;
    cover ((id_10));
    id_4 <= id_8 == 1;
    id_4 = 1;
  end
endmodule
