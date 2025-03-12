// Seed: 3260718278
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
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
    id_9
);
  inout wire id_9;
  output logic [7:0] id_8;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_5,
      id_9,
      id_6
  );
  inout logic [7:0] id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    fork
      id_8[-1] <= id_7[1];
    join_any
  end
endmodule
