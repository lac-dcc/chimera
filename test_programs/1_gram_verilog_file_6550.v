// Seed: 2136059845
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  bit id_4 = -1, id_5;
  supply0 id_6;
  always begin : LABEL_0
    #id_7 begin : LABEL_0
      id_6 = ~id_4;
    end
    #1 id_1 <= 1 && id_6;
    @(posedge 1, posedge -1) id_5 <= 1'b0;
  end
  wire id_8;
  wire id_9, id_10;
  assign id_6 = id_10;
  wire id_11, id_12;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_5 :
  assert property (@(posedge id_4, negedge id_4) id_4) id_1 <= id_5;
  always if (-1) @(posedge 1'b0) id_2 = id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_3
  );
endmodule
