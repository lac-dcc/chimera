// Seed: 1856820266
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  inout logic [7:0] id_4;
  output logic [7:0] id_3;
  input wire id_2;
  output reg id_1;
  always @(id_5 && id_4 - id_2 or "")
    if (1) id_3[1] <= id_4;
    else begin : LABEL_0
      if (1) begin : LABEL_1
        $unsigned(32);
        ;
      end else begin : LABEL_2
        id_1 <= -1;
      end
      id_4[1'b0] <= id_4;
    end
endmodule
