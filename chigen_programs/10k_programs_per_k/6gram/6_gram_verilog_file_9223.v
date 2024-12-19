// Seed: 2001068831
module module_0 (
    input  wor   id_0,
    output uwire id_1
);
  assign id_1 = id_0;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    output logic id_4,
    input wire id_5,
    inout wire id_6,
    output wire id_7
);
  assign id_6 = 1;
  wire id_9 = 1;
  always @(id_0 or posedge id_2) begin : LABEL_0
    id_4 <= id_2 == id_0;
  end
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_7
  );
  assign modCall_1.id_0 = 0;
  assign id_4 = 1;
endmodule
