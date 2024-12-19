// Seed: 1849598732
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge {1{1'h0}}) if (id_3) id_1 <= 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_4;
  always @(1 or posedge 1) begin : LABEL_0
    fork
      $display(1'h0, id_1, id_4, id_2 - 1);
      id_5(id_4++);
    join_any
    id_4 <= id_3;
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5
  );
  always @(posedge id_2 == id_1) begin : LABEL_0
    id_4 <= id_2 & id_4;
    begin : LABEL_0
      id_4 = 1;
    end
  end
endmodule
