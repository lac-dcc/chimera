// Seed: 2983733497
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  always @(posedge id_2)
    if (id_2) begin : LABEL_0
      id_2 <= 1'h0;
    end else begin : LABEL_0
      id_2 = 1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = id_1;
  reg id_6;
  module_0 modCall_1 (
      id_4,
      id_6
  );
  always
    if (1);
    else id_6 <= #1 1;
endmodule
