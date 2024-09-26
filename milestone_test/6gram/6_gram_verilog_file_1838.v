// Seed: 3024106385
`default_nettype id_0
module module_0 (
    output id_0,
    input id_1,
    input logic id_2,
    input logic id_3,
    input logic id_4
);
  assign id_0 = ~|id_3;
  type_13(
      1, id_0, 1, 1'h0
  ); type_14(
      id_1, id_2, 1
  );
  task automatic id_5;
    begin
      if (id_1) begin
        if (1'b0) id_0 = (id_3) - 1;
      end
    end
  endtask
  function id_6;
    real id_7;
    input id_8;
    begin
      if (id_5) id_6 <= (1);
    end
  endfunction
  logic id_9;
endmodule
