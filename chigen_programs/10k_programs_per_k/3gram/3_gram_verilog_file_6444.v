// Seed: 3912694622
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_4(
      .id_0(1), .id_1(1), .id_2(1)
  );
  wire id_5;
  id_6(
      .id_0(1), .id_1(1), .id_2((id_1)), .id_3(1), .id_4(1)
  );
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
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8 = id_8;
  always @(posedge id_6[1 : 1] == id_1) begin : LABEL_0
    id_7 = 1;
    id_1 <= 1;
  end
  wire id_10;
  initial begin : LABEL_0
    if (id_5) id_1 = 1;
    else begin : LABEL_0
      if (id_8) begin : LABEL_0
        id_8 <= "";
        $display((id_5), 1, id_2);
      end
    end
    id_7 <= id_5;
  end
  module_0 modCall_1 (
      id_10,
      id_3,
      id_10
  );
endmodule
