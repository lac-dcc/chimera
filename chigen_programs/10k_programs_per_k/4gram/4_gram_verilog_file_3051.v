// Seed: 4034105851
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1
  );
  reg id_4 = -1'h0, id_5;
  wire id_6;
  ;
  bit  id_7;
  wire id_8;
  always @(posedge -1, posedge 1) id_7 = -1'b0;
  always_ff @(posedge 1) begin : LABEL_0
    id_5 <= -1'b0;
    disable id_9;
  end
endmodule
