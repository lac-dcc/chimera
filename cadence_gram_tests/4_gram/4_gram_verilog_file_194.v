// Seed: 256831838
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  wor id_5, id_6;
  cover property (-1);
  specify
    (negedge id_7 => (id_8  : id_6)) = (id_2  : id_2  : id_2, id_5  : $realtime : -1);
    $width(negedge id_9, $realtime, id_2, id_10);
  endspecify
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
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = id_17;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_14
  );
  wire id_18;
  wand id_19;
  assign id_3 = 1 ? 1 : $realtime;
  always @(id_19 == (-1) or posedge $realtime) begin : LABEL_0
    id_8 <= -1'b0;
    id_3 <= $realtime;
  end
endmodule
