// Seed: 327474721
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input wand id_2,
    output tri id_3,
    output tri0 id_4,
    input tri id_5,
    output wire id_6,
    input tri0 id_7,
    input supply0 id_8,
    output tri id_9,
    input tri0 id_10,
    input supply1 id_11,
    output tri0 id_12
);
  assign id_6 = id_8;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output logic id_2,
    input wire id_3,
    input wand id_4,
    input wor id_5,
    output tri id_6,
    inout logic id_7,
    input supply1 id_8,
    output uwire id_9,
    input supply1 id_10,
    output wor id_11
);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_8,
      id_11,
      id_6,
      id_5,
      id_11,
      id_3,
      id_1,
      id_11,
      id_0,
      id_1,
      id_11
  );
  bit id_13;
  assign id_13 = id_8;
  wire id_14;
  always @(posedge -1 or id_5) begin : LABEL_0
    id_7 <= -1 ? id_14 : -1;
    id_2 <= 1;
  end
  always_ff @(negedge "") begin : LABEL_1
    id_13 = 1;
  end
  wire id_15;
  ;
  logic [1 : -1 'b0] id_16;
endmodule
