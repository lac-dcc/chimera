// Seed: 139796171
module module_0;
  function automatic id_2;
    input id_3;
    input id_4;
    input id_5, id_6, id_7, id_8;
    reg id_9, id_10;
    if (id_5) begin
      id_4 <= id_4 - id_6 ^ id_10 + 1;
      $display(id_10, id_6, 1, id_4, 1'h0);
      id_8 <= id_4;
      id_3 = 1 == 1;
    end else assign id_5 = id_4;
  endfunction
  reg id_11 = id_10;
  assign #id_12 id_8 = id_9 + 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  reg id_3 = 1;
  always_latch @(posedge id_2) begin
    id_3 <= id_3;
  end
  specify
    (negedge id_4 => (id_5 +: id_4++)) = (1, id_3);
  endspecify module_0();
endmodule
