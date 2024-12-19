// Seed: 3556330325
module module_0 (
    input tri0 id_0,
    output supply1 id_1
);
  wire id_3;
  wire id_4;
  assign module_2.type_12 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    output wire  id_1,
    input  logic id_2,
    output logic id_3
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.type_5 = 0;
  assign id_3 = 1'b0;
  reg id_5;
  initial begin : LABEL_0
    id_5 <= #1 id_2;
    id_3 <= id_2;
    fork
      @(posedge 1) $display;
      id_6(1);
    join
  end
endmodule
module module_2 (
    input wor id_0,
    output supply0 id_1,
    inout logic id_2,
    output wor id_3,
    input tri id_4,
    output wire id_5,
    input logic id_6,
    input uwire id_7,
    output tri0 id_8
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  always @(negedge 1) begin : LABEL_0
    id_2 <= id_6;
  end
endmodule
