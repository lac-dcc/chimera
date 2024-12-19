// Seed: 2922659815
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_5;
  assign id_1 = id_5;
  always @(id_3 or id_4) begin : LABEL_0
    id_1 <= id_2;
    if ("") begin : LABEL_0
      id_4 <= id_3;
    end else begin : LABEL_0
      id_5 = 1;
    end
  end
  wire id_6;
  wire id_7;
  id_8(
      .id_0(id_6), .id_1(1), .id_2(1), .id_3(id_6), .id_4(1 | 1), .id_5(id_7)
  );
  assign id_1 = id_2;
  assign id_5 = 1;
endmodule
module module_1;
  always @(id_1 or posedge 1) begin : LABEL_0
    id_1 <= id_1;
  end
  always
    if (~(1)) id_1 = 1;
    else if (id_1) begin : LABEL_0
      id_1 <= 1;
      #1 $display(id_1, 1 << 1);
    end else id_1 <= 1'd0 & "";
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
