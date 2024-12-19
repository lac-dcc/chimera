// Seed: 3651292607
module module_0 (
    input uwire id_0,
    output wor id_1,
    output wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri id_6,
    output uwire id_7,
    input wire id_8,
    output tri0 id_9,
    input supply1 id_10,
    input wor id_11,
    output uwire id_12
);
  id_14(
      .id_0(id_15), .id_1(id_0), .id_2(id_15), .id_3(1)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output wire id_2,
    input logic id_3,
    output uwire id_4
);
  wire  module_1;
  logic id_6;
  always @(*) begin : LABEL_0
    begin : LABEL_0
      if (!id_1) begin : LABEL_0
        if (id_6 && 1) begin : LABEL_0
          id_6 <= id_6;
        end
      end else id_6 <= id_6;
    end
    if (id_0 && id_0) begin : LABEL_0
      deassign id_2;
    end
  end
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_4,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
  assign id_2 = id_0 == 1;
  assign id_6 = id_3;
endmodule
