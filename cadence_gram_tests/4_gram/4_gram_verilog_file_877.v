// Seed: 1370080657
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_7(
      .id_0(),
      .id_1(-1'b0),
      .id_2(id_6 == -1),
      .id_3(!id_5),
      .id_4(),
      .id_5(1),
      .id_6(($realtime)),
      .id_7()
  );
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8 = id_4;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_5,
      id_2,
      id_7,
      id_5
  );
  always @(posedge $realtime or $realtime) begin : LABEL_0
    id_2 = $realtime;
    id_9(id_6);
  end
  parameter id_10 = id_6;
  specify
  endspecify
endmodule
