// Seed: 4239285218
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3,
    input tri1 id_4
);
  integer id_6;
  initial begin : LABEL_0
    id_6 = id_4;
  end
  uwire id_7;
  assign id_7 = id_4;
  assign id_7 = id_2;
  assign module_1.type_2 = 0;
  tri id_8 = id_2;
  assign id_6 = id_2 == id_6;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    input  tri   id_2,
    input  logic id_3,
    output tri1  id_4
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_4,
      id_2
  );
  logic id_6;
  assign id_1 = id_3;
  wire id_7;
  always @(posedge id_3 or posedge id_6)
    if (1'b0) id_1 <= id_0;
    else assume (id_0);
  wire id_8;
  wire id_9;
  wire id_10;
  wor  id_11 = 1;
  wire id_12;
endmodule
