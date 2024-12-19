// Seed: 721196669
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_3 <= 1;
    $display(1, id_2 == id_1, 1);
    wait (1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial id_3 = #1 1 <= id_4;
  assign id_4 = id_3;
  wire id_5;
  assign id_4 = id_3;
  notif0 primCall (id_4, id_5, id_3);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_3,
      id_5
  );
  always @(id_4) begin : LABEL_0
    id_1 <= id_4;
    id_2 = id_5;
  end
endmodule
