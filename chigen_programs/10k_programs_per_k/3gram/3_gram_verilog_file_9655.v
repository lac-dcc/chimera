// Seed: 1445267821
module module_0;
  wire id_1;
  id_3(
      .id_0(id_4), .id_1(1), .id_2(1), .id_3(1 & id_4)
  );
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  logic id_3 = id_0;
  always_latch @(posedge 1'b0 or posedge id_0 / (1) - 1)
    if (id_0) begin : LABEL_0
      #(id_3) begin : LABEL_0
        id_1 = 1'b0;
      end
      id_1 <= -id_0;
    end
  assign id_3 = id_0;
  logic id_4 = 1;
  wire  id_5;
  reg   id_6;
  always_comb @(posedge 1 == 1'd0) begin : LABEL_0
    id_7(id_0);
    id_4 <= id_6;
    id_6 <= 1'b0;
  end
  assign id_3 = id_4;
  wire id_8;
  module_0 modCall_1 ();
  wire id_9;
  assign id_4 = 1;
endmodule
