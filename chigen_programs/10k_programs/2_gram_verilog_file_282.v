// Seed: 2087136063
module module_0 (
    id_1
);
  input wire id_1;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    input supply1 id_2
);
  wire id_4;
  tri  id_5 = 1;
  wire id_6;
  genvar id_7, id_8;
  wire id_9;
  module_0(
      id_4
  );
  assign id_8 = ~id_7;
  wand id_10;
  initial assume #1  (id_10);
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  module_0(
      id_4
  ); id_8 :
  assert property (@(id_4 or posedge 1) ~1)
  else;
endmodule
