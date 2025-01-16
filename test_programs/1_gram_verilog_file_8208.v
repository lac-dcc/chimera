// Seed: 2978028072
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9 = id_5;
  assign id_3 = id_5;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_6;
  task id_7(output id_8, output id_9);
    id_10(id_6, id_3, id_2 && 1, (-1), id_4, 1 ? id_5 : 1, 1, 1, -1, id_2);
  endtask
  nor primCall (id_1, id_4, id_8, id_7);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_8,
      id_9,
      id_9,
      id_6,
      id_7,
      id_2
  );
  wire id_11, id_12, id_13, id_14;
endmodule
