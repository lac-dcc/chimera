// Seed: 3263674814
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd67
) (
    input tri0 id_0,
    output tri _id_1,
    input supply0 id_2
);
  struct packed {
    logic id_4;
    logic [id_1 : -1 'd0] id_5;
  } [1 : id_1] id_6;
  parameter id_7 = -1;
  module_0 modCall_1 (
      id_4,
      id_7
  );
  assign id_6.id_5[$realtime :-1] = {id_2, 1};
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output reg id_1;
  always_ff @(id_2 or posedge id_2) begin : LABEL_0
    id_1 <= id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_2
  );
  logic  id_3;
  string id_4 = "";
endmodule
