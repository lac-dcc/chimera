// Seed: 748083000
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
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_10 :
  assert property (@(posedge id_3) 1)
  else $display(1);
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wand id_3;
  module_0(
      id_3, id_3, id_1, id_1, id_3, id_1, id_3, id_3, id_3
  );
  wire id_4;
  assign id_1 = id_3 == 1'b0;
endmodule
