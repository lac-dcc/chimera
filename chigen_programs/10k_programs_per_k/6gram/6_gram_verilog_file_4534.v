// Seed: 1869093809
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @("" or 1)
    if (id_2) id_7 = 1;
    else begin : LABEL_0
      id_6 = id_5;
    end
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_1,
      id_4,
      id_1,
      id_1
  );
  always @(1 or 1'b0) begin : LABEL_0
    id_3 = #id_5 1;
  end
endmodule
