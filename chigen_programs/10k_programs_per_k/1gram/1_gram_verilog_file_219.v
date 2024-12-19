// Seed: 3351135144
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8, id_9, id_10;
  wire id_11;
endmodule
module module_1 (
    output logic id_0
);
  logic [7:0] id_2;
  tri id_3;
  nor primCall (id_0, id_10, id_6);
  task id_4(input id_5);
    id_0.id_4 <= id_3 * id_2[1];
  endtask
  reg id_6, id_7, id_8;
  assign id_8 = 1;
  wire id_9;
  always id_7 <= id_5;
  logic [7:0][1 : 1] id_10 (
      .id_0(1),
      .id_1(id_6)
  );
  wire id_11;
  reg  id_12 = id_7;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_9,
      id_11,
      id_9,
      id_9,
      id_3
  );
  assign id_0 = 1;
  initial id_11 = 1;
endmodule
