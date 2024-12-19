// Seed: 3632340534
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
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(id_2 or negedge id_2) begin : LABEL_0
    id_6 = #id_7 1 > (1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_6;
  xnor primCall (id_4, id_3, id_2, id_1, id_6, id_5);
  always id_6 = #1 id_3;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_2,
      id_2,
      id_3
  );
endmodule
