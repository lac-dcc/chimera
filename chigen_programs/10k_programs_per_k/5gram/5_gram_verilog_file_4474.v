// Seed: 1674061410
module module_0 ();
  always @(negedge 1)
    if (1'h0) begin
      $display(id_1, 1'b0);
    end else deassign id_2;
  function automatic id_3;
    input id_4;
    begin
      id_2 = id_2;
    end
  endfunction
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1
);
  assign id_3 = 1;
  module_0();
  supply0 id_4;
  generate
    for (id_5 = id_1 & ~id_1; id_1; id_3 = id_0) begin : id_6
      id_7(
          .id_0(id_6 ==? id_5), .id_1(id_5), .id_2(id_0)
      );
    end
  endgenerate
  always @(posedge id_1) id_4 = 1'd0;
endmodule
