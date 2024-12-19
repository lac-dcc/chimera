// Seed: 1806206127
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    for (id_5 = 1; id_2 == 1; id_4 = id_3) #1;
    id_3 = 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  supply0 id_6 = 1;
  wor id_7 = id_6 ^ id_1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1
  );
endmodule
