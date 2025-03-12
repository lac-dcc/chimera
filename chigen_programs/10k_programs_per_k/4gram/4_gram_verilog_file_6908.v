// Seed: 525766638
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output uwire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  assign module_1.id_4 = 0;
  inout wire id_1;
  wire id_6;
  localparam id_7 = 1'b0;
  assign id_5 = (id_4 ? -1'h0 * id_7 : -1);
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter \id_5 = 32'd28
) (
    output logic id_0,
    output logic id_1,
    input  uwire id_2
);
  always @(id_2 or posedge id_2) begin : LABEL_0
    id_0 <= id_2;
  end
  initial begin : LABEL_1
    id_1 <= id_2;
  end
  logic id_4 = id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always @(posedge 1);
  assign id_0 = id_4;
  wire _ \id_5 = \id_5 ;
  assign id_4 = 1;
  always_latch @(-1 or posedge id_2 == 1)
    deassign {id_4 >> {-1, 1'b0}, id_2, id_2[\id_5 +: {-1{1}}]};
endmodule
