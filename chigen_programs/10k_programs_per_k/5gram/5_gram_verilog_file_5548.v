// Seed: 152225983
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_18(
      .id_0(1 - 1),
      .id_1(1'b0 + 1'd0 + id_5),
      .id_2(id_14),
      .id_3(1),
      .id_4(id_14),
      .id_5(id_10),
      .id_6(id_10),
      .id_7(1'b0),
      .id_8(id_9),
      .id_9({id_9{1}}),
      .id_10(1)
  );
  assign  id_11  =  1 'b0 ==  id_16  ?  id_6  :  1  ?  1  :  id_16  ?  1 'h0 :  id_15  ?  1  |  1 'b0 :  id_16  ?  id_17  :  id_17  ?  id_8  :  1  ;
  id_19(
      .id_0(1), .min(id_10 == 1), .id_1(id_18), .id_2(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_3 <= 1;
  end
  not primCall (id_4, id_2);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4
  );
  wire id_5;
endmodule
