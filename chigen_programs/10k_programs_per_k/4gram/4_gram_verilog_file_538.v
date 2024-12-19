// Seed: 2030105677
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  supply1  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  =  1  ,  id_18  ;
  wire id_19;
  id_20(
      .id_0(id_2), .id_1(id_16), .id_2(1), .id_3(id_19)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = "";
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
  wire id_7;
  always_ff @(*) begin : LABEL_0
    @(1 or negedge id_4);
    fork
      id_6 <= 1'b0;
      id_6 <= 1;
    join
  end
endmodule
