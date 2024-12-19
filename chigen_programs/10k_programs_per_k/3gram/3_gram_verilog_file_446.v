// Seed: 2281803826
module module_0 (
    id_1
);
  input wire id_1;
  always @(posedge {id_1,
    1
  })
  begin : LABEL_0
    if (1) id_2 <= 1 | 1 - id_2;
    else id_2 = 1;
  end
  always @(1) begin : LABEL_0
    id_3 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_4(
      .id_0(id_3), .id_1(1), .id_2(1), .id_3(1), .id_4(1)
  );
  module_0 modCall_1 (id_2);
  string id_5 = "";
endmodule
