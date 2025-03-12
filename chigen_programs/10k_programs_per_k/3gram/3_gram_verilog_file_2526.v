// Seed: 1038802750
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6 = id_4.id_5(id_2, id_6);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout reg id_1;
  always_ff @(posedge id_2 or id_2 != id_1) begin : LABEL_0
    id_1 <= id_2;
    id_1 <= id_1;
  end
  wire [-1 : -1] id_4;
  always @(posedge 1 or posedge id_4);
  wire id_5, id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_2,
      id_6
  );
endmodule
