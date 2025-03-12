// Seed: 696034664
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output reg id_1;
  always @(*) begin : LABEL_0
    if (1) id_1 <= id_3;
  end
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output reg id_2;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_7
  );
  input wire id_1;
  always @(posedge id_7) begin : LABEL_0
    id_2 <= 1;
  end
endmodule
