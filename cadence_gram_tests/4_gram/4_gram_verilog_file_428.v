// Seed: 3295581634
module module_0 (
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_19;
  id_20(
      id_17, id_14 && id_6, $realtime == 1, id_3
  );
  wire id_21;
  id_22(
      .id_0(1),
      .id_1($realtime),
      .id_2((id_21)),
      .id_3(),
      .id_4(-1),
      .id_5(id_18),
      .id_6(-1 | -1 | 1 | -1 | $realtime | !id_19 | 1 | $realtime | id_8 | 1'b0),
      .id_7(-1'b0),
      .id_8(id_3)
  );
  wire id_23;
  wire id_24;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    output tri id_2,
    output supply0 id_3,
    output supply1 id_4
    , id_15,
    input tri0 id_5,
    input supply1 id_6,
    input tri id_7,
    output tri1 id_8,
    output wand id_9,
    output wire id_10,
    input wand id_11,
    output uwire id_12
    , id_16,
    output tri id_13
);
  assign id_0 = $realtime ? $realtime - id_5 : $realtime;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_15,
      id_16,
      id_15,
      id_16,
      id_15,
      id_16,
      id_15,
      id_16,
      id_16,
      id_15,
      id_16,
      id_16,
      id_16,
      id_15,
      id_16,
      id_15
  );
  wire id_17;
  wire id_18;
  wire id_19;
  specify
  endspecify
endmodule
