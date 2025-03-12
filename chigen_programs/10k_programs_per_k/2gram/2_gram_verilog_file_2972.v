// Seed: 2229587342
module module_0 (
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
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire [-1 : -1] id_7;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0
);
  tri0 id_2;
  assign id_2 = -1'b0;
  reg id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_2 = {id_0{~id_3}};
  always begin : LABEL_0
    wait (-1);
  end
  always id_3 <= id_2;
endmodule
