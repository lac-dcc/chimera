// Seed: 2162133940
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wire id_2,
    input wand id_3,
    input tri id_4,
    input uwire id_5,
    output uwire id_6,
    input wand id_7,
    input supply1 id_8,
    output supply1 id_9,
    input tri id_10
);
  id_12(
      id_7, id_8, 1
  ); id_13 :
  assert property (@(posedge 1) id_7)
  else $display;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input wire id_2,
    input tri1 id_3,
    input tri id_4
);
  supply0 id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_1,
      id_4,
      id_2,
      id_1,
      id_4
  );
  assign modCall_1.id_9 = 0;
  tri id_7, id_8;
  wire id_9;
  assign id_6 = 1 <= 1;
  wire id_10;
  assign id_8 = id_4;
endmodule
