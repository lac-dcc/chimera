// Seed: 2510190859
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri0 id_2,
    input wand id_3,
    output wand id_4,
    input supply0 id_5,
    input tri1 id_6,
    output wand id_7,
    input tri1 id_8,
    input wor id_9
);
  parameter id_11 = -1'b0;
  localparam id_12 = 1;
  id_13 :
  assert property (@(posedge id_5 or id_12) 1)
  else id_14(id_0, id_3);
  wire id_15;
  wire id_16;
  wire id_17;
  ;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input wire id_2,
    input supply0 id_3#(
        .id_17(1),
        .id_18(1),
        .id_19(1),
        .id_20(1)
    ),
    output wire id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    input wire id_8,
    input tri1 id_9,
    input wor id_10,
    output wire id_11,
    input supply1 id_12,
    output uwire id_13,
    input supply1 id_14,
    input supply1 id_15
);
  parameter id_21 = 1;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_8,
      id_11,
      id_3,
      id_14,
      id_7,
      id_14,
      id_10
  );
  assign id_18 = id_18;
endmodule
