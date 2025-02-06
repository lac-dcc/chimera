// Seed: 823803579
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  assign module_1.id_12 = 0;
  assign id_1 = 1;
  wire id_5;
endmodule
module module_1 (
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
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always  @  (  id_11  or  1  or $realtime or  id_7  or $realtime or  posedge  id_11  or  negedge  id_6  )  begin :LABEL_0
    id_1 = ~id_14;
  end
  wire id_15;
  wire id_16;
  id_17(
      .id_0(1),
      .id_1(id_1),
      .id_2(-1'd0 == id_13),
      .id_3($realtime),
      .id_4(id_9),
      .id_5(!id_12 && id_2[-1]),
      .id_6(id_8),
      .id_7($realtime),
      .id_8((id_16)),
      .id_9(1),
      .id_10()
  );
  module_0 modCall_1 (
      id_4,
      id_15,
      id_14
  );
  id_18(
      .id_0(id_1),
      .id_1($realtime),
      .id_2($realtime),
      .id_3(),
      .id_4(1),
      .id_5(id_4),
      .id_6($realtime),
      .id_7(id_10)
  );
  wire id_19;
  assign id_3 = id_9;
  and primCall (id_3, id_14, id_6, id_4, id_11, id_15, id_10, id_17, id_9, id_7, id_16);
  assign id_5 = 1;
endmodule
