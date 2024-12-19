// Seed: 986129880
module module_0 (
    input supply1 id_0,
    input tri id_1
);
endmodule
module module_1 (
    input  supply1 id_0,
    output logic   id_1
);
  wand id_3;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.type_0 = 0;
  always_ff id_1 <= 1'b0;
  assign id_3 = id_0;
endmodule
module module_2 (
    input  logic id_0,
    input  logic id_1,
    input  wand  id_2,
    input  uwire id_3,
    output tri0  id_4
);
  assign id_4 = id_2;
  logic id_6 = 1;
  nand primCall (id_4, id_2, id_1, id_3);
  module_0 modCall_1 (
      id_2,
      id_2
  );
  assign modCall_1.type_0 = 0;
  assign id_6 = id_0;
  always begin : LABEL_0
    assign id_4 = id_6;
    deassign id_4;
    $display;
    id_6 = id_1;
  end
endmodule
