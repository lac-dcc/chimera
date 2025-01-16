// Seed: 3582026034
module module_0 (
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_31;
  wire id_32;
  assign id_10 = -1;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    output tri id_3,
    id_6,
    input supply1 id_4
);
  always @(1) id_3 = id_0;
  wire id_7;
  id_8(
      .id_0(1),
      .id_1(),
      .id_2({id_1, (id_6 - (1)), (1), id_1, -1 & ~^ -1, 1, 1'b0, id_0, id_4}),
      .id_3(-1)
  );
  always begin : LABEL_0
    @(1) wait (id_6);
  end
  uwire id_9 = id_2;
  wire  id_10;
  module_0 modCall_1 (
      id_10,
      id_6,
      id_6,
      id_7,
      id_6,
      id_6,
      id_7,
      id_10,
      id_10,
      id_7,
      id_7
  );
endmodule
