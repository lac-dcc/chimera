// Seed: 1555575684
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  bit id_5;
  wire id_6, id_7;
  initial begin : LABEL_0
    $clog2(4);
    ;
    id_5 = "";
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2
  );
  inout wire id_2;
  input wire id_1;
  logic id_4;
  ;
  always @(id_4 or posedge id_1);
endmodule
