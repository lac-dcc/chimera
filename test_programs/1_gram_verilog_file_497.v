// Seed: 1874576805
module module_0 (
    id_1
);
  output wire id_1;
  parameter id_2 = id_2;
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
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_13(
      id_7
  );
  always
    if (id_1) begin : LABEL_0
      @(posedge -1 or posedge id_8) return 1;
      $display(-1);
      id_4 = id_7;
      $display(id_7, 1);
      begin : LABEL_0
        id_12 <= id_7;
      end
    end else $display(id_8);
  xnor primCall (id_3, id_7, id_1, id_13, id_9, id_12, id_14);
  wire id_14;
  module_0 modCall_1 (id_3);
  initial id_5 <= 1;
endmodule
