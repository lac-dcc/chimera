// Seed: 2714616791
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_9(
      .id_0(1), .id_1(id_6), .id_2(id_7)
  );
  initial begin : LABEL_0
    #1 begin : LABEL_0
      disable id_10;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1 or posedge id_1(id_1,
      id_2
  ) - 1)
  begin : LABEL_0
    id_2 <= id_2;
  end
  wire id_4;
  wire id_5;
  wire id_6 = id_5;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5
  );
endmodule
