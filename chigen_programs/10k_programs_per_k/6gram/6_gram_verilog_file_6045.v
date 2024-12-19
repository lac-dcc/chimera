// Seed: 2959131464
module module_0;
  always @(posedge id_1 == 1) begin : LABEL_0
    id_1 = id_1;
    id_1 <= $display(1);
    $display(1);
    fork
      id_2;
      repeat (1) begin : LABEL_0
        id_1 = id_2;
      end
    join : SymbolIdentifier
  end
  assign module_3.LABEL_0.id_17 = 0;
endmodule
module module_1;
  wire id_1, id_2;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  integer id_3;
endmodule
module module_3 (
    input wor id_0,
    output logic id_1,
    output tri1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    inout uwire id_7,
    input wor id_8,
    input wor id_9,
    input logic id_10,
    output supply1 id_11,
    output supply1 id_12
    , id_15,
    output tri id_13
);
  assign id_3 = !id_8 < id_10;
  wire id_16;
  always @("" or posedge 1) begin : LABEL_0
    id_1.id_10 = #id_17(1);
  end
  module_0 modCall_1 ();
endmodule
