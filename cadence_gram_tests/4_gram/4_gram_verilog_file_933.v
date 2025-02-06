// Seed: 432360483
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
    id_16
);
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_17, id_18;
  assign id_4 = $realtime;
  wire id_19;
  generate
    if (id_11) begin : LABEL_0
      always @(posedge !id_17 or negedge $realtime & 1 == id_9 & $realtime) $clog2(0);
      ;
    end else begin : LABEL_0
      for (id_20 = $realtime; id_16 == id_3; id_12++) begin : LABEL_0
        wire id_21;
      end
      assign id_5 = $realtime;
    end
  endgenerate
  id_22(
      id_4, -1'b0, id_9
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wor  id_4;
  wire id_5;
  wire id_6;
  assign id_3 = $realtime | $realtime & id_4 & $realtime ? $realtime : id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_1,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4,
      id_6,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_12 = 0;
  tri id_7;
  specify
    $width(negedge id_8, id_7, $realtime, id_9);
  endspecify
endmodule
