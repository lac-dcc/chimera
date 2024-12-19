// Seed: 1122666889
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge id_6) begin : LABEL_0
    begin : LABEL_0
      if (id_3++) id_4 <= 1;
    end
    id_4 = #1 1;
  end
  assign id_2 = ('b0);
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_7,
      id_3
  );
endmodule
