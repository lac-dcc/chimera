// Seed: 3404586266
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
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_13 = id_8;
  supply1 id_14 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1;
  always @* begin : LABEL_0
    #1 id_1 = 1;
    return id_1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  id_2 :
  assert property (@(posedge 1) 1 && id_2(id_2))
  else $display;
  id_3 :
  assert property (@(posedge id_2) 1)
  else $display(id_3, id_3, 1, 1);
endmodule
