// Seed: 3676252758
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    output wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri1 id_7,
    output wor id_8,
    output tri id_9,
    input tri1 id_10,
    output tri0 id_11
    , id_19,
    output logic id_12,
    input wor id_13,
    output wor id_14,
    output supply1 id_15,
    input supply1 id_16,
    input wand id_17
);
  always @(id_7 or posedge 1)
    if (-1) id_12 = id_2;
    else begin : LABEL_0
      #1;
      if (1) begin : LABEL_1
        id_12 <= id_17;
      end
    end
  assign module_1.id_1 = 0;
  logic id_20;
  ;
  assign id_3 = id_7;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    output tri id_2,
    output tri0 id_3
);
  logic id_5;
  ;
  always_latch
    if (1) id_0 <= id_1;
    else id_0 <= id_5[1'd0 : 1];
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_3,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_3,
      id_2,
      id_1,
      id_1
  );
  assign id_0 = id_5;
  assign id_2 = id_5;
endmodule
