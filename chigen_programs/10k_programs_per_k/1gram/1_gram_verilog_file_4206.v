// Seed: 2226936029
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output tri id_3,
    input wand id_4
);
  assign id_3 = -1'd0;
  logic id_6;
  ;
  assign id_6 = 1;
  assign id_3.id_4 = 1;
  assign id_0.id_4 = -1'd0;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    input tri id_7,
    output supply0 id_8,
    input wor id_9,
    input tri0 id_10,
    output tri id_11
);
  struct packed {
    logic id_13;
    id_14 id_15;
  } id_16["" : ~  -1 'b0];
  module_0 modCall_1 (
      id_11,
      id_10,
      id_2,
      id_1,
      id_5
  );
  assign modCall_1.id_3 = 0;
  wire id_17 = id_5;
  always_latch begin : LABEL_0
    @(negedge id_16.id_13) id_16.id_14 <= id_16.id_13;
  end
endmodule
