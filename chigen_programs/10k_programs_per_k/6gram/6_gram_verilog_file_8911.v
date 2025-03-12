// Seed: 3363336297
module module_0 (
    input  tri1 id_0,
    output wand id_1
);
  wire id_3;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input  wand id_0,
    output tri0 id_1
);
  logic id_3, id_4;
  supply0 id_5 = -1;
  localparam id_6 = 1 - 1;
  localparam id_7 = (id_6);
  xnor primCall (id_1, id_3, id_5, id_0, id_4, id_7);
  assign id_3[1] = 1;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_3 = id_5;
endmodule
module module_2 ();
  reg [-1 : -1] id_1;
  parameter id_2 = -1;
  always @(posedge id_2) begin : LABEL_0
    id_1 <= id_2;
  end
  assign id_1 = id_2 || id_1;
  always @(posedge id_2#(1, -1) / 1 or id_1)
    if (1) {-1, -1} <= 1'h0;
    else id_1 = 1;
endmodule
