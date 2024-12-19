// Seed: 1724340296
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
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  supply0 id_11;
  wire id_12;
  assign #id_13 id_11 = 1'b0;
  id_14 :
  assert property (@(posedge 1) 1)
  else begin : LABEL_0
    id_14 <= (id_14);
  end
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
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_9,
      id_9,
      id_4,
      id_7,
      id_7,
      id_4,
      id_1
  );
endmodule
