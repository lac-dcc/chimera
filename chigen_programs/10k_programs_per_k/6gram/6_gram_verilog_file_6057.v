// Seed: 1512609625
module module_0 (
    output tri   id_0,
    output wor   id_1,
    input  uwire id_2,
    output wire  id_3,
    input  tri   id_4,
    output wor   id_5,
    input  uwire id_6,
    output tri0  id_7
);
  assign id_3 = id_6 ? id_6 : 1;
  assign id_5 = id_6;
  wor id_9 = 1'b0;
  specify
    (id_10 => id_11) = 1;
    (negedge id_12 => (id_13 +: id_11#(
        .id_9 (1),
        .id_13(1)
    ))) = (1, 1);
  endspecify
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    output logic id_2,
    input supply1 id_3,
    output tri id_4
);
  initial begin
    {1, id_1} += id_1;
    disable id_0;
    $display(1);
    if (id_1) begin
      if (1'b0) begin
        begin
          disable id_3;
          $display(id_1, id_1);
          if (1) id_2 <= id_0;
        end
      end else begin
        $display;
      end
    end
  end
  module_0(
      id_4, id_4, id_3, id_4, id_3, id_4, id_3, id_4
  );
endmodule
