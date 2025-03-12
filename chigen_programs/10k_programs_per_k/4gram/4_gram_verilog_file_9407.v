// Seed: 3270718613
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wand id_2,
    output supply1 id_3,
    input wire id_4,
    output wire id_5,
    input tri1 id_6,
    output tri id_7,
    input supply1 id_8,
    output supply1 id_9,
    input wand id_10,
    output supply1 id_11,
    output supply1 id_12,
    output supply1 id_13,
    output tri1 id_14
);
  logic [7:0] id_16;
  ;
  assign id_16[-1'd0 : 1'h0] = 1;
  wire id_17;
  final $signed(6);
  ;
  wire id_18;
  parameter id_19 = -1 - 1'b0;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input wor id_2,
    input wand id_3,
    input wor id_4,
    output supply1 id_5,
    input tri0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_6,
      id_1,
      id_6,
      id_5,
      id_3,
      id_0,
      id_3,
      id_5,
      id_5,
      id_1,
      id_1
  );
  wire id_9;
  assign id_0 = id_6;
  assign id_9 = id_6;
  or primCall (id_1, id_4, id_6, id_8);
endmodule
