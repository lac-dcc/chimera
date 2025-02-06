// Seed: 496671753
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  always @(posedge id_1 or posedge 1'd0) begin : LABEL_0
    id_1 = id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_4 = 0;
  assign id_5 = 1'b0;
  id_7(
      .id_0(id_1),
      .id_1(id_4),
      .id_2(id_2[$realtime]),
      .id_3(id_5),
      .id_4(id_6),
      .id_5(!id_4),
      .id_6(1'b0)
  );
  assign id_5 = -1 && id_6;
  wire id_8;
  wire id_9;
  specify
    (  negedge  id_10  =>  (  id_11  : $realtime )  )  =  (  id_11  : $realtime :  id_11  , $realtime : $realtime : $realtime )  ;
  endspecify
endmodule
