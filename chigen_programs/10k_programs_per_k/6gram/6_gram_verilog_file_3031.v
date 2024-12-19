// Seed: 2713175598
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = 1;
  always @(posedge 1 or 1) begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge id_3 or negedge 1'b0) begin : LABEL_0
    repeat (id_3)
    #(1 + id_3) begin : LABEL_0
      id_1 <= id_2;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
