// Seed: 2470509189
module module_0 (
    input  wand  id_0
    , id_7,
    output wand  id_1,
    output tri0  id_2,
    output logic id_3,
    input  tri0  id_4,
    input  logic id_5
);
  assign module_1.id_2 = 0;
  assign id_7 = id_0;
  assign id_1 = 1'd0 * {id_4, id_4, 1};
  wire id_8;
  always @(negedge 1'b0) id_3 = #1 id_5;
endmodule
module module_1 (
    inout logic id_0,
    input wand id_1,
    input tri0 id_2,
    input wire id_3,
    input supply0 id_4,
    input uwire id_5,
    output wand id_6,
    inout tri0 id_7,
    output tri0 id_8,
    input supply1 id_9
);
  tri0 id_11 = id_9;
  reg  id_12;
  wire id_13;
  assign id_0  = 1'b0;
  assign id_12 = 1'b0;
  reg id_14;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6,
      id_0,
      id_5,
      id_0
  );
  assign id_12 = id_14;
  wire  id_15;
  uwire id_16;
  assign id_14 = 1 ^ id_1;
  initial begin : LABEL_0
    id_0 <= 1;
    $display(id_3, 1'h0);
    id_16 = id_2;
    id_14 <= id_12;
    #id_17;
  end
endmodule
