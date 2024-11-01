// Seed: 3239528946
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
  wire id_11;
endmodule
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    output logic id_2
);
  reg id_4;
  reg id_5 = id_4;
  always @(posedge id_1 or posedge 1) begin
    id_6();
    id_5 <= (1);
    wait (id_6);
    id_4 <= id_4;
    id_5 <= id_5;
    id_4 <= 1'b0;
    id_2 <= 1'b0;
  end
  id_7 :
  assert property (@(posedge id_7 & id_1) id_0 !=? id_5)
  else $display(id_7, 1, 1);
  if ($display(id_5)) begin
    assign id_7 = 1;
  end else begin : id_8
    for (id_9 = id_7; id_5 & id_9; id_5 = 1'b0) begin : id_10
      assign module_1 = id_4 * 1;
      assign id_8 = 1;
    end
  end
  module_0(
      id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7, id_7
  );
endmodule
