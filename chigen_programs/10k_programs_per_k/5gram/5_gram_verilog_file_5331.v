// Seed: 2649845203
module module_0 ();
  logic [7:0] id_1;
  assign id_1 = id_1[1];
  wire id_2;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1
);
  module_0 modCall_1 ();
  assign id_0 = id_1;
  reg id_3;
  always @(posedge id_1)
    if (1) begin : LABEL_0
      if (id_1) begin : LABEL_0
        id_0 <= 1;
      end else id_0 <= 1;
      if (1)
        if (id_3 ^ 1) id_3 <= id_1 - 1;
        else begin : LABEL_0
          id_0 <= 1;
          id_3 <= 1 == 1;
        end
    end else id_0 <= id_1;
  id_4 :
  assert property (@(posedge 1'b0) 1)
  else $display;
endmodule
