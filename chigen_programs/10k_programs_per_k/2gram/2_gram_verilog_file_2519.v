// Seed: 2064778926
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  for (id_9 = 1; 1; id_2 = id_7) begin : LABEL_0
    assign id_7[0 : 1] = id_3;
    final id_9 = id_3;
  end
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9,
      id_4,
      id_4
  );
endmodule
