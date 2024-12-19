// Seed: 175316334
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output tri id_2,
    output uwire id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wor id_9,
    input wor id_10,
    output wire id_11,
    input tri0 id_12,
    input tri id_13
);
  integer id_15 = id_13;
  id_16(
      .id_0(id_9), .id_1(1), .id_2(1)
  );
  wire id_17;
  wand id_18 = 1;
  wire id_19;
  tri1 id_20 = id_9 - id_7;
endmodule
module module_1 (
    input  logic id_0,
    output wire  id_1,
    input  wor   id_2,
    output logic id_3,
    output uwire id_4
);
  generate
    always_latch @(posedge 1'b0 or negedge id_0) if (1'b0) $display(id_0);
  endgenerate
  assign id_3 = 1;
  generate
    initial begin : LABEL_0
      id_3 <= id_0;
    end
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  id_6(
      .id_0(id_1),
      .id_1(1),
      .id_2(1'd0),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1'd0),
      .id_8()
  );
  reg id_7 = 1;
  assign id_4 = 1'b0;
  wire id_8;
  assign id_8 = +1;
  wire id_9;
  wire id_10;
  always @(1) id_7 = #1 1;
endmodule
