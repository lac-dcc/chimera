// Seed: 873524702
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input wire id_4,
    input wire id_5,
    input uwire id_6
    , id_15,
    input supply0 id_7,
    input wand id_8,
    input supply0 id_9,
    output tri id_10,
    input tri id_11,
    output tri0 id_12,
    output uwire id_13
);
  always @(negedge id_7) $display(1);
  id_16(
      .id_0(1'b0), .id_1(id_10 != 1), .id_2(1), .id_3((1) == 1), .id_4(1), .id_5("")
  );
  assign id_10 = (1);
  tri1 id_17;
  wire id_18;
  id_19(
      (1'b0) == id_17, 1'b0, (1), id_15, (id_7)
  );
  wire id_20;
  wire id_21;
  genvar id_22;
  assign id_12 = 1 - id_22;
  id_23(
      .id_0(1'b0),
      .id_1(1'd0),
      .id_2(1),
      .id_3(1 - 1),
      .id_4(id_9),
      .id_5(id_19),
      .id_6(1),
      .id_7(1'd0 * id_22),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(1)
  );
  assign module_1.id_2 = 0;
  tri1 id_24;
  always @(posedge id_24) id_12 = id_24 == id_19;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    input supply1 id_2,
    input wand id_3
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule
