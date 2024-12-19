// Seed: 2215493062
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input tri0 id_2,
    input tri id_3,
    output supply0 id_4,
    input tri0 id_5,
    output supply1 id_6,
    output supply1 id_7,
    output supply0 id_8,
    output supply0 id_9
);
  wor  id_11 = id_2;
  wire id_12;
  assign id_4 = 1'b0;
  wor  id_13 = 1;
  wire id_14;
  assign module_1.type_1 = 0;
  assign id_11 = 1;
  wire id_15;
  wire id_16;
  assign id_15 = id_12#(.id_1(1));
  wire id_17;
  wire id_18;
  id_19 :
  assert property (@(posedge id_3) id_13)
  else $display;
endmodule
module module_1 (
    output wire  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  uwire id_3
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0
  );
endmodule
