// Seed: 3206709533
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout reg id_2;
  inout wire id_1;
  always @(posedge $realtime) begin : LABEL_0
    fork
      id_2 = id_3 + 1;
      id_4;
      id_5;
    join
  end
endmodule
module module_1 (
    input wor  id_0,
    input wire id_1
    , id_4,
    input tri0 id_2
);
  parameter id_5 = -1;
  wire [-1 : ""] id_6;
  always id_4 <= #id_2 1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  tri  id_0,
    input  tri1 id_1,
    output tri1 id_2
);
  logic id_4;
  logic [7:0] id_5;
  assign module_3.id_16 = 0;
  assign id_5[-1] = -1;
endmodule
module module_3 (
    output uwire id_0,
    input tri id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    output wand id_8,
    input supply1 id_9,
    input tri0 id_10,
    output tri1 id_11,
    output logic id_12,
    output wor id_13
);
  wor id_15;
  assign id_12 = id_9;
  assign id_15 = 1;
  module_2 modCall_1 (
      id_6,
      id_6,
      id_11
  );
  always @(id_10) begin : LABEL_0
    id_12 = #id_16 1'b0;
  end
endmodule
