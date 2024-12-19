// Seed: 2138830233
module module_0;
  initial assume ("");
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input wire id_2,
    output uwire id_3,
    input tri0 id_4,
    output tri0 id_5,
    output supply1 id_6
);
  module_0 modCall_1 ();
  reg id_8 = 1;
  always_ff #1 begin : LABEL_0
    fork
      $display;
      id_0 = id_4 | id_4 == 1;
      #1;
    join
    id_8 <= id_8 & 1;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 ();
  always @(posedge {1'b0, 1} or id_1) id_3 <= 1'h0;
  wire id_12;
endmodule
