// Seed: 1021448021
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  assign id_4 = 1 - 1;
  assign id_1 = id_4;
  function id_5;
    input id_6;
    begin
      deassign id_3;
      if (1'h0) begin
        id_6 <= 1;
      end else begin
        wait (1);
      end
    end
  endfunction
  wire id_7;
  assign id_5 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8, id_9;
  module_0(
      id_4, id_9, id_6
  );
  assign id_2[1] = 1;
  id_10(
      .id_0(), .id_1(id_8)
  );
endmodule
