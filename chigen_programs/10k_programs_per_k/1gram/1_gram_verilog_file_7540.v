// Seed: 705842279
module module_0;
  logic [7:0] id_1, id_2;
  assign id_2 = id_2[-1'b0][1'b0 : 1&&-1'b0];
  tri0 id_3, id_4, id_5, id_6, id_7;
  assign id_4 = -1'b0;
  assign id_3 = 1;
  id_8(
      id_2
  );
endmodule
module module_1 #(
    parameter id_6 = 32'd16
) (
    id_1,
    id_2,
    id_3,
    id_4[-1 : id_6],
    id_5,
    _id_6
);
  inout wire _id_6;
  input wire id_5;
  input logic [7:0] id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_6 = 0;
  output reg id_1;
  id_7 :
  assert property (@(id_2) 1)
    casez ((id_2))
      id_4: id_1 <= -1'b0;
      id_6: id_7 <= -1;
      id_7: @(negedge -1) wait (id_3) id_3[1] <= id_6;
    endcase
endmodule
