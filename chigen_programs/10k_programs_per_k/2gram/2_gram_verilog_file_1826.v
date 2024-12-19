// Seed: 1024282332
module module_0 (
    input  supply0 id_0,
    input  supply1 id_1,
    output supply1 id_2
);
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    input tri1 id_2,
    input wire id_3,
    input supply1 id_4,
    output logic id_5,
    output tri1 id_6
);
  always @(id_3 or posedge id_4) begin : LABEL_0
    id_5 <= ~^id_2;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.id_2 = 0;
  wire id_8 = 1'd0;
  assign id_6 = 1;
  always id_5 <= 1;
  assign id_0 = id_1;
  wire id_9;
  wire id_10;
endmodule
