// Seed: 297368183
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    output uwire id_3,
    output tri0  id_4
);
  wire id_6;
  genvar id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
module module_2 (
    input tri id_0,
    input supply0 id_1,
    input supply1 id_2
    , id_6,
    output logic id_3,
    output tri0 id_4
);
  initial begin : LABEL_0
    id_3 <= id_6 == 1 - 1;
  end
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign id_4 = ($display(id_2 ^ 1));
endmodule
