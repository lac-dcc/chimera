// Seed: 4265899661
module module_0 (
    input tri0 id_0,
    input wor  id_1
);
  logic id_3;
  ;
  always @(posedge id_0, posedge -1) begin : LABEL_0
    case (id_1)
      id_3: id_3 = 1;
      1: id_3 = 1;
      -1: begin : LABEL_1
        disable id_4;
      end
    endcase
  end
  assign module_1.id_3 = 0;
  wire id_5;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output logic id_2,
    input wire id_3,
    output tri id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 id_7
);
  assign id_4 = -1;
  module_0 modCall_1 (
      id_7,
      id_5
  );
  initial begin : LABEL_0
    id_2 = "";
  end
endmodule
