// Seed: 2300857454
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
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_9(
      .id_0(1)
  );
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  logic id_1,
    output wire  id_2,
    output wire  id_3
);
  logic id_5;
  always @(posedge 1'b0 - id_5 or id_0) begin : LABEL_0
    id_5 = id_1;
  end
  generate
    if ($display()) begin : LABEL_0
      wire id_6;
      always @(posedge 1 or posedge id_1 * id_1 & 1) begin : LABEL_0
        id_5 <= 1;
        deassign id_2;
      end
    end else begin : LABEL_0
      assign id_5 = id_5;
    end
  endgenerate
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
