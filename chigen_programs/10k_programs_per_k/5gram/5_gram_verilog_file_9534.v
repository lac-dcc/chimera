// Seed: 1772955257
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri id_5
);
  reg id_7;
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_7 <= id_7;
    end
  end
  always force id_7 = id_5;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply0 id_6,
    input uwire id_7
);
  assign id_1 = id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_0,
      id_3,
      id_4
  );
  assign id_6 = 1;
endmodule
