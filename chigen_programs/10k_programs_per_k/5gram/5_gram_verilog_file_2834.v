// Seed: 3208233499
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    output logic id_2,
    input tri1 id_3,
    output wire id_4,
    output wire id_5,
    output tri id_6,
    input tri1 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input wand id_10,
    input tri1 id_11
);
  always_latch @(posedge 1 & 1, posedge id_9) id_2 = id_1;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    output uwire id_2
    , id_7,
    input wor id_3,
    output wor id_4,
    input supply1 id_5
);
  localparam id_8 = 1 >= !1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_0,
      id_5,
      id_4,
      id_4,
      id_4,
      id_5,
      id_3,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.id_10 = 0;
  always @(posedge 1 | id_7 or posedge 1)
    if (1) begin : LABEL_0
      id_0 <= #id_8 id_3 < -1;
      id_1 = #1 -1;
      if (1) id_1 = -1;
    end
endmodule
