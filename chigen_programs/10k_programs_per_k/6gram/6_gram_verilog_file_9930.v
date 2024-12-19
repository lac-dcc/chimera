// Seed: 31496630
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wor id_2,
    input tri0 id_3,
    input uwire id_4,
    input wand id_5,
    input supply0 id_6,
    input supply1 id_7,
    output supply1 id_8,
    output supply1 id_9,
    output uwire id_10,
    output tri0 id_11,
    output tri0 id_12,
    input tri0 id_13
    , id_20,
    input wand id_14,
    output tri1 id_15,
    input tri1 id_16,
    input wor id_17,
    output tri1 id_18
);
  assign id_15 = 1'b0;
  assign module_1.id_8 = 0;
  always @(1 or posedge id_16) id_15 = id_13;
  assign id_20 = 1;
  always @(negedge 1) begin : LABEL_0$display
    ;
  end
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input supply0 id_4,
    output uwire id_5,
    output supply1 id_6,
    output tri1 id_7,
    output wor id_8,
    input wor id_9,
    input wand id_10,
    input uwire id_11,
    output tri0 id_12,
    output wor id_13,
    input tri1 id_14,
    input wand id_15,
    input supply0 id_16,
    input supply1 id_17
);
  supply0 id_19, id_20;
  module_0 modCall_1 (
      id_15,
      id_7,
      id_15,
      id_4,
      id_4,
      id_2,
      id_17,
      id_9,
      id_8,
      id_3,
      id_6,
      id_5,
      id_3,
      id_11,
      id_16,
      id_0,
      id_9,
      id_10,
      id_5
  );
  wire id_21;
  assign id_0 = id_4;
  wire id_22;
  wire id_23;
  wire id_24;
  assign id_13 = id_16;
  assign id_13 = 1'b0;
  always @(1 or posedge id_9) begin : LABEL_0
    id_0 = 1;
  end
endmodule
