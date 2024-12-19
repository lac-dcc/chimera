// Seed: 2888155754
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input wire id_2,
    input wire id_3,
    input supply1 id_4
    , id_19,
    output tri id_5,
    input tri1 id_6,
    output tri id_7,
    output wand id_8,
    output supply0 id_9,
    input wand id_10,
    input wor id_11,
    input wire id_12,
    input wire id_13,
    output tri0 id_14,
    output supply1 id_15,
    inout tri id_16,
    output supply0 id_17
);
  uwire id_20 = 1;
  assign id_15 = id_19;
  assign id_8  = 1;
  uwire id_21;
  always @(~id_6 or {id_19{1}} < id_6) begin : LABEL_0
    if (id_16) begin : LABEL_0
      assume (1);
    end
  end
  assign id_20 = id_21;
  wire  id_22;
  uwire id_23 = id_23 < 1;
  wire  id_24;
  wire id_25, id_26;
  assign id_15 = 1'b0 == 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri0 id_1,
    input  wire id_2,
    input  tri1 id_3,
    output tri0 id_4
);
  wand id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_2,
      id_1,
      id_0,
      id_6,
      id_3,
      id_4,
      id_6,
      id_6,
      id_6,
      id_1,
      id_1,
      id_3,
      id_4,
      id_4,
      id_6,
      id_4
  );
  assign id_6 = 1 ? id_3#(.id_0(1)) : id_6;
endmodule
