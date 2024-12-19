// Seed: 1387125301
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(*) begin : LABEL_0
    id_6 = id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3
  );
  generate
    case (id_1)
      1'b0: wire id_4;
      default:
      assign id_2[1 : 1] = 1 == 1;
    endcase
  endgenerate
endmodule
