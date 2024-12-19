// Seed: 274766156
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_4(
      .id_0(), .id_1((id_3) && id_2 || 1), .id_2()
  );
  wire id_5;
  wire id_6;
  wire id_7;
  reg id_8, id_9;
  assign id_1 = 1'b0;
  id_10(
      .id_0(id_8),
      .id_1(id_9),
      .id_2(id_1),
      .id_3(1),
      .id_4(id_5),
      .id_5(id_9),
      .id_6((id_1) == 1),
      .id_7(id_6),
      .id_8(id_9),
      .id_9(id_1),
      .id_10(1),
      .id_11(1),
      .id_12(1),
      .id_13(1),
      .id_14(id_9 - !id_9)
  );
  always @(1 or posedge 1'b0) id_9 <= id_9;
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    input logic id_2,
    input logic id_3,
    input logic id_4
);
  initial begin : LABEL_0
    casez (-"")
      id_0: begin : LABEL_0
        id_6[1] = id_6;
      end
      id_0: begin : LABEL_0
        id_7 = (1'd0);
      end
      id_3: id_8 <= 1;
      {
        id_2, id_1, 1, 1
      } : begin : LABEL_0
        id_8 = 1;
        @(id_4) begin : LABEL_0
          id_8 = id_0;
        end
      end
    endcase
  end
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7
  );
endmodule
