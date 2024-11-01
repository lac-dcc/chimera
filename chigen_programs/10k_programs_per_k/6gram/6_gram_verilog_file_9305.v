// Seed: 2245784334
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_5 or 1) begin : id_7
    id_6 <= 1'b0;
    disable module_0;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_5(
      id_1, id_4, 1'b0
  );
  initial begin
    $display(1, id_2, 1, 1, 1);
    if (1 === ~id_1) begin
      disable id_6;
      if (1) begin
        #1;
        id_1 <= 1'b0;
      end
    end
  end
  module_0(
      id_2, id_2, id_3, id_2, id_2, id_4
  );
endmodule
