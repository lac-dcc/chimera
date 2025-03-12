// Seed: 2386487758
module module_0 (
    input wand id_0,
    output wand id_1,
    input tri id_2,
    input tri0 id_3,
    output uwire id_4,
    input uwire id_5,
    input tri1 id_6,
    input supply1 id_7,
    output supply0 id_8
);
  wire id_10;
  wire id_11;
  localparam id_12 = 1;
  wire id_13;
  id_14 :
  assert property (@(posedge id_2 or posedge 1) -1)
  else;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign id_1 = 1'b0;
endmodule
