// Seed: 4060118531
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  always @(posedge 1) begin : LABEL_0
    id_2 <= id_1 - 1 & 1;
  end
  always @(1 or id_1) begin : LABEL_0
    if (1) id_2 -= id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  uwire id_6;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign id_5 = 1;
  wire id_7;
  always @(1) begin : LABEL_0
    fork
      id_2 = #1 1 - id_6;
    join
  end
endmodule
