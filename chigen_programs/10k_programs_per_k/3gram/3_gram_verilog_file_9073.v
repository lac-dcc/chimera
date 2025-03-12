// Seed: 1586941702
module module_0 (
    input wor id_0,
    output uwire id_1,
    output wand id_2,
    input uwire id_3,
    input tri1 id_4,
    output tri1 id_5#(
        .id_10(1'b0),
        .id_11(1),
        .id_12(-1),
        .id_13(1),
        .id_14(1)
    ),
    output supply1 id_6,
    input supply1 id_7,
    input tri id_8
);
  logic id_15;
  ;
  parameter id_16 = 1;
  logic id_17;
  ;
  wire id_18;
  integer id_19;
  logic id_20;
  wire id_21;
  logic id_22;
  always @(posedge 1) begin : LABEL_0
    id_20 = id_8;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    input wire id_3,
    output wor id_4,
    input uwire id_5,
    output supply1 id_6,
    input wand id_7,
    output uwire id_8,
    input supply0 id_9,
    output tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input supply1 id_13,
    input tri0 id_14,
    output tri1 id_15,
    input wand id_16,
    input uwire id_17
);
  assign id_15 = id_13;
  module_0 modCall_1 (
      id_7,
      id_15,
      id_6,
      id_2,
      id_2,
      id_10,
      id_4,
      id_7,
      id_11
  );
  wire id_19, id_20, id_21, id_22;
endmodule
