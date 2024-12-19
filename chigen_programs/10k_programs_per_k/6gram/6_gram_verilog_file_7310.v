// Seed: 3876468390
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_2;
  generate
    if (id_2) assign id_2 = 1;
    else begin : LABEL_0
      assign id_2 = ~id_2 ? 1 : 1;
    end
  endgenerate
  id_3(
      .id_0(1), .id_1(1), .id_2(1 - ""), .id_3(1), .id_4(id_1), .id_5(id_4)
  );
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = id_5;
  always @(posedge 1) begin : LABEL_0
    if (1 >= id_5) id_7 = id_5#(.id_3(1));
    else id_7 = 1 & id_4;
  end
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_4,
      id_6
  );
endmodule
