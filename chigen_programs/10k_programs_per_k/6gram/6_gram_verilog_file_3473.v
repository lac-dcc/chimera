// Seed: 2414117830
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wor id_2
    , id_21,
    output tri0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input uwire id_6,
    input supply0 id_7,
    output supply0 id_8,
    input uwire id_9,
    output tri id_10,
    output tri1 id_11,
    input tri id_12,
    input supply0 id_13,
    input tri1 id_14,
    output supply0 id_15,
    input uwire id_16,
    input wire id_17,
    input supply0 id_18,
    output wire id_19
);
  assign id_5 = 1;
  assign id_15 = 1'd0;
  assign id_11 = id_16;
  assign module_1.id_2 = 0;
  wire id_22;
  wire id_23;
endmodule
module module_1 (
    input  wire id_0,
    input  tri1 id_1,
    output wire id_2
);
  wire id_4;
  always @(id_1 or negedge id_1) begin : LABEL_0
    fork
      #1;
      $display;
    join
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2
  );
endmodule
