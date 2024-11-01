// Seed: 1139464357
module module_0 (
    input wire id_0,
    output wire id_1,
    input tri id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply0 id_5
);
  assign id_4 = 1 ? id_5 : (1);
  function automatic id_7;
    input id_8;
    input id_9;
    begin
      wait (1);
    end
  endfunction
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    input wire id_2,
    output logic id_3,
    output tri1 id_4,
    output supply0 id_5,
    input wire id_6,
    input wire id_7,
    input supply1 id_8,
    input uwire id_9
);
  integer id_11 (.id_0(1'h0));
  always_latch @* begin
    wait (id_9);
    id_3 <= 1 - id_1;
  end
  xor (id_3, id_9, id_8, id_0, id_11, id_7);
  module_0(
      id_2, id_5, id_1, id_9, id_4, id_1
  );
endmodule
