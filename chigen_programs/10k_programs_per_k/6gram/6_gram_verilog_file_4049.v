// Seed: 152389434
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  assign module_1.id_1 = 0;
  inout wire id_3;
  output reg id_2;
  output wire id_1;
  bit  id_10;
  wire id_11;
  always @(1 or posedge id_11) begin : LABEL_0
    if (1) id_10 = id_6;
    else id_2 <= (id_6) ^ -1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    output wand id_1
);
  reg  id_3;
  wire id_4;
  always @(1) begin : LABEL_0
    id_3 <= 1 <= id_4;
  end
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
