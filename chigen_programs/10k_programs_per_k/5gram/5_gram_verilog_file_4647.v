// Seed: 3182399664
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  uwire id_3 = 1;
  assign module_1.type_2 = 0;
  assign id_1 = id_3;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    input  uwire id_2,
    input  logic id_3
);
  wire id_5;
  logic id_6, id_7, id_8;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  id_9 :
  assert property (@(posedge id_9 == -id_7) id_2 * id_7)
  else $display(id_5);
  assign id_7 = 1;
  always @(posedge 1'd0 or posedge id_8) begin : LABEL_0
    #id_10 id_7 <= 1'b0 + 1 - id_2;
    id_1 <= #id_3 $display(1, 1, 1 < id_10++);
    id_6 = id_3;
  end
endmodule
