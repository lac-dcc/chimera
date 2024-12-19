// Seed: 1229457985
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri id_2
);
  initial begin : LABEL_0
    id_4 <= id_4 * 1 * id_1;
    $display(id_0 == id_1);
  end
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    input wand id_4,
    input tri id_5,
    input wire id_6,
    input supply1 id_7,
    input supply0 id_8
);
  always #1 begin : LABEL_0
    id_0 <= id_5 == 1;
    $display(~1 == 1'b0);
  end
  supply1 id_10 = id_8;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4
  );
  assign id_3 = ~{id_5, 1};
  id_11(
      .id_0(), .id_1(id_4), .id_2(id_0)
  );
endmodule
