// Seed: 2244129449
module module_0 (
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
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_10 = id_8;
  wire id_13;
  assign id_8 = id_11 - id_12;
  wire id_14;
  wire id_15;
  wire id_16;
  final begin : LABEL_0
    id_4 = 1;
  end
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    inout tri  id_2,
    input wand id_3,
    input wand id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  id_7(
      .id_0(id_1), .id_1(id_2), .id_2(1'd0), .id_3(1), .id_4(1)
  );
endmodule
