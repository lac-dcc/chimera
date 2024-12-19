// Seed: 3771539406
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input  tri1 id_1,
    input  wor  id_2,
    input  wand id_3
    , id_7,
    input  tri0 id_4,
    output wand id_5
);
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8
  );
  assign id_5 = id_7;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_6 = id_5;
  reg  id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_2
  );
  logic [7:0] id_9;
  assign id_2 = {id_2, id_8};
  initial begin : LABEL_0
    id_4 <= id_7;
  end
  always @(id_9[1]) begin : LABEL_0
    if (1'h0 - 1) $display(1);
  end
endmodule
