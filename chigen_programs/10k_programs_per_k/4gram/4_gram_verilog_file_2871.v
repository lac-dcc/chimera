// Seed: 2018984211
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    output wor id_6,
    output wor id_7,
    output supply0 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri1 id_11,
    input supply1 id_12
);
  logic id_14;
  assign module_1.id_5 = 0;
  always @(posedge id_1 or(-1)) begin : LABEL_0
    wait (id_12 & 1 & -1 + -1);
  end
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri id_4,
    input wand id_5,
    input wor id_6
);
  always @(posedge 1) begin : LABEL_0
    id_1 <= id_5;
  end
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_0,
      id_5,
      id_5
  );
  assign id_4 = -1 == id_5;
endmodule
