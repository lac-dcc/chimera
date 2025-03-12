// Seed: 3747658606
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  nor primCall (id_6, id_2, id_3, id_5, id_1, id_4, id_7);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1'b0] = id_1;
  always @(id_5, 1 or posedge 1) begin : LABEL_0
    $signed(43);
    ;
  end
endmodule
