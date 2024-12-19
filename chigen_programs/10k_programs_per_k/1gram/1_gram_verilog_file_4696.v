// Seed: 3887952882
module module_0;
  wire id_1;
  assign id_1 = 1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1;
  logic [7:0] id_1;
  assign id_1[1] = 1;
  assign id_1 = id_1;
  assign id_1 = id_1[1'h0 : 1];
  logic [7:0] id_2 = id_1;
  supply1 id_3, id_4;
  supply0 id_5, id_6;
  wand id_7, id_8;
  for (id_9 = 1; {id_3{id_8}}; id_4 = id_5) assign id_4 = 1;
  wire id_10;
  module_0 modCall_1 ();
  wire id_11;
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
    id_9
);
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  assign module_0.id_1 = 0;
  always @(posedge 1) $display(1, 1);
endmodule
