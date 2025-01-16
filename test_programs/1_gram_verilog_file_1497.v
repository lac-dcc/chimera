// Seed: 3759038962
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
  assign module_1.id_1 = 0;
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
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  integer id_10;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_10
  );
  wire id_11;
  wire id_12;
  always id_5 <= id_8;
  always begin : LABEL_0
    id_3 <= 1;
    id_1 = -1;
    begin : LABEL_0
      if (id_4.id_7) id_3 = {id_9};
    end
    begin : LABEL_0
      @(posedge -1) id_6 = 1'b0;
      #1 id_9 <= 1;
      id_5 = id_2 - 1'b0;
      id_6 <= -1;
    end
  end
endmodule
