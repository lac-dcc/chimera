// Seed: 982685213
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
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_12, id_13 = id_1 & id_12 && 1;
  initial begin : LABEL_0
    #1 begin : LABEL_0
      id_11.id_4 <= id_7;
    end
  end
  wire id_14, id_15;
endmodule
module module_1;
  int id_1;
  final
    @(posedge id_1)
      if (id_1) id_2 = -1'b0;
      else id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1
  );
endmodule
