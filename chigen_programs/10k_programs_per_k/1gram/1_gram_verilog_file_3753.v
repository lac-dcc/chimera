// Seed: 922499121
module module_0 (
    output uwire id_0
    , id_6,
    output supply0 id_1,
    input wor id_2,
    output supply0 id_3,
    output tri id_4
);
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input tri1 id_2,
    input logic id_3,
    input tri0 id_4,
    output logic id_5,
    output supply1 id_6,
    output tri0 id_7,
    output tri id_8,
    input wor void id_9,
    input wand id_10,
    input wand id_11,
    input uwire id_12,
    input tri0 id_13,
    input supply1 id_14,
    output logic id_15,
    output wand id_16,
    input wand id_17,
    input tri1 id_18,
    input tri id_19,
    input uwire id_20,
    input wand id_21,
    output uwire id_22,
    input wand id_23,
    output tri1 id_24,
    input tri0 id_25
);
  id_27 :
  assert property (@(posedge ~id_4 + id_17) id_3) begin : LABEL_0
    id_15 <= 1'h0;
  end
  module_0 modCall_1 (
      id_16,
      id_16,
      id_25,
      id_22,
      id_16
  );
  assign modCall_1.type_0 = 0;
  assign id_5 = id_3;
  logic [7:0] id_28;
  always @(1) id_5 <= 1;
  logic [7:0] id_29;
  wire id_30;
  wire id_31;
  id_32(
      id_29[1'b0]
  );
  wire id_33;
  assign id_28 = id_29;
endmodule
