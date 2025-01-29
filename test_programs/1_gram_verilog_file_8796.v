// Seed: 2068790732
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input wand id_2,
    output supply1 id_3,
    input tri id_4,
    output tri1 id_5,
    output supply1 id_6,
    output wire id_7,
    input wor id_8,
    output tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    input tri1 id_12,
    input uwire id_13,
    input tri1 id_14,
    output supply0 id_15,
    id_25,
    input tri id_16,
    output wand id_17,
    input tri1 id_18,
    input uwire id_19,
    input wire id_20,
    input wire id_21,
    input wand id_22,
    input uwire id_23
);
  wire id_26;
  assign module_1.type_23 = 0;
  wire id_27, id_28;
endmodule
module module_1 (
    input  wor   id_0,
    output wire  id_1,
    output tri1  id_2,
    input  wand  id_3,
    output uwire id_4,
    output tri0  id_5
);
  wor id_7, id_8, id_9;
  id_10(
      .id_0(id_2),
      .id_1(),
      .id_2(id_9),
      .id_3(id_8),
      .id_4(-1'd0 <-> -1),
      .id_5(id_1),
      .id_6(1 * -1),
      .id_7(1)
  );
  tri1 id_11 = -1'b0;
  id_12(
      .id_0($realtime),
      .id_1(-1),
      .id_2(-1),
      .id_3(id_1),
      .id_4(),
      .id_5(-1),
      .id_6(),
      .id_7(-1),
      .id_8((id_7) | id_11),
      .id_9(~1),
      .id_10(id_7),
      .id_11(id_5)
  );
  wire id_13, id_14;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_2,
      id_0,
      id_5,
      id_5,
      id_4,
      id_3,
      id_2,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0
  );
  logic [7:0] id_15, id_16, id_17;
  wire id_18, id_19, id_20;
  assign id_16[-1] = -1'h0 == 1;
  parameter id_21 = -1;
  parameter id_22 = 1;
endmodule
