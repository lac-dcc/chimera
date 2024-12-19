// Seed: 796725684
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1;
  reg id_2;
  always id_2 = id_2;
  final begin : LABEL_0
    id_2 <= id_1;
    `define pp_3 0
    @(posedge 1 ^ 1) begin : LABEL_0
      assume (id_1)
      else;
      if (1) begin : LABEL_0
        if (1 ^ 1) begin : LABEL_0
          id_1 <= {1{1'b0}};
        end else @(posedge 1'b0 or negedge id_2) `pp_3 = 1;
      end
      if (`pp_3) begin : LABEL_0
        if (1)
          if (1) #1;
          else id_1 = 1;
      end else begin : LABEL_0
        `pp_3[1] = id_2;
      end
      id_2 <= #1 1;
    end
  end
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  assign id_4 = id_4;
  id_5(
      .id_0(1),
      .id_1(id_1),
      .id_2(~1),
      .id_3(id_1 + 1'h0 & 1),
      .id_4(1'b0 <-> id_2),
      .id_5(1 - ~id_2),
      .id_6(id_2)
  );
endmodule
