module cpu_registers(
  input wire clk,
  input wire [7:0] data_in,
  input wire [2:0] sel_in,
  input wire [2:0] sel_out,
  input wire enable_write,
  input wire output_enable,
  output wire [7:0] data_out,
  output wire [7:0] rega,
  output wire [7:0] regb
);

  reg [7:0] registers[0:7];

  always @ (posedge clk) begin
    if (enable_write)
      registers[sel_in] = data_in;
  end

  assign data_out = (output_enable) ? registers[sel_out] : 'bz;

  wire [7:0] regc, regd, rege, regf, regg, regt;
  assign rega = registers[0];
  assign regb = registers[1];
  assign regc = registers[2];
  assign regd = registers[3];
  assign rege = registers[4];
  assign regf = registers[5];
  assign regg = registers[6];
  assign regt = registers[7];

endmodule
