// Seed: 3803054704
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output tri1 id_7,
    output logic id_8
);
  always @(posedge id_1) begin : LABEL_0
    disable id_10;
    id_8 <= {id_4 != ""};
  end
  assign module_1.id_1 = 0;
  wire id_11;
  ;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    output logic id_2,
    input supply1 id_3
);
  initial begin : LABEL_0
    id_2 = -1;
    $unsigned(25);
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_2
  );
endmodule
