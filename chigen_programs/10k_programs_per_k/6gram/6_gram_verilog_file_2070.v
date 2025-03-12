// Seed: 1062190364
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
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout tri1 id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_1.id_2 = 0;
  wire id_10;
  assign id_6 = -1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout reg id_2;
  inout wire id_1;
  logic [1 : 1 'd0] id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
  always @(id_2 or ~id_1 == 1 or -1'd0) begin : LABEL_0
    @(posedge id_3);
    #(id_2);
    id_2 = id_3;
    $unsigned(51);
    ;
  end
  assign id_2 = id_3;
  always @(posedge -1 or id_3) begin : LABEL_1
    wait (id_3);
  end
endmodule
