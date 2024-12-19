// Seed: 1448673707
module module_0;
  supply0 id_1;
  assign id_1 = 1;
  assign module_2.id_4 = 0;
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
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output logic id_3,
    input supply1 id_4
);
  reg id_6;
  always @(posedge 1'b0) begin : LABEL_0
    if (1'b0 && 1) begin : LABEL_0
      id_3 = #id_7 1;
      if (id_6) begin : LABEL_0
        id_6 <= 1'h0;
      end
    end
  end
  module_0 modCall_1 ();
endmodule
