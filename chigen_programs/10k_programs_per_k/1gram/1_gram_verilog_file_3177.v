// Seed: 1040036622
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_8 <= id_5 ? id_8 : 1;
    begin : LABEL_0
      id_4 <= 1 > 1;
      assign id_4 = id_6 / id_7;
    end
  end
  wire id_9;
  assign id_4 = ~1;
  supply0 id_10;
  reg id_11;
  id_12(
      id_11, 1 == id_1, 1, 1, 1, id_1, id_8, 0
  );
  wire id_13;
  assign {1, 1 >>> id_10, 1, 1, id_10} = id_5;
  wire id_14, id_15, id_16, id_17;
  wire id_18, id_19, id_20;
endmodule
module module_1;
  reg id_2, id_3, id_4;
  id_5 :
  assert property (@(*) id_1) id_3 <= 1'b0;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_4,
      id_5,
      id_5,
      id_4,
      id_3
  );
  assign modCall_1.id_4 = 0;
  id_6(
      1 | id_1 == 1'b0
  );
endmodule
