// Seed: 3881499232
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri id_5,
    output wor id_6,
    input tri0 id_7,
    output wor id_8,
    output tri1 id_9,
    input tri0 id_10
);
  always @(id_10, posedge 1);
  assign id_2 = 1'b0;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1
);
  tri id_3;
  module_0(
      id_3, id_1, id_3, id_1, id_3, id_1, id_3, id_3, id_3, id_3, id_1
  );
  always_ff @(posedge id_3, posedge id_1 or negedge 1) begin
    id_0 <= 1;
    #1 begin
      $display;
    end
  end
  supply1 id_4 = 1;
  logic [7:0] id_5;
  assign id_5[1] = 1;
  id_6(
      .id_0(1'b0), .id_1(1), .id_2(id_1)
  );
endmodule
