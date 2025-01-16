// Seed: 2991768749
module module_0 (
    input uwire id_0,
    output tri id_1,
    output supply1 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input wand id_6,
    output tri0 id_7
);
  assign id_7 = -1'd0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output supply0 id_2,
    id_13,
    inout wand id_3,
    input uwire id_4,
    output tri0 id_5,
    output logic id_6,
    input tri1 id_7,
    input wire id_8,
    input supply0 id_9,
    output logic id_10,
    input uwire id_11
);
  wire id_14;
  wire id_15, id_16;
  always_latch id_6 <= 1;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_2,
      id_3,
      id_1,
      id_3,
      id_11,
      id_5
  );
  id_17 :
  assert property (@(posedge -1) id_9)
  else begin : LABEL_0
    @(-1 or negedge 1) id_10 <= -1 << id_13;
  end
  wire id_18;
endmodule
