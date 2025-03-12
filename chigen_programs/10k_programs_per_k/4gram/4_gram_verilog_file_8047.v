// Seed: 541293470
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_5 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd28,
    parameter id_2 = 32'd29,
    parameter id_3 = 32'd76
) (
    _id_1,
    _id_2,
    _id_3
);
  input wire _id_3;
  inout wire _id_2;
  output wire _id_1;
  wire id_4 = id_2;
  union packed {
    struct packed {
      logic [1 : id_1] id_5;
      logic [id_1 : (  id_3  )] id_6;
    } [id_1 : id_2  -  1] id_7;
    logic [id_3 : -1 'b0] id_8;
  } id_9;
  ;
  if (1'h0) begin : LABEL_0
    assign id_9.id_6 = 1;
  end
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_5
  );
endmodule
