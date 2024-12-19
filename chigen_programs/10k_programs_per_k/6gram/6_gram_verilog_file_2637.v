// Seed: 220506147
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign module_1.id_3 = 0;
  id_6(
      .id_0(id_3), .id_1(""), .id_2(1), .id_3(id_1), .id_4(1'b0), .id_5(id_2), .id_6(id_1)
  );
  wire id_7;
endmodule
module module_1 (
    input  wor   id_0,
    input  wor   id_1,
    output uwire id_2,
    input  logic id_3,
    output uwire id_4,
    input  uwire id_5,
    output logic id_6
);
  assign id_2 = $display;
  wire id_8;
  always @(posedge 1 or id_0) begin : LABEL_0
    if (1 - 1) begin : LABEL_0
      id_6 <= id_3;
    end else disable id_9;
  end
  always @(negedge 1) begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
endmodule
