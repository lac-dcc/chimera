// Seed: 699062154
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout supply0 id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout logic [7:0] id_8;
  output wire id_7;
  or primCall (id_2, id_1, id_3, id_8);
  output wire id_6;
  output wire id_5;
  input wire _id_4;
  inout logic [7:0] id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  always_latch @(posedge 1) begin : LABEL_0
    if (1 == 1) begin : LABEL_1
      $unsigned(79);
      ;
      id_8[1'b0] <= id_3[id_4];
    end
  end
  integer [-1 : -1 'd0 ==  1] id_9;
  ;
  assign id_2[1] = id_3[-1'b0] - id_4;
endmodule
