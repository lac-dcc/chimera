// Seed: 321990404
module module_0 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    input tri id_3,
    input tri id_4#(.id_7(1)),
    input uwire id_5
);
  pmos (id_2);
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  tri0  id_2,
    output logic id_3
);
  logic id_5;
  id_6(
      .id_0(1'b0),
      .id_1(1),
      .id_2(1'b0),
      .id_3(id_0),
      .id_4(id_5),
      .id_5(1 == id_5),
      .id_6(id_5),
      .id_7(id_3)
  ); id_7 :
  assert property (@(1'b0 or posedge id_5 or posedge 1) id_5) begin : LABEL_0
    #1 id_1 <= 1;
  end
  tri1 id_8 = 1;
  assign id_1 = 1;
  reg id_9, id_10;
  initial id_7 <= 1;
  assign id_8 = ~id_5;
  reg   id_11;
  logic id_12;
  wire  id_13;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_5 = 0;
  logic id_14;
  wire  id_15;
  assign id_1 = 0 ? 1 : id_12;
  always begin : LABEL_0
    @(posedge id_14) id_11 <= id_10;
  end
  supply1 id_16 = 1;
endmodule
