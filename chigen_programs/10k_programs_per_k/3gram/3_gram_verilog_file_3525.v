// Seed: 3067377477
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
endmodule
module module_1;
  assign id_1 = {id_1{1}};
  wire id_3;
  always @(id_1 or posedge 1) begin : LABEL_0
    id_2 <= id_1;
  end
  always_ff @(posedge id_1);
  initial begin : LABEL_0
    id_4 = 1;
    id_1 = 1'b0;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_6;
  wire id_7;
endmodule
