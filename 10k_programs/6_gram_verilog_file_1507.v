// Seed: 1244976522
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout id_5;
  inout id_4;
  input id_3;
  output id_2;
  input id_1;
  reg id_5;
  assign id_5 = id_5;
  reg id_6;
  always @(posedge 1 or negedge id_5) begin
    id_6 <= 1;
    if (id_4) begin
      id_5 <= 1;
      if (1) begin
        if (id_4) SystemTFIdentifier(1);
      end else begin
        id_4 <= 1;
        id_6 <= id_5;
        if (id_5) id_5 <= 1;
        else begin
          id_4 <= id_5 + 1;
          id_5 <= (id_6) & 1;
        end
      end
    end else id_5 = 1;
  end
endmodule
`default_nettype wire
