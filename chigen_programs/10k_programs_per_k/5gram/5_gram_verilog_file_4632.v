// Seed: 2078264623
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5, id_6, id_7, id_8;
  module_2(
      id_3, id_6, id_6, id_1, id_7, id_5, id_6, id_7, id_4, id_4, id_1, id_8, id_6, id_4
  );
  wire id_9;
endmodule
module module_1;
  wire id_1;
  wire id_2, id_3, id_4;
  module_0(
      id_3, id_3, id_4
  );
  wire id_5;
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_15;
  assign id_13 = id_1;
  assign id_15 = id_14;
  assign id_12 = id_3 == 1;
  supply1 id_16;
  wire id_17;
  string id_18 = "";
  assign id_8 = id_2#(.id_15(id_16++))++;
  id_19 :
  assert property (@(posedge id_14) id_14)
  else $display(id_6, id_19, id_13, 1, id_1);
endmodule
