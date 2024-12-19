// Seed: 2752552797
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_2 <= id_3;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_3)
    if (id_2) begin : LABEL_0
      begin : LABEL_0
        id_3 = id_3;
        id_4 <= id_3;
        begin : LABEL_0
          assert (1'b0) $display(1);
        end
      end
    end
  integer id_5 (
      .id_0({(id_4) {(id_3)}}),
      .id_1(1),
      .id_2(1),
      .id_3(id_1),
      .id_4(1'h0)
  );
  or primCall (id_4, id_5, id_2, id_3);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
