// Seed: 4177243494
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_2 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
  always @(posedge 'b0) id_3 = #1 1;
endmodule
