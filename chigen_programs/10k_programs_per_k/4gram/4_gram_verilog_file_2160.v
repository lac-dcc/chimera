// Seed: 4139716185
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output tri0 id_2,
    input supply1 id_3
);
  parameter id_5 = 1'b0;
  assign id_0 = id_1;
  assign id_2 = id_3;
  wire id_6;
  wire id_7 = id_6;
  wire id_8;
  parameter id_9 = id_5;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  uwire id_4
);
  initial begin : LABEL_0
    id_1 <= id_4;
    disable id_6;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_3
  );
endmodule
