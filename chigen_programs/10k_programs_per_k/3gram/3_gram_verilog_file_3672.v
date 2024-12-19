// Seed: 583015066
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial $display({id_1{~id_3}}, id_1);
  assign module_1.id_1 = 0;
  wire id_5;
  wire id_6;
  wire id_7;
  initial cover (1'b0);
  wire id_8;
endmodule
module module_1;
  assign id_1 = 1;
  if (1'b0) begin : LABEL_0
    assign id_1 = 1;
    if (id_1) begin : LABEL_0
      assign id_1 = 1'b0;
    end else begin : LABEL_0
      assign id_1 = ~id_1;
    end
  end else begin : LABEL_0
    assign id_1 = 1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  final $display(id_1);
endmodule
