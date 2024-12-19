// Seed: 2209736075
module module_0;
  wire id_2;
  assign module_1.id_3 = 0;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wor id_3;
  module_0 modCall_1 ();
  assign id_2 = id_3;
  assign id_3 = 1;
endmodule
module module_2 (
    input  wand  id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  logic id_3,
    output logic id_4
);
  reg id_6;
  id_7(
      .id_0((id_4 && id_6)), .id_1(1), .id_2(id_2), .id_3(id_2)
  );
  and primCall (id_1, id_2, id_3, id_6, id_7);
  initial begin : LABEL_0
    id_6 <= (1'b0);
    $display(1 & 1, id_2 & id_2);
    id_4 = #1 id_3;
    id_4 <= 1;
  end
  module_0 modCall_1 ();
endmodule
