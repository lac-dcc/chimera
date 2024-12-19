// Seed: 553938805
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2[1'b0] = id_3;
  assign id_3 = id_2;
  wire id_5;
  specify
    (id_6 => id_7) = 1;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(1 or posedge id_3 == 1) begin : LABEL_0
    id_2[1] <= 1;
  end
  not primCall (id_2, id_3);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3
  );
endmodule
