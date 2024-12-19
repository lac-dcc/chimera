// Seed: 3029193687
module module_0 (
    id_1
);
  output wire id_1;
  id_2(
      .id_0(1)
  );
  assign module_2.id_1 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0
);
  logic id_2;
  always begin : LABEL_0
    id_2 <= 1;
    id_2 = id_2;
    if (id_2)
      fork
      join
    id_0 <= id_2;
    $display(1, id_2);
    id_2 = id_2;
    id_0 <= 1'b0;
  end
  wire id_3;
  module_0 modCall_1 (id_3);
endmodule
module module_2;
  assign id_1#(
      .id_1((1'b0) == 1),
      .id_1(1),
      .id_1(1)
  ) = 1;
  module_0 modCall_1 (id_1);
endmodule
