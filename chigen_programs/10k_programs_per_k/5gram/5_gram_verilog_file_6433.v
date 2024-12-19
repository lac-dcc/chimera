// Seed: 3058698393
module module_0;
  assign id_1 = 1;
endmodule
module module_1;
  assign id_1 = 1'b0 - 1 ? id_1 : {1, 1};
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(*) begin : LABEL_0
    if (1) begin : LABEL_0
      id_1 <= id_1;
      $display("", ~id_1);
    end else begin : LABEL_0
      id_1 <= 1;
      id_1 = #1 1 + "";
    end
  end
  assign id_1 = "" == 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  assign id_2 = id_3;
  module_0 modCall_1 ();
  assign id_2 = 1;
endmodule
