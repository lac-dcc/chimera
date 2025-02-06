// Seed: 4265236896
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
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_8[$realtime];
  wire id_10;
  assign module_1.id_10 = 0;
  assign id_5 = (id_6);
  wire  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ;
endmodule
module module_1 (
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
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_9 = $realtime ? id_7 : id_7;
  reg id_10;
  wor id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_11,
      id_7,
      id_11,
      id_2,
      id_11,
      id_3,
      id_11
  );
  always @(id_1) if (1'd0) id_10 <= id_10;
  specify
    (id_12 - => id_13) = (1  : $realtime : -1'b0, id_4  : id_11 + id_1  : id_3[-1]);
    $width(negedge id_14, -1, id_11, id_15);
  endspecify
endmodule
