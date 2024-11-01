// Seed: 1370980026
module module_0 ();
  wire id_1;
  module_2();
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2,
    output logic id_3
);
  reg id_5;
  reg id_6;
  nand (id_2, id_5, id_6);
  always_comb begin
    $display(id_5);
    if (id_1) id_5 <= 1;
    else begin
      id_3 <= id_0;
      id_6 = id_5;
    end
    id_5 = 1;
    id_2 <= id_1;
  end
  module_0();
  wire id_7;
  wire id_8;
endmodule
module module_2;
  assign id_1 = id_1;
  always begin
    $display(1 & id_1, id_1, 1);
  end
  assign id_1 = 1;
  wire id_2 = id_2;
  wire id_4;
endmodule
