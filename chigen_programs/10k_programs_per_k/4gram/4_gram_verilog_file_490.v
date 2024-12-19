// Seed: 358856936
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_12(
      .id_0(1'h0),
      .id_1(id_9),
      .id_2(1'b0),
      .id_3(id_1),
      .id_4(1),
      .id_5(id_7),
      .id_6(1),
      .id_7(1),
      .id_8({1'b0{1'b0}} ^ 1),
      .id_9(id_11),
      .id_10(1'b0),
      .id_11(1),
      .id_12(1'b0),
      .id_13(id_6),
      .id_14(id_6),
      .id_15(id_3 - 1)
  );
  wire id_13 = id_7;
  wire id_14;
endmodule
module module_1 (
    output tri0 id_0,
    output tri0 id_1
);
  task id_3;
    input id_4;
    begin : LABEL_0
      id_0 = 1;
    end
  endtask
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4
  );
endmodule
