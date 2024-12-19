// Seed: 852285840
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wor id_4, id_5;
  assign module_1.id_10 = 0;
  assign id_1 = 1'h0;
  id_6(
      1, 1'b0, id_4 & id_5
  );
  assign id_5 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_13;
  always id_1 <= id_7;
  id_14#(
      .id_15(1),
      .id_16(1),
      .id_17(1),
      .id_18(1)
  ) :
  assert property (@(posedge 1 or posedge 1) ^{1, id_7}) begin : LABEL_0
    begin : LABEL_0
      id_14 <= 1;
      id_13 <= id_15 | 1'b0;
      id_1  <= id_13;
      id_12 <= id_4;
    end
    begin : LABEL_0
      id_11   <= id_10;
      id_14   <= id_2;
      id_5[1] <= id_10;
    end
    id_15 <= 1;
    id_11 <= 1;
  end
  wire id_19;
  supply0 id_20 = 1;
  module_0 modCall_1 (
      id_20,
      id_20,
      id_20
  );
endmodule
