// Seed: 993208045
program module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2
);
endprogram
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output tri1 id_2,
    output logic id_3,
    input tri1 id_4,
    input wor id_5,
    input wire id_6,
    input tri id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri id_10
);
  assign id_2 = id_7 + 1 - id_8;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1
  );
  assign modCall_1.type_0 = 0;
  always begin : LABEL_0
    id_3 <= 1;
    $display(1 || 1 || 1);
    id_3 <= 1;
  end
endmodule
