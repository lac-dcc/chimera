// Seed: 364396943
module module_0 (
    input tri  id_0,
    input tri0 id_1
);
  assign id_3 = 1;
  reg id_4;
  always #1
    if (1 && id_1) begin : LABEL_0
      #1;
      #1 #1;
    end else begin : LABEL_0
      id_4 <= id_3 == 1;
    end
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  tri   id_2,
    output tri0  id_3,
    input  tri   id_4,
    input  uwire id_5
);
  always disable id_7;
  module_0 modCall_1 (
      id_0,
      id_5
  );
  assign modCall_1.type_6 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    output logic id_1,
    input wire id_2,
    input logic id_3,
    input wand id_4,
    input logic id_5,
    output logic id_6
);
  always #0 begin : LABEL_0
    disable id_8;
    id_8 <= 1;
    begin : LABEL_0
      id_1 <= id_5;
      id_6 <= 0;
    end
    $display(1);
    $display(id_3, 1, id_3, 1, id_5);
  end
  nand primCall (id_6, id_2, id_4, id_8, id_3);
  module_0 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
