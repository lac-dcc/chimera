// Seed: 1838505299
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
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 (
    input supply1 id_0,
    input tri0 id_1
);
  assign id_3 = id_1;
  wire id_4;
  tri0 id_5 = id_5 - 1;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5
  );
  tri0 id_7;
  assign id_5 = id_5;
  always begin : LABEL_0
    id_7 = 1;
  end
endmodule
