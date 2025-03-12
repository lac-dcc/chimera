// Seed: 608654041
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output uwire id_2,
    output wire id_3,
    input tri id_4,
    output tri0 id_5,
    input tri0 id_6,
    input tri id_7
    , id_15,
    input supply0 id_8,
    input uwire id_9,
    output wire id_10,
    input tri id_11,
    input uwire id_12,
    input wire id_13
);
  logic id_16;
  assign id_3 = id_13 == -1 - 1'h0;
  wire id_17;
  always @(id_17) begin : LABEL_0
    disable id_18;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wand id_3,
    output uwire id_4,
    input tri1 id_5,
    input wire id_6,
    input tri0 id_7
);
  logic [1 : -1] id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_5,
      id_4,
      id_6,
      id_1,
      id_3,
      id_2,
      id_4,
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.id_7 = 0;
  logic id_10;
  ;
endmodule
