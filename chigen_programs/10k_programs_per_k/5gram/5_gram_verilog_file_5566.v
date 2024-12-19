// Seed: 1488396566
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
  assign module_2.id_9 = 0;
endmodule
module module_1 (
    output tri  id_0,
    output wand id_1,
    input  wand id_2,
    output tri1 id_3,
    input  tri1 id_4,
    input  tri  id_5
);
  wire id_7;
  module_0 modCall_1 (id_7);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (id_5);
  tri0 id_13, id_14;
  tri0 id_15, id_16;
  always @(posedge id_3) id_1 = id_1;
  supply1 id_17;
  reg id_18 = id_16 - 1;
  assign id_12 = id_9 ? id_10 == id_17 : 1 ? id_13 : id_13 + 1;
  wire id_19;
  always @((id_16 && id_10 ? id_7 : 1'b0 ? 1 : ~id_9)) begin : LABEL_0
    id_18 <= id_18 - id_1#(.id_3(1'h0 == (1)));
    if (id_16) begin : LABEL_0
      wait (1'b0);
    end
    id_13 = (1 | id_10 || id_10);
  end
  wire id_20;
endmodule
