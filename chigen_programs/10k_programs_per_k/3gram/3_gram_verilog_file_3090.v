// Seed: 2236135900
module module_0 ();
  wire id_2;
  assign id_1 = id_1;
endmodule
module module_1;
  assign id_1 = id_1;
  module_0 modCall_1 ();
  tri id_3 = 1;
  id_4(
      .id_0(id_1), .id_1(1'b0), .id_2(), .id_3(1)
  );
endmodule
module module_2 (
    input logic id_0,
    input tri1  id_1
);
  initial begin : LABEL_0
    id_3 <= ~id_1;
    $display(1, 1, id_3);
    id_3 <= id_0;
    id_3 <= 1 - (id_0);
    id_3 <= id_0;
  end
  module_0 modCall_1 ();
endmodule
