// Seed: 3779272214
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
  assign module_1.id_1 = 0;
  wire id_8;
  assign id_5 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = {id_1, 1'b0};
  tri id_5;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_5
  );
  reg id_6 = 1;
  always @(posedge id_5) begin : LABEL_0
    id_6 <= 1 !=? id_5;
    assign id_5 = 1 ~^ 1;
  end
endmodule
