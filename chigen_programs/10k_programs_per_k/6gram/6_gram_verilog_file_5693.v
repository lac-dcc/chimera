// Seed: 3174632747
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  wire id_9 = id_7;
  assign id_5 = 1 ? id_4 : 1;
  id_10(
      .id_0(1), .id_1(1'b0 == 1)
  );
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
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  reg id_7 = 1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_4,
      id_2,
      id_2
  );
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 <= 1'h0;
    end else begin : LABEL_0
      if (id_3 - 1) begin : LABEL_0
        id_7 <= 'h0;
        id_1 <= #1 id_3;
      end
    end
  end
endmodule
