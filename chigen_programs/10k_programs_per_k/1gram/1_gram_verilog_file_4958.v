// Seed: 1182429483
module module_0 (
    input supply1 id_0
);
  always begin
    id_2 = 1'h0;
    $display;
  end
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input uwire id_2,
    output uwire id_3,
    input supply1 id_4,
    output uwire id_5,
    input wire id_6,
    input tri0 id_7
);
  uwire id_9;
  module_0(
      id_4
  );
  wor id_10, id_11;
  assign id_9 = {id_10 ? id_1 : 1'b0};
  generate
    wire id_12;
    assign id_11 = id_7 ^ $display(1, id_6, id_9, 1);
    begin
      initial id_11 = !id_4;
    end
  endgenerate
endmodule
