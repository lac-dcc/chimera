// Seed: 2816991492
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  specify
    (posedge id_6 => (id_7  : -1'b0)) = (id_7  : -1  : $realtime, id_2  : $realtime : (id_4));
    (posedge id_8 => (id_9  : id_9 + id_4)) = (1  : id_6  : $realtime, -1  : $realtime : $realtime);
  endspecify
endmodule
module module_1 #(
    parameter id_19 = 32'd44,
    parameter id_20 = 32'd29
) (
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
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_15(
      .id_0(id_5),
      .id_1($realtime),
      .id_2(id_12),
      .id_3($realtime),
      .id_4(($realtime)),
      .id_5(id_1),
      .id_6()
  );
  wire id_16;
  wire id_17;
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_18,
      id_4
  );
  assign modCall_1.id_7 = 0;
  defparam id_19.id_20 = id_13 && $realtime;
  wire id_21;
  wire id_22;
  wire id_23;
endmodule
