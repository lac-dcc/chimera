// Seed: 1018513160
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input  logic id_2
);
  assign id_0 = 1;
  always @(posedge 1'b0) begin : LABEL_0
    if (-1) begin : LABEL_0
      id_1 <= $realtime;
      id_0 <= $realtime;
    end else begin : LABEL_0
      id_1 = id_2;
    end
  end
  logic id_4;
  id_5(
      -1, -1'b0, 1
  );
  always @(id_2 or posedge id_4) begin : LABEL_0
    id_0 = id_2;
  end
  id_6(
      .id_0($realtime), .id_1(), .id_2()
  );
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
