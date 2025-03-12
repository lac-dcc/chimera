// Seed: 782682245
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output tri1 id_2;
  output wire id_1;
  assign id_2 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd58
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  output logic [7:0] id_5;
  input wire id_4;
  input wire _id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_4
  );
  inout reg id_2;
  inout wire id_1;
  localparam id_6 = 1'd0;
  notif1 primCall (id_5, id_2, id_1);
  assign id_2 = id_1#(.id_2('b0)) * -1;
  always_ff @(id_1 or id_4) begin : LABEL_0
    id_2 = 1'd0;
  end
  assign id_5[id_3] = id_4;
endmodule
