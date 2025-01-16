// Seed: 1987472623
module module_0 (
    input tri0 id_0,
    input tri  id_1,
    input tri  id_2,
    input wor  id_3
);
  wand id_5;
  supply1 id_6;
  wire id_7, id_8;
  assign id_6 = id_3;
  pullup (.id_0(-1'b0));
  assign id_6 = id_5;
  assign module_1.type_8 = 0;
  wire id_9;
  wire id_10;
  always_latch $display(-1'b0);
  wire id_11;
  wire id_12;
  always id_8 = id_11;
  always id_5 = -1;
endmodule
module module_1 (
    input uwire id_0,
    input tri0  id_1,
    input tri1  id_2,
    id_5,
    input tri1  id_3
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1
  );
  id_7 :
  assert property (@(posedge 1'b0) -1) $display;
endmodule
