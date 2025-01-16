// Seed: 1382821080
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
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_13(
      .id_0(id_3)
  );
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
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  final begin : LABEL_0
    begin : LABEL_0
      if (-1) id_1 <= id_8;
    end
  end
  assign id_10 = 'b0;
  xnor primCall (id_10, id_11, id_6, id_8, id_4, id_7, id_5, id_9);
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_6,
      id_7,
      id_9,
      id_11
  );
endmodule
