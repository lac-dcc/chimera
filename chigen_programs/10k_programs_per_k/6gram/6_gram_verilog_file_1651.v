// Seed: 2574872316
module module_0 #(
    parameter id_4 = 32'd33
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [id_4 : -1 'b0] id_5;
  logic id_6 = -1'd0;
endmodule
module module_1 #(
    parameter id_1 = 32'd34,
    parameter id_7 = 32'd49
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output reg id_3;
  output logic [7:0] id_2;
  input wire _id_1;
  assign id_2[id_1] = 1;
  wire id_6;
  always @(-1 or posedge -1) begin : LABEL_0
    assert (1'b0);
  end
  always @(posedge id_5) begin : LABEL_1
    id_2[1] <= id_5;
  end
  parameter id_7 = 1;
  bit   id_8;
  logic id_9;
  ;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_6,
      id_7
  );
  generate
    if (id_7 && -1) begin : LABEL_2
      defparam id_7.id_7 = id_7;
    end else begin : LABEL_3
      always @(posedge -1'b0 or id_6) begin : LABEL_4
        if (id_7 == id_7 && {id_7, -1}) begin : LABEL_5
          $clog2(id_7);
          ;
          id_8 <= -1;
        end else begin : LABEL_6
          id_3 <= 1;
          disable id_10;
        end
      end
    end
  endgenerate
endmodule
