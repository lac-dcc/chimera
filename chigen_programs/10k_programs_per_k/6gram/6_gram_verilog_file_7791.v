// Seed: 3621690678
module module_0 (
    input wor id_0,
    output wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input wand id_4,
    output supply0 id_5,
    input tri1 id_6,
    output wor id_7,
    output wire id_8
);
  assign id_1 = id_4;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input tri0 id_2,
    output logic id_3,
    input uwire id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri id_7,
    input wand id_8,
    input tri1 id_9,
    output wor id_10,
    input wor id_11,
    output supply1 id_12
);
  always @(posedge id_9 or id_1) begin : LABEL_0
    id_3 <= id_11;
    id_0 <= id_1;
    assert (id_8);
  end
  module_0 modCall_1 (
      id_11,
      id_10,
      id_8,
      id_5,
      id_11,
      id_12,
      id_7,
      id_12,
      id_10
  );
  assign id_0 = id_2;
endmodule
