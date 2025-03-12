// Seed: 3820398379
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output uwire id_2,
    output uwire id_3#(
        .id_8 ({(1'b0) {-1}}),
        .id_9 (-1),
        .id_10(1'b0),
        .id_11(1 - 1),
        .id_12(~1 != -1)
    ),
    output wor id_4,
    output wire id_5,
    input wor id_6
);
  initial $signed(59);
  ;
  struct packed {id_13 id_14;} id_15;
  wire [-1 : 1] id_16;
  wire id_17;
  assign id_5 = 1 == id_12;
  wire id_18;
  always id_9 <= id_8;
  id_19 :
  assert property (@(posedge id_16) id_11.id_15.id_14[1'b0]);
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1,
    output wire id_2,
    output wire id_3,
    output tri1 id_4,
    input supply0 id_5,
    input wire id_6,
    input wor id_7
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_5
  );
  assign modCall_1.id_9 = 0;
  wire [-1 : 1] id_9;
endmodule
