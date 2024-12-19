// Seed: 1711791137
module module_0 ();
  tri id_2 = 1;
  assign id_1 = 1;
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
    id_14
);
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_14 = id_13;
  wire id_15;
  assign id_13 = id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  id_16(
      .id_0(),
      .id_1((1)),
      .id_2(id_10 == 1),
      .id_3(id_9),
      .id_4(id_8),
      .id_5(id_12),
      .id_6(),
      .id_7(1),
      .id_8(!id_1),
      .id_9(1 - 1)
  );
  always @(posedge 1, id_9)
    #1 begin : LABEL_0
      id_2 <= 1;
      begin : LABEL_0
        id_8 <= 1;
        $display(id_16, id_13, id_16);
        id_9 <= id_8;
      end
    end
endmodule
