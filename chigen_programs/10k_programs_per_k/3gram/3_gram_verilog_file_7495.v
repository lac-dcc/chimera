// Seed: 1208556162
module module_0;
  always @(posedge 1'b0) id_1 <= 1;
  assign id_1 = id_1 == 0;
  wire  id_2  ,  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  assign id_1 = id_0;
  module_0();
  assign id_1 = id_0;
  id_3 :
  assert property (@(posedge (id_1++)) id_3 ^ id_0)
  else begin
    id_1 = id_3;
    id_1 <= id_3;
  end
endmodule
