// Seed: 970292275
module module_0 (
    input wand id_0,
    input tri id_1,
    output uwire id_2,
    output supply0 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output wor id_6,
    input tri0 id_7
    , id_18,
    output wire id_8,
    output uwire id_9,
    output tri1 id_10,
    output tri id_11,
    input wand id_12,
    input tri0 id_13,
    input supply1 id_14,
    output supply0 id_15,
    input tri id_16
);
  always @(posedge 1);
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    output wire id_2,
    input tri id_3,
    output supply0 id_4,
    output supply1 id_5
    , id_12,
    input wor id_6
    , id_13,
    output supply0 id_7
    , id_14,
    output tri0 id_8,
    output supply0 id_9,
    input wand id_10
);
  final $display;
  always @(posedge 1'b0) @(1);
  assign id_13 = id_14;
  always @(posedge id_12) begin : LABEL_0
    if (id_14) id_14 = 1;
    wait (1);
  end
  module_0 modCall_1 (
      id_3,
      id_10,
      id_5,
      id_9,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4,
      id_2,
      id_5,
      id_2,
      id_1,
      id_3,
      id_0,
      id_4,
      id_6
  );
  assign modCall_1.type_10 = 0;
  assign id_2 = id_3 < 1'b0;
endmodule
