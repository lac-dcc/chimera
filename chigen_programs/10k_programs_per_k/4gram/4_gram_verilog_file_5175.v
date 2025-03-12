// Seed: 3782898120
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_3 = 32'd66
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  bit id_4;
  always @(id_3 + 1 or id_3)
    case (id_4 - id_2)
      id_2: begin : LABEL_0
        id_4 <= -1'b0;
      end
      default: id_1[1+:id_3] = id_4;
    endcase
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
