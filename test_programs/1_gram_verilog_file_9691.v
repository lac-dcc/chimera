// Seed: 2602553534
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri1 id_6, id_7, id_8, id_9;
  id_10 :
  assert property (@(posedge id_6) -1) begin : LABEL_0
    begin : LABEL_0
      force id_8 = 1;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
