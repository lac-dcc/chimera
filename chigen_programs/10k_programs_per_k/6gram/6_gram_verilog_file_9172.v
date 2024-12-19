// Seed: 1510057065
module module_0 #(
    parameter id_22 = 32'd96,
    parameter id_23 = 32'd67
) ();
  supply1  id_1  ,  id_2  ,  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ;
  defparam id_22.id_23 = id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_23 = 0;
  id_7(
      .id_0(id_3), .id_1(1), .id_2(1), .id_3(1), .id_4(id_6), .id_5()
  );
  always @(posedge 1) begin : LABEL_0
    id_6 <= 1;
  end
endmodule
