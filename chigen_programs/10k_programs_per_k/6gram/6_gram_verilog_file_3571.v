// Seed: 1088545940
module module_0 (
    input  supply0 id_0,
    output supply1 id_1
);
  assign id_1 = id_0;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_1  = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input logic id_5,
    input tri id_6,
    output logic id_7,
    output wor id_8,
    input uwire id_9,
    output tri1 id_10
);
  initial if (1'd0) id_7 <= id_5;
  module_0 modCall_1 (
      id_2,
      id_8
  );
endmodule
module module_2;
  supply1 id_2;
  always @(negedge 1 & ~id_1) begin : LABEL_0
    id_1 = id_1;
  end
  assign id_2 = 1;
endmodule
