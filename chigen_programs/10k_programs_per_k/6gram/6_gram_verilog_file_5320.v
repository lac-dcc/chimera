// Seed: 1118460099
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) begin : LABEL_0
    id_2 <= 1;
  end
  id_4(
      .id_0(id_1 + id_3),
      .id_1(id_1),
      .id_2(1),
      .id_3(1),
      .id_4(),
      .id_5(),
      .id_6(1),
      .id_7(1),
      .id_8(id_5),
      .id_9(id_5),
      .id_10(1)
  );
  assign module_1.id_18 = 0;
  wire id_6;
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge id_1 & 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 = #id_17 1;
      if (id_15) begin : LABEL_0
        id_7 <= id_15;
      end
    end
    if (id_12)
      #1 begin : LABEL_0
        id_8 = #id_18 id_5[1];
      end
  end
  module_0 modCall_1 (
      id_4,
      id_17,
      id_6
  );
endmodule
