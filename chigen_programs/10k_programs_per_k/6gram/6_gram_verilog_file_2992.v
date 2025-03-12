// Seed: 118404092
module module_0 (
    input supply1 id_0,
    output tri0 id_1
    , id_17,
    output supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output tri id_9,
    output tri id_10,
    output uwire id_11,
    output uwire id_12,
    input wire id_13,
    input supply1 id_14
    , id_18,
    output wire id_15
);
  logic id_19;
  ;
  always @(id_4 or id_3) begin : LABEL_0
    id_17 <= id_14;
    if (1) begin : LABEL_1
      wait (1 == id_4);
    end
  end
  wire id_20;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    output wor id_2,
    output wand id_3,
    output tri1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    input wire id_7,
    output supply1 id_8
);
  assign id_4 = id_0;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7,
      id_0,
      id_5,
      id_2,
      id_8,
      id_5,
      id_0,
      id_7,
      id_8
  );
  wire id_12;
  ;
  wire id_13;
endmodule
