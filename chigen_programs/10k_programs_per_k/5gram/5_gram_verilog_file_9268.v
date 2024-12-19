// Seed: 711499751
module module_0 (
    output supply1 id_0,
    output wire id_1,
    output uwire id_2,
    input wire id_3,
    output tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    input wire id_7,
    output wor module_0,
    input supply0 id_9,
    input supply0 id_10
);
  wire id_12;
  for (genvar id_13 = id_3; ~id_5; id_13 = (1 == id_9 * 1))
  id_14(
      .id_0(1), .id_1(id_13), .id_2(id_5), .id_3(1), .id_4(id_4 + 1'b0), .id_5(id_12.id_12)
  );
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    input wor id_0,
    output wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    output logic id_5,
    output logic id_6,
    input uwire id_7,
    output wor id_8,
    input tri1 id_9
    , id_11
);
  wire id_12;
  wire id_13;
  wire id_14;
  logic id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  assign id_22 = 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_1,
      id_2,
      id_4,
      id_2,
      id_0,
      id_3,
      id_8,
      id_9,
      id_9
  );
  assign modCall_1.id_8 = 0;
  always_latch @(*) begin : LABEL_0
    id_18 = 1;
    id_15 <= 1;
  end
  logic [7:0] id_23;
  supply0 id_24 = 1;
  wire id_25;
  always @(posedge ^id_23[1]) id_5 <= (id_22);
endmodule
