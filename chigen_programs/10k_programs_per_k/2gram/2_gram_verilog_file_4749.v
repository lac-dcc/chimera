// Seed: 917209244
module module_0 (
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
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = 1'h0;
  initial
    #1 begin
      if (1) @(negedge 1'h0) #1 fork join_any
      $display(1, id_6);
    end
endmodule
module module_1 (
    output tri  id_0,
    output wand id_1,
    input  wire id_2
);
  wire id_4;
  nor (id_1, id_4, id_2);
  module_0(
      id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4
  );
endmodule
